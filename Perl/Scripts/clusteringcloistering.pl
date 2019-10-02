$foo = "1: Ian Stuart - 8097";
print $foo . "\n";
$foo =~ /\b((\w+)\s+(\w+))\b/;
print $1 . "\n";
print $2 . "\n";
print $3 . "\n";

@foo = qw(cat cow dog ccatd dogt dog-dog);
foreach (@foo) {
print $_ . "\n" if /^(?:cat|cow|dog)\S*(?:cat|cow|dog)$/;
}


$try="dog-dog";
$try =~ /^(?:cat|cow|dog)\S*(?:cat|cow|dog)$/;
print $1;

$_="foot Fool buffoon";
s/foo/bar/ig;
print $_;



<>