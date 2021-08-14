var express = require('express')
var router = express.Router()
// middleware that is specific to this router
router.get('/users', function (req, res) {
  res.json({
    data: [233]
  })
})

module.exports = router
