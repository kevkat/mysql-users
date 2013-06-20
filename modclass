#!/usr/bin/perl

$password = 'smgdatabase';

if (@ARGV) {
  while (<>) {
    chomp;
    system("sh createdb $_ $_ $password");
  }
}

else {
  print STDERR "usage: ./addclass listfile\n";
}
