package Config;

use strict;
use warnings;
use Config::IniFiles;
use Exporter 'import';

our @EXPORT_OK = qw(get_db_config);

sub get_db_config {
    my $config = Config::IniFiles->new(-file => 'database.ini') or die "Failed to read config";
    return {
        database => $config->val('postgresql', 'database'),
        host     => $config->val('postgresql', 'host'),
        port     => $config->val('postgresql', 'port'),
        user     => $config->val('postgresql', 'user'),
        password => $config->val('postgresql', 'password'),
    };
}

1;



