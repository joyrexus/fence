{exec} = require 'child_process'
fs = require 'fs'

task 'build', 'Build javascript files from source', ->
  report = (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr if stdout or stderr
  exec 'coffee -co lib/ src/', report
  exec 'echo "\#\!/usr/bin/env node\n" >| fence.js', report
  exec 'coffee -p fence.coffee >> fence.js', report
