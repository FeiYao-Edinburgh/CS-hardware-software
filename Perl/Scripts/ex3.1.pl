print "Please type in a list of strings to be stored in an array, with each line terminated by a newline. End typing with ctrl+d.\n";
my @all=<STDIN>;
chomp(@all);
print "The elements in @all in a reversed order is:\n";
foreach my $i (reverse @all) {
print $i . "\n";
}
