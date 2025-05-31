package DB;


use strict;
use warnings;
use DBI;
use Exporter 'import';

use Config qw(get_db_config);

our @EXPORT_OK = qw(test_table);

sub test_table {
    my $db_config = get_db_config();

    my $dsn = "dbi:Pg:dbname=$db_config->{database};host=$db_config->{host};port=$db_config->{port}";

    my $conn = DBI->connect(
        $dsn,
        $db_config->{user},
        $db_config->{password},
        { RaiseError => 1, AutoCommit => 1 }
    ) or die "Could not connect to the database: $DBI::errstr";

    print "Successfully connected to the database\n";

    my $tblmker = qq{
        CREATE TABLE IF NOT EXISTS products (
            id SERIAL PRIMARY KEY,
            name VARCHAR(25) NOT NULL,
            price NUMERIC(6,2) NOT NULL,
            stock INT
        )
    };

    my $stmnt = $conn->prepare($tblmker);
    $stmnt->execute();
    print "Table 'products' created.\n";

    $stmnt->finish;
    $conn->disconnect;
}

1;