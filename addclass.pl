#!/usr/bin/perl

# This script takes input from a list file with usernames separated by carriage returns.
# Each line will invoke crearedb, another script, to create a database and user matching
# the username in the file.
# e.g.: ./addclass my_class_list
# ./createdb can be used separately for one-off user adds

$password = 'smgdatabase'; # everyone gets the same default password, smgdatabase

if (@ARGV) { # While the file has lines, iterate through the while loop
  while (<>) {
    chomp; # Cleans up trailing whitespace and line break characters
    system("sh createdb $_ $_ $password"); # Passes this stuff to the command line
  }
}

# The script needs an argument to be run, otherwise it gives you directions
else { 
  print STDERR "usage: ./addclass listfile\n";
}
