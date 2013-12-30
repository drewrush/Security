use strict;
use warnings;

while (<>) {
    if (/\s([^\\]+?) {80,}/) {
		my $atindex = rindex($1,"@",);
		my $username = substr($1,0,$atindex);
		if ($atindex != -1) {
			print "create user '$username' type external;\n";
		}
	}
}