###

# Fence

Convert your [literate script](http://ashkenas.com/literate-coffeescript/) to
a [GH-flavored code-fenced](https://help.github.com/articles/github-flavored-markdown) variant. 

Handy if you want to have your code blocks highlighted when posting 
your literate script as a Gist or as a README file for your repo.

HT to Mr. Ashkenas, this is but a tweak of [journo's Cakefile](https://github.com/jashkenas/journo/blob/master/Cakefile).

Example usage:

  fence demo.python.md > demo.md
  fence demo.coffee.md > demo.md
  fence demo.litcoffee > demo.md
  cat demo.python.md | fence --lang python > demo.md
  cat demo.coffee.md | fence --lang coffee > demo.md

###

# Get language from filename's extension
getLang = (file) ->   
  return 'coffeescript' if /\.(litcoffee|coffee\.md)$/.test file
  ext = file.match /(\.(\w+))?\.(md)/
  return if ext?[1] then ext[2] else ''

# Factory method returning a fence filter for specified language
makeFencer = (lang='') ->
  (data) ->
    text = data.toString()
    indented = /\n\n    ([\s\S]*?)\n\n(?!    )/mg
    asFenced = (match, code) ->
      dedented = code.replace(/^    /mg, '')
      "\n\n```#{lang}\n#{dedented}\n```\n"
    text.replace indented, asFenced

# Convert fenced source to indented code block
unfence = (source) ->
    text = source.toString()
    fenced = /^```(?:\w+)?\n([\s\S]*?)\n```\n/mg
    indent = (match, code) -> code.replace(/^/mg, '    ') + "\n\n"
    text.replace fenced, indent

# Run as script
run = ->
  fs = require 'fs'
  argv = require('optimist')
          .alias('u', 'undo')
          .describe('u', 'Undo fencing (convert to indented)')
          .alias('l', 'lang')
          .describe('l', 'Language tag for fences')
          .argv

  convert = unfence if argv.undo?

  if argv._.length
    for file in argv._
      lang = argv.lang or getLang file
      convert or= makeFencer lang
      source = fs.readFileSync file
      console.log convert source
  else
    convert or= makeFencer argv.lang
    print = (source) -> console.log convert source
    process.stdin.on 'data', print
    process.stdin.resume()
 
# Export methods for testing
exports[name] = method for name, method of {run, getLang, unfence, makeFencer}

