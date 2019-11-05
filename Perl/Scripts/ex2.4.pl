print "Please type in the string: ";
my $str=<STDIN>;
chomp($str);
print "Please type in the number that you want the string be repeated: ";
my $num=<STDIN>;
chomp($num);
my $strnum=$str x $num;
print "The repeated string is $strnum \n";
