print "Please type in a temperature in Farenheit unit: ";
my $temp=<STDIN>;
chomp($temp);
if ($temp > 72){
print "$temp too hot\n";
} elsif ($temp>=68) {
print "$temp just right\n";
} else {
print "$temp too cold\n";
}
