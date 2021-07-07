var express = require('express')
var router = express.Router()
var userdata = require('../../data/consumer/user')
// middleware that is specific to this router
router.use(function timeLog (req, res, next) {
  console.log('Time: ', Date.now())
  next()
})

// define the home page route
router.get('/', function (req, res) {
  // res.send('Get all users info')
  res.json(userdata)
})

// define the about route
router.get('/:userId', function (req, res) {
  res.send('get specific user info')
})

router.post('/', function (req, res) {
  userdata.push(req.body)
  res.status(200).json({
    success: true,
    message: '成功创建用户'
  })
})

module.exports = router
