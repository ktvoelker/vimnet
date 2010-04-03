#!/usr/bin/env perl

use Socket qw/inet_ntoa/;

my @dvorak_ip = qw/
	127.0.0.1
	::1
	192.168.1.4
	192.168.1.5
	129.21.61.175
	129.21.60.80
	129.21.60.81
	129.21.60.82
	129.21.60.83
	129.21.60.84
	129.21.60.85
	129.21.60.86
	129.21.60.87
	129.21.60.88
	129.21.60.89
	129.21.60.90
	129.21.60.91
	129.21.60.92
	129.21.60.95
	129.21.253.43
	74.43.
	10.0.
	75.17.
	129.21.253.81
  24.240.34.218
  66.44.228.135
  129.21.8
/;

my @dvorak_name = qw/
	nevermore
	cheese
	raven
	karl
/;

sub _find_bin_path {
	my ($str) = @_;
	my ($path) = $str =~ /(\S+bin\S+)/;
	return $path;
}

my $hostname;
sub hostname {
	unless (defined $hostname) {
		my $prog = _find_bin_path(`whereis hostname`);
		$hostname = `$prog`;
		chomp $hostname;
	}
	return $hostname;
}

my $ip;
sub ip {
	unless (defined $ip) {
		if (exists $ENV{'SSH_CLIENT'}) {
			($ip) = $ENV{'SSH_CLIENT'} =~ /^(\S+)/;
		}
	}
	return $ip;
}

sub found_ip {
	return defined ip;
}

sub ssh {
	return exists $ENV{'SSH_CLIENT'};
}

sub dvorak {
	run('d');
}

sub qwerty {
	run('q');
}

sub run {
	my ($mode) = @_;
	exec qw/vim.real -u NONE -S/, "$ENV{'HOME'}/.vimnet/vimrc-$mode", @ARGV;
}

if ((found_ip() && grep { ip() =~ /^\Q$_\E/ } @dvorak_ip) || 
		(!ssh() && grep { hostname() eq $_ } @dvorak_name)) {
	dvorak();
}
else {
	qwerty();
}

