print "Please type in a series of lines, with each separated by a newline. End the typing by ctrl+d.\n";
my @lines=<STDIN>;
chomp(@lines);
print "Please type in a number that you want to select from the lines that you typed in. \n";
my $num=<STDIN>;
chomp($num);
print "The line in line $num is $lines[$num] \n";
