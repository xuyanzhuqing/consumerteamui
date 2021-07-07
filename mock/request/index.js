var requireContext = require('require-context')
var path = require('path')
var request = []

function importAll (files) {
  files.keys().forEach(function (file) {
     var basename = path.basename(file)
     var dirname = path.dirname(file)
     var extname = path.extname(file)
     var router = '/' + file.replace(extname, '').replace('\\', '/')

     if (dirname === '.' && basename === 'index.js') {
       return
     }

     request.push({
       router,
       file
     })
  })
}
 
importAll(requireContext('../../request', true, /\.js$/))

module.exports = request