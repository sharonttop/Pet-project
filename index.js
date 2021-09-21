require('dotenv').config(); // 載入 .env 的設定


const express = require('express');

const app = express();
// const multer = require('multer');//檔案上傳功能，但不是很常用
// const upload = multer({dest:'tmp_uploads/'})
// const uploadImg = require('./modules/upload-images')

app.set('view engine','ejs');

const session = require('express-session')
const jwt = require('jsonwebtoken');
const MysqlStore = require('express-mysql-session')(session);//用來記錄用戶的session到資料表

const fs = require('fs').promises;

const moment = require("moment-timezone")

const db = require('./modules/connect-mysql');
const sessionStore= new MysqlStore({},db);

app.use(session({
    name:'mySessionID',//可以修改Application的cookie原本的name(原為connect.sid)，也可以不用改
    saveUninitialized:false,
    resave:false,//強制回存
    store: sessionStore,//session存放資料cookie的位置，2021 09 10 09 01 20 00:30:03
    secret:"erw3r3243243wr2323tewr",//key字串隨便設定，加密用設定
    cookie:{
        maxAge:1200000,//最多停留20分鐘，單位毫秒
    }
}));


//Toplevel-middleware


app.use( express.urlencoded({extended: false}) );//設定為false代表不使用qs套件，處理大量資料才需要使用

app.use(express.json());

const urlencodedParser = express.urlencoded({extended: false});

//app.use()的方法代表所有方法都可以進來，和app.get()post()只接受他們方法不同
app.use(express.static('public'));
//如果在好幾層資料夾裡可以用app.use(express.static(__dirname+'/public'));
app.use('/jquery', express.static('node_modules/jquery/dist'));
app.use('/bootstrap', express.static('node_modules/bootstrap/dist'));
//靜態middleware之前
app.use(async (req,res,next)=>{
    res.locals.title = '寵物網站';//頂層的middleware
    res.locals.pageName = '';
    res.locals.keyword = '';


    // 設定template 的helper functions ，建立一個全站都可用的middleware)01:01:00
    res.locals.dateToDateString = d =>moment(d).format('YYYY-MM-DD');
    res.locals.dateToDateTimeString = d =>moment(d).format('YYYY-MM-DD HH:mm:ss');
    // const fm = 'YYYY-MM-DD HH:mm:ss';

    res.locals.session = req.session; //把session的資料傳到ejs


    // jwt 驗證  2021 09 15 15 50 29  00:42:10
    //用token就算domain(主機)不同也可抓到，session如果不同domain可能抓不到值
    req.myAuth = null;  // 自訂的屬性 myAuth
    const auth = req.get('Authorization');//抓到token
    if(auth && auth.indexOf('Bearer ')===0){
        //選取有Authorization，且用indexOf找內有含Bearer的部分符合才往下找
        const token = auth.slice(7);
        //抓header的Authorization:Bearer 往後為加密token...因此要從第七個空格(Bearer )以後開始取token的值
        try{
            req.myAuth = await jwt.verify(token, process.env.JWT_SECRET);//解密
            console.log('req.myAuth:', req.myAuth);
        } catch(ex) {
            console.log('jwt-ex:', ex);
        }
    }

    next();
})

//上傳單一檔案single
// app.post('/try-upload',upload.single('avatar'),async (req,res)=>{
//     if(req.file && req.file.mimetype==='image/jpeg'){
//         try{
//             await fs.rename(req.file.path, __dirname + '/public/img/' + req.file.originalname);
//             return res.json({success:true ,filename: req.file.originalname});
//         } catch(ex){
//             //ex=except(error)
//             res.json({success:false,error:'無法存檔'});
//         }
//         } else {
//             await fs.unlink(req.file.path);//刪除暫存檔案
//             res.json({success:false,error:'格式不對'});
//             //當圖檔不為image/jpeg
//         }


// })



// *** 路由定義開始 :BEGIN--------------------------------------------------------------

app.get('/', (req, res)=>{
    res.locals.title ="首頁-"+ res.locals.title;
    // res.send(`<h2>Hello</h2>`);
    res.render('home',{name: 'Sharon'})
});

//路由模組化-middleware，拆開來到別的檔案方便管理
app.use('/', require('./routes/login'));
app.use('/customers', require('./routes/customers'));

app.get('/try-sess', (req, res)=>{
    //myVar自己設定自己取
    req.session.myVar = req.session.myVar || 0;
    req.session.myVar++;

    res.json(req.session);
});

// *** 路由定義結束 :END-----------------------------------

app.use((req, res)=>{
    res.status(404).send(`<h1>找不到頁面</h1>`)
})



let port = process.env.PORT || 3000;
const node_env = process.env.NODE_ENV ||'development';
app.listen(port, ()=>{
    console.log(`NODE_ENV: ${node_env}`);
    console.log(`website is on: http://localhost:${port}`, new Date());
});