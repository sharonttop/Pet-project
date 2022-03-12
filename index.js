require("dotenv").config(); // 載入 .env 的設定

const express = require("express");

const app = express();
const multer = require("multer"); //檔案上傳功能，但不是很常用
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "public/tmp_uploads/");
  },
  filename: function (req, file, cb) {
    cb(
      null,
      file.originalname.split(".")[0] +
        "-" +
        Date.now() +
        "." +
        file.mimetype.slice(
          file.mimetype.indexOf("/") + 1,
          file.mimetype.length
        )
    );
  },
});
const upload = multer({ storage: storage });
// const upload = multer({dest:'tmp_uploads/'})
const uploadImg = require("./modules/upload-images");

app.set("view engine", "ejs");

const Joi = require("joi");
// const joiCross = require('./modules/joi');

const session = require("express-session");
const jwt = require("jsonwebtoken");
const MysqlStore = require("express-mysql-session")(session); //用來記錄用戶的session到資料表

const fs = require("fs").promises;
const cors = require("cors");

const moment = require("moment-timezone");

const db = require("./modules/connect-mysql");
const sessionStore = new MysqlStore({}, db);

const corsOptions = {
  credentials: true,
  origin: (origin, cb) => {
    console.log(`origin: ${origin}`);
    cb(null, true);
  },
};
app.use(cors(corsOptions));
// app.use(cors());//如果放到後面，必須放在靜態資料夾之前，同樣是use還是會有優先順序的問題。Access-Control-Allow-Origin: *會全開。

app.use(
  session({
    name: "mySessionID", //可以修改Application的cookie原本的name(原為connect.sid)，也可以不用改
    saveUninitialized: false,
    resave: false, //強制回存
    store: sessionStore, //session存放資料cookie的位置，2021 09 10 09 01 20 00:30:03
    secret: "erw3r3243243wr2323tewr", //key字串隨便設定，加密用設定
    cookie: {
      maxAge: 1200000, //最多停留20分鐘，單位毫秒
    },
  })
);

//Toplevel-middleware

app.use(express.urlencoded({ extended: false })); //設定為false代表不使用qs套件，處理大量資料才需要使用

app.use(express.json());

const urlencodedParser = express.urlencoded({ extended: false });

//app.use()的方法代表所有方法都可以進來，和app.get()post()只接受他們方法不同
app.use(express.static("public"));
//如果在好幾層資料夾裡可以用app.use(express.static(__dirname+'/public'));
app.use("/jquery", express.static("node_modules/jquery/dist"));
app.use("/bootstrap", express.static("node_modules/bootstrap/dist"));
//靜態middleware之前
app.use(async (req, res, next) => {
  res.locals.title = "寵物網站"; //頂層的middleware
  res.locals.pageName = "";
  res.locals.keyword = "";

  // 設定template 的helper functions ，建立一個全站都可用的middleware)01:01:00
  res.locals.dateToDateString = (d) => moment(d).format("YYYY-MM-DD");
  res.locals.dateToDateTimeString = (d) =>
    moment(d).format("YYYY-MM-DD HH:mm:ss");
  // const fm = 'YYYY-MM-DD HH:mm:ss';

  res.locals.session = req.session; //把session的資料傳到ejs

  // jwt 驗證  2021 09 15 15 50 29  00:42:10
  //用token就算domain(主機)不同也可抓到，session如果不同domain可能抓不到值
  req.myAuth = null; // 自訂的屬性 myAuth
  const auth = req.get("Authorization"); //抓到token
  if (auth && auth.indexOf("Bearer ") === 0) {
    //選取有Authorization，且用indexOf找內有含Bearer的部分符合才往下找
    const token = auth.slice(7);
    //抓header的Authorization:Bearer 往後為加密token...因此要從第七個空格(Bearer )以後開始取token的值
    try {
      req.myAuth = await jwt.verify(token, process.env.JWT_SECRET); //解密
      console.log("req.myAuth:", req.myAuth);
    } catch (ex) {
      console.log("jwt-ex:", ex);
    }
  }

  next();
});
// *** 路由定義開始 :BEGIN--------------------------------------------------------------

