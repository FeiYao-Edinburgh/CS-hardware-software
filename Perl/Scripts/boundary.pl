# Understanding boundary
@ipods =qw(ipod ipodate tripod);
print @ipods;
foreach (@ipods) {
if (/\bipod\b/) {
print;
}
}
<>