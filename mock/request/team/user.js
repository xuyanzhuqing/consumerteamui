var express = require('express')
var router = express.Router()

router.get('/', function (req, res) {
  res.send('Get all users info')
})

module.exports = router