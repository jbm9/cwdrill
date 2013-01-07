#!/usr/bin/perl

# Requires cwwav in PATH; https://github.com/Kerrick/cwwav/archive/master.tar.gz

srand(time());

my $t = `mktemp`;
chomp($t);

$t = $t . ".wav";

print "Created tempfile $t <-- here\n";

while(1) {
    print `clear`;
    my $alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; # 0123456789";

    my $i = int(rand(length($alphabet)));

    my $x = substr($alphabet, $i, 1);

    `echo "$x $x" | cwwav -f 700 -w 5 -o $t &> /dev/null`;
    `mplayer $t &> /dev/null`;
    sleep 1;
    print `banner "     $x" `;
    sleep 4;
}