app.get("/", (req, res) => {
  res.locals.title = "首頁-" + res.locals.title;
  // res.send(`<h2>Hello</h2>`);
  res.render("home", { name: "Sharon" });
});

//路由模組化-middleware，拆開來到別的檔案方便管理
app.use("/", require("./routes/login"));
app.use("/customers", require("./routes/customers"));

app.get("/try-sess", (req, res) => {
  //myVar自己設定自己取
  req.session.myVar = req.session.myVar || 0;
  req.session.myVar++;

  res.json(req.session);
});

app.post("/try-upload2", uploadImg.single("avatar"), async (req, res) => {
  res.json(req.file);
  //單一檔案上傳，圖片名稱暗碼
});

//抓取會員資料會用到自訂的屬性 myAuth(上面要注意複製)
app.get("/auth-token", async (req, res) => {
  // res.json(req.body);
  const output = {
    success: false,
    postData: req.body,
    error: "",
  };
  let r;
  if (req.myAuth && req.myAuth.id) {
    output.member = req.myAuth;
    output.success = true;
    const sql = "SELECT * FROM `members` WHERE id=?";
    [r] = await db.query(sql, [req.myAuth.id]);
  } else {
    output.error = "沒有 token 或者 token 不合法";
  }

  //SELECT `id`, `avatar`, `name`, `nickname`, `email`, `password`, `mobile`, `birthday`, `address`, `hash`, `activated`, `create_at`, `coupon_signup`(註冊預設空值，設定為datetime), `coupon_petid`(註冊呈現空值，登入寵物id時給一個日期), FROM `members` WHERE 1

  res.json(r ? r[0] : {});
});

//編輯會員資料
app.put("/auth-token", async (req, res) => {
  // res.json(req.body);
  const output = {
    success: false,
    postData: req.body,
    error: "",
  };

  if (req.myAuth && req.myAuth.id) {
    output.member = req.myAuth;
    output.success = true;
  } else {
    output.error = "沒有 token 或者 token 不合法";
  }

  const sql = "UPDATE `members` SET ? WHERE id=?";
  const [r] = await db.query(sql, [req.body, req.myAuth.id]);
  res.json(r);
});

//寵物ID建立成功匯入資料庫建立時間
app.put("/petid-coupon", async (req, res) => {
  // res.json(req.body);
  const output = {
    success: false,
    postData: req.body,
    error: "",
  };

  const sql = "UPDATE members SET `coupon_petid`=? WHERE id=?";

  let result; //在外面使用時，一定要加

  //建立時間點，於此時間2021-11-04 19:09:47之後購物車可以抓到優惠券
  [result] = await db.query(
    sql,
    ["2021-11-04 19:09:47", req.myAuth.id],
    function (err, rows) {
      //r[0].id從上面req.myAuth.id取值
      //用於除錯
      if (err) {
        console.log(err, "err");
      } else {
        console.log(rows, "rows");
      }
    }
  );

  console.log([result]);

  if (result.affectedRows === 1) {
    output.success = true;
  } else {
    output.error = "寵物ID登入失敗";
  }

  res.json(output);
});

app.get("/try-uploads", async (req, res) => {
  try {
    //SELECT * FROM `members_pet_id` WHERE `user_id`=134;
    const sql = "SELECT * FROM `members_pet_id` WHERE `user_id`=?";
    [r] = await db.query(sql, [req.myAuth.id], function (err, rows) {
      //用於除錯
      if (err) {
        console.log(err, "err");
      } else {
        console.log(rows, "rows");
      }
    });

    // console.log("[r]", [r]);
    res.json(r);
  } catch (e) {
    Error(e);
  }
});

