print "Please type in a list of strings (on separate lines).\n";
my @strings=<STDIN>;
chomp(@strings);
my $lastIndex=$#strings;
print "The reversed order of the list without using the reverse method is:\n";
for ($i=$lastIndex; $i>=0; $i--) {
print "$strings[$i]\n";
}
