print "Please type in a temperature in Farenheit unit: ";
my $temp=<STDIN>;
chomp($temp);
if ($temp > 72){
print "$temp too hot\n";
} else {
print "$temp too cold\n";
}