// 寵物id
app.post("/try-uploads", upload.array("pet_avatar[]"), async (req, res) => {
  // id: 1;
  // petImgSrc: "blob:http://localhost:3000/a841a307-5bbb-4954-b2e4-91c90548c9ff";
  // pet_avatar: "";
  // pet_birthday: "2022-03-18";
  // pet_breed: "狗";
  // pet_name: "asd";
  try {
    const {
      pet_name,
      pet_breed,
      pet_birthday,
      user_id,
      pet_avatar,
      pet_id,
      isFileUpload,
      delArray,
    } = req.body;

    // 所有上傳的圖檔檔名
    const petImgNames = [];
    const result = await req.files.map(({ mimetype, filename, size }) => {
      petImgNames.push(filename);
      return { mimetype, filename, size };
    });

    // 所有圖檔新增的資訊：整理每一筆資料是否有圖片，有圖就按新增順序給fileIndex，這數字代表node收到的檔案順序，到時再用這個數字可以拿到正確的圖檔。
    let fileIndex = 0; //第一張傳入的圖為req.files[0]
    const fileIndexArray = isFileUpload.map((v, i) => {
      const result = !!v ? fileIndex++ : "nopic";
      //!!v 轉成布林值，判斷是否為新增的圖檔，舊的圖就為nopic
      return result;
    });

    // SQL 新增資料語法
    const sqlInsertData =
      "INSERT INTO `members_pet_id`" +
      "(`user_id`, `pet_avatar`, `pet_name`, `pet_breed`, `pet_birthday`,`create_at`)" +
      "VALUES (?, ?, ?, ?, ?, NOW())";

    // SQL 修改資料(無更新圖片)語法
    const sqlUpdateNoPic =
      "UPDATE `members_pet_id` SET `pet_name`=?,`pet_breed`=?,`pet_birthday`=? WHERE `pet_id`= ?";

    // SQL 修改資料(有更新圖片)語法
    const sqlUpdate =
      "UPDATE `members_pet_id` SET  `pet_avatar`=?, `pet_name`=?,`pet_breed`=?,`pet_birthday`=? WHERE `pet_id`= ?";

    let i;
    let petIdRow;
    let inserPetId;
    let UpdatePetId;

    console.log("pet_birthday", pet_birthday);
    // 針對所有資料跑迴圈，決定是否要修改或新增
    for (i = 0; i < pet_id.length; i++) {
      // 如果有 pet_id 代表要修改資料庫內的寵物。
      if (pet_id[i]) {
        // 如果使用者沒上傳圖片，使用 sqlUpdateNoPic 語法更新。
        if (fileIndexArray[i] === "nopic") {
          petIdRow = [pet_name[i], pet_breed[i], pet_birthday[i], pet_id[i]];
          [UpdatePetId] = await db.query(sqlUpdateNoPic, petIdRow);
        } else {
          // 如果使用者有上傳圖片，使用 sqlUpdate 語法更新。
          petIdRow = [
            petImgNames[fileIndexArray[i]],
            pet_name[i],
            pet_breed[i],
            pet_birthday[i],
            pet_id[i],
          ];
          [UpdatePetId] = await db.query(sqlUpdate, petIdRow);
        }
      } else {
        // 資料內沒有 pet_id 代表要新增一筆寵物資料。
        // INSERT PET
        petIdRow = [
          user_id,
          fileIndexArray[i] === "nopic"
            ? "noPic"
            : petImgNames[fileIndexArray[i]],
          pet_name[i],
          pet_breed[i],
          pet_birthday[i],
        ];
        // 放進mySQL
        [inserPetId] = await db.query(sqlInsertData, petIdRow);
      }
    }

    // DELETE PET 刪除寵物資訊
    let delArrayAll = JSON.parse(delArray);
    let deletePetId;
    for (let i = 0; i < delArrayAll.length; i++) {
      if (delArrayAll[i].pet_id) {
        console.log("pet_id", delArrayAll[i].pet_id);
        // DELETE FROM `members_pet_id` WHERE `pet_id`= 80;
        let sql = " DELETE FROM `members_pet_id` WHERE `pet_id`=?";

        [deletePetId] = await db.query(sql, delArrayAll[i].pet_id);
      }
    }

    res.json(result);
  } catch (e) {
    Error(e);
  }
});
// *** 路由定義結束 :END-----------------------------------

app.use((req, res) => {
  res.status(404).send(`<h1>找不到頁面</h1>`);
});

let port = process.env.PORT || 3000;
const node_env = process.env.NODE_ENV || "development";
app.listen(port, () => {
  console.log(`NODE_ENV: ${node_env}`);
  console.log(`website is on: http://localhost:${port}`, new Date());
});
