### Good resources to follow
1. [The Unix Shell](https://swcarpentry.github.io/shell-novice/)
2. [Extra Unix Shell Material](https://carpentries-incubator.github.io/shell-extras/)
3. [linuxcast](https://www.youtube.com/playlist?list=PLrrWFMyom0IocKsc1ukKFxOljEg7IT_W3)
4. [The Linux Command Line (Highly Recommended!)](http://billie66.github.io/TLCL/book/index.html)
5. [String operations in Shell](https://www.tldp.org/LDP/abs/html/string-manipulation.html)
6. [GitHub tutorial (Highly Recommended particularly of git branch) ](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)
7. [Version Control with Git](https://swcarpentry.github.io/git-novice/)
8. [Markdown Basic Syntax](https://www.markdownguide.org/basic-syntax/)
9. [Makefile (TBL)](http://swcarpentry.github.io/make-novice/)
10. [Eddie](https://www.wiki.ed.ac.uk/display/ResearchServices/Introduction+to+Eddie+Course+-+Exercises)

### Running a Shell script
Supposing your `helloworld.sh` script has the following code.
```
echo "Hello World"
```
You can easily run it by typing `bash helloworld.sh` as long as `bash` is in your `$PATH`. Alternatively, you can add the following code to the first line of the script (seems optional) and run it as `chmod u+x helloworld.sh; ./helloworld.sh`.
```
#!/usr/bin/bash
echo "Hello World"
```
The `#!` character sequence is, in fact, a special construct called a shebang. The shebang is used to tell the system the name of the interpreter that should be used to execute the script that follows. You can use `which bash` to show the location of your interpreters. Bear in mind that there will always be another bash in `/bin/bash`.


