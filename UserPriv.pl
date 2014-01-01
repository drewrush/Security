use strict;
use warnings;

while (<>) {

    $_ =~ s/^\s+//;
	$_ =~ s/ +\d$/ /g;
	my @fields = split(/\s{2,}/);
	
	my $atindex, my $username;
	
	if (@fields) {
	$atindex = rindex($fields[0],"@",);
	$username = substr($fields[0],0,$atindex);
	}

	if (scalar @fields < 2 || $fields[0] eq 'holder') {
	} elsif (!$fields[2]) {
		print "grant $fields[1] to user '$username';\n";
	} elsif (!$fields[3]) {
		print "grant ", ($fields[2] eq 'any') ? 'execute any' : $fields[2]," on application '$fields[1]' to user '$username';\n";
	} else {
		print "grant ", ($fields[3] eq 'any') ? 'execute any' : $fields[3]," on database '$fields[1]'.'$fields[2]' to user '$username'\n";
	} 

};