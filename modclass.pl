#!/usr/bin/perl

# Workaround script: the addclass/createdb script combo
# actually grants ALL permissions on *.*, so to remove
# those we can run ./modclass on the same class list
# to set the correct permissions.

$password = 'smgdatabase';

if (@ARGV) {
  while (<>) {
    chomp;
    system("sh createdb $_ $_ $password");
  }
}

else {
  print STDERR "usage: ./modclass listfile\n";
}
