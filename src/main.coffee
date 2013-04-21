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

# Export methods for testing
exports[name] = method for name, method of {getLang, makeFencer}

