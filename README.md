Fence
=====

Convert your [literate script](http://ashkenas.com/literate-coffeescript/) to
a [GH-flavored code-fenced](https://help.github.com/articles/github-flavored-markdown) variant. 

Handy if you want to have your code blocks highlighted when posting 
your literate script as a Gist or as a README file for your repo.

HT to Mr. Ashkenas, this is but a tweak of [journo's Cakefile](https://github.com/jashkenas/journo/blob/master/Cakefile).


## Example

Suppose we have a file, `demo.python.md`, containing ...

    # Demo

        print "hello world!"

And now we want to fence the code blocks in this file so that they'll be rendered
nicely when people look at our demo file on Github. That is, we want ...

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

