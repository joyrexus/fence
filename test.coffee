{test, eq, arrayEq} = require './src/testy'
{getLang, makeFencer} = require './lib/main'

test 'getLang', ->
  tests =
    coffeescript: ['my.coffee.md', 'my.litcoffee']
    haskell: ['my.haskell.md']
    python: ['my.python.md']
  eq lang, getLang(file) for file in files for lang, files of tests

test 'makeFencer', ->
  source = '# Demo\n\n    print "hello world!"\n\n'
  fenced = '# Demo\n\n```python\nprint "hello world!"\n```\n'
  fence = makeFencer 'python'
  eq fence(source), fenced

test.status()
