### Running a Perl script
Supposing your `helloworld.pl` script has the following code.
```
print "Hello World"
```
You can easily run it by typing `perl helloworld.pl` as long as `perl` interpreter is in your `$PATH`. Alternatively, you can add the following code to the first line of the script and run it as `chmod u+x helloworld.pl; ./helloworld.pl`.
```
#!/usr/bin/perl
echo "Hello World"
```
The `#!` character sequence is, in fact, a special construct called a shebang. The shebang is used to tell the system the name of the interpreter that should be used to execute the script that follows. You can use `which perl` to show the location of your interpreters.
