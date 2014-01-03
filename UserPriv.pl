use strict;
use warnings;

my $AppFile = "AppList.txt";
open (FH, "< $AppFile") or die "Can't open $AppFile for read: $!";
my @Apps;
while (<FH>) {
    /^(.*)$/;
	push (@Apps, $1);
}
close FH or die "Cannot close $AppFile: $!";

my $DBFile = "DBList.txt";
open (FH, "< $DBFile") or die "Can't open $DBFile for read: $!";
my @DBs;
while (<FH>) {
    /^(.*)$/;
	push (@DBs, $1);
}
close FH or die "Cannot close $DBFile: $!";

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
	} elsif (grep(/^$fields[1]$/, @Apps)) {
		if (!$fields[3]) {
			print "grant ", ($fields[2] eq 'any') ? 'execute any' : $fields[2]," on application '$fields[1]' to user '$username';\n";
		} else {
			my $AppDB = "$fields[1]."."$fields[2]";
			if (grep(/^$AppDB$/, @DBs)) {
				print "grant ", ($fields[3] eq 'any') ? 'execute any' : $fields[3]," on database '$fields[1]'.'$fields[2]' to user '$username'\n";
			}
		} 
	}
};