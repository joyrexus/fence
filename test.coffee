{test, eq, arrayEq} = require './src/testy'
{getLang, unfence, makeFencer} = require './src/main'

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
  eq source, unfence(fence(source)), "round-trip equality"

test 'unfence', ->
  source = '# Demo\n\n```python\nprint "hello world!"\n```\n'
  indented = '# Demo\n\n    print "hello world!"\n\n'
  eq unfence(source), indented

test.status()
