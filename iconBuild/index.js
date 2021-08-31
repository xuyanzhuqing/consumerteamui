const Generator = require("./src/generate");
const path = require('path')
const dartFileOutput = __dirname.toString().replace('iconBuild', '') + 'lib/font' // 绝对路径
Generator({ output: "fonts", dartOutput: dartFileOutput, input: "svg", fontname: "autoicons" })


