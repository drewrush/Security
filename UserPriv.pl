use strict;
use warnings;

while (<>) {
    s/^ //m;
	if (/^([^\\]+?)( {80,})/) {
		my $atindex = rindex($1,"@",);
		my $username = substr($1,0,$atindex);
		if ($atindex != -1) {
			s/^([^\\]+?)( {80,})/$username  $2/m;
			s/ {2,}/ \\ \\ /g;
			s/\\ \d$//gm;
			s/ \\ $//gm;
		}
	}
	if (/([^\\]+) \\ \\ ([^\\]+) \\ \\ ([^\\]+) \\ \\ ([^\\]+)\n/) {
		if ($4 eq "any") {
			my $execany = "execute any";
			print "grant $execany on database '$2'.'$3' to user '$1';\n";
		} else {
			print "grant $4 on database '$2'.'$3' to user '$1';\n";
		}
	} elsif (/([^\\]+) \\ \\ ([^\\]+) \\ \\ ([^\\]+)\n/) {
	    if ($3 eq "any") {
			my $execany = "execute any";
			print "grant $execany on application '$2' to user '$1';\n";
		} else {
			print "grant $3 on application '$2' to user '$1';\n";
		}
	} elsif (/([^\\]+) \\ \\ ([^\\]+)\n/) {
		print "grant $2 to user '$1';\n";
	}
}