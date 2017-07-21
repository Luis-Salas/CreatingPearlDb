#!/usr/bin/perl -w
use DBI;

my @list = (
    { first_name => Rose, last_name => Tyler, home => earth },
    { first_name => Zoe, last_name => Heriot, home => Space},
    { first_name => Jo, last_name => Grant, home => earth },
    { first_name => Leela, last_name => null, home => Unspecified },
    { first_name => Romana, last_name => null, home => Gallifrey },
    { first_name => Clara, last_name => Oswald, home => Earth },
    { first_name => Adric, last_name => null, home => Alzarius },
    { first_name => Susan, last_name => Foreman, home => Gallifrey }
);
use strict;
#!/connect creates a data base if it does not exist already
my $db = DBI->connect("dbi:SQLite:test1.db") or die "couldn’t connect to db".DBI->errstr;
$db->do("CREATE TABLE IF NOT EXISTS user (id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT, home TEXT)");

foreach my $elem (@list) {
  $db->do("INSERT INTO user\(first_name, last_name, home) VALUES ( '$elem->{first_name}','$elem->{last_name}','$elem->{home}')");
}

my $all = $db->selectall_arrayref("SELECT * FROM USER");

foreach my $row (@$all) {
my ($id, $first_name, $last_name, $home) = @$row;
print "$id,$first_name,$last_name, $home";

}

$db->disconnect;
