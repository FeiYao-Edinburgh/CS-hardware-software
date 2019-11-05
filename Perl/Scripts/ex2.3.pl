print "Please type in the first number: ";
my $firstnumber=<STDIN>;
chomp($firstnumber);
print "Please type in the second number: ";
my $secondnumber=<STDIN>;
chomp($secondnumber);
my $multiply=$firstnumber*$secondnumber;
print "The product of the first and second number is $multiply \n";
