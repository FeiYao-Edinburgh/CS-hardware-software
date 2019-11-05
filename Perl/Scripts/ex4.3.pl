print "Please type in a series of numbbers (one per line), until the number 999 is entered.\n";
my $num=<STDIN>;
chomp($num);
my $sum=0;
until ($num == 999) {
$sum+=$num;
$num=<STDIN>;
chomp($num);
}
print "The sum of your typied numbers is $sum.\n"
