srand;
print "Please type in a series of lines, each separated by a newline. End the typing with ctrl+d. \n";
my @lines=<STDIN>;
chomp(@lines);
my $randomnum=rand(@lines);
print "The line in line $randomnum is $lines[$randomnum]\n";
