use strict;
use warnings;

while (<>) {
    if (/\s([^\\]+?) {80,}([^\\]+)/) {
		my $useratindex = rindex($2,"@",);
		my $username = substr($2,0,$useratindex);
		my $groupatindex = rindex($1,"@",);
		my $groupname = substr($1,0,$groupatindex);
		if ($groupatindex != -1) {
			print "alter user '$username' add to group '$groupname';\n";
		}
	}
}