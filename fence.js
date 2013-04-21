#!/usr/bin/env node

/*

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
*/


(function() {
  var argv, fence, file, fs, getLang, lang, makeFencer, print, source, _i, _len, _ref, _ref1;

  _ref = require('./lib/main'), getLang = _ref.getLang, makeFencer = _ref.makeFencer;

  fs = require('fs');

  argv = require('optimist').alias('l', 'lang').describe('l', 'Language tag for fences').argv;

  if (argv._.length) {
    _ref1 = argv._;
    for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
      file = _ref1[_i];
      lang = argv.lang || getLang(file);
      fence = makeFencer(lang);
      source = fs.readFileSync(file);
      console.log(fence(source));
    }
  } else {
    fence = makeFencer(argv.lang);
    print = function(source) {
      return console.log(fence(source));
    };
    process.stdin.on('data', print);
    process.stdin.resume();
  }

}).call(this);
