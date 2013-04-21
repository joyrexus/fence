Fence
=====

Convert your [literate script](http://ashkenas.com/literate-coffeescript/) to
a [GH-flavored code-fenced](https://help.github.com/articles/github-flavored-markdown) variant ... or vice versa.

Handy if you want to have your code blocks highlighted when posting 
your literate script as a Gist or as a README.md file for your repo ... or to
convert a markdown file with fenced code blocks to literate source.


## Example

Suppose we have a file, `demo.python.md`, containing ...

    # Demo

        print "hello world!"

And now we want to fence the code blocks in this file so that they'll be rendered nicely when people look at our demo file on Github. That is, we want ...

    # Demo

    ```python
    print "hello world!"
    ```

... so that the codeblock is rendered all pretty:

```python
print "hello world!"
```


## Usage

    fence demo.python.md > demo.md
    fence demo.coffee.md > demo.md
    fence demo.litcoffee > demo.md
    cat demo.python.md | fence --lang python > demo.md
    cat demo.coffee.md | fence --lang coffee > demo.md

You can also "undo" fencing:

    fence --undo demo.md > demo.litcoffee
    cat demo.md | fence --undo > demo.litcoffee


## Credit

HT to @jashkenas, this is but a tweak of [journo's Cakefile](https://github.com/jashkenas/journo/blob/master/Cakefile).

