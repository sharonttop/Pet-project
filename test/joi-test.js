const Joi = require('joi');
const schema = Joi.object({
username: Joi.string()
  .alphanum()
  .min(3)
  .max(30)
})

exports.helloWorld = (req, res) => {
  const { error, value } = schema.validate(req.query)
  if (error) {
    return res.status(422).json({ error: error })
  }
  res.send('Hello, World') 
}
