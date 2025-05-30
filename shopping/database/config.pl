use strict;
use warnings;
use Config::IniFiles;

sub config {
    my $cfg = Config::IniFiles->new(-file => 'database.ini')
        or die "Failed to read database.ini: @Config::IniFiles::errors"; # If fails, stops and prints error

    my $host     = $cfg->val('postgresql', 'host');
    my $port     = $cfg->val('postgresql', 'port');
    my $username = $cfg->val('postgresql', 'username');
    my $password = $cfg->val('postgresql', 'password');

    my $debug    = $cfg->val('application', 'debug');
    my $log_file = $cfg->val('application', 'log_file');

    print "Database host: $host\n";
    print "App debug mode: $debug\n";

}

config();



