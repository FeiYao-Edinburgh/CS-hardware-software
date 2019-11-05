for (my $i=0; $i<=32; $i++) {
printf "%5g -> %8g\n",$i,$i*$i;
}
print "=" x 20 . "\n";
my @list;
for ($i=0; $i<=32; $i++) {
push(@list,$i);
}
foreach my $j (@list) {
printf "%5g -> %8g\n",$j, $j*$j;
}
