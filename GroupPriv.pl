use strict;
use warnings;

while (<>) {

    $_ =~ s/^\s+//;
	$_ =~ s/ +\d$/ /g;
	my @fields = split(/\s{2,}/);
	
	my $atindex, my $groupname;
	
	if (@fields) {
	$atindex = rindex($fields[0],"@",);
	$groupname = substr($fields[0],0,$atindex);
	}

	if (scalar @fields < 2 || $fields[0] eq 'holder') {
	} elsif (!$fields[2]) {
		print "grant $fields[1] to group '$groupname';\n";
	} elsif (!$fields[3]) {
		print "grant ", ($fields[2] eq 'any') ? 'execute any' : $fields[2]," on application '$fields[1]' to group '$groupname';\n";
	} else {
		print "grant ", ($fields[3] eq 'any') ? 'execute any' : $fields[3]," on database '$fields[1]'.'$fields[2]' to group '$groupname'\n";
	} 

};