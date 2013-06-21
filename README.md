mysql-users
===========

A year ago, I needed a quick and dirty way to take a list of usernames and create MySQL databases and users for each name, with permissions to only their individual database.

## Syntax
Basic usage:
`./addclass class_list`

Where class_list is a return-delimited plaintext file of usernames

One-off user creation:
`./createdb [database_name] [user name] [database password]
`

Permissions:
If you require a siloed environment (where each user shouldn't see all other databases) you can run:
`./modclass class_list`
which will remove all permissions and grant permissions only to each individual database.
