#!/usr/bin/env perl

my @qwerty_ip = qw/
  ^129\\.21\\.0\\.
  ^129\\.21\\.[1-36-9]
  ^129\\.21\\.4[0-8]
  ^129\\.21\\.5[1-9]
/;

my $ip;
sub ip {
	unless (defined $ip) {
		if (exists $ENV{'SSH_CLIENT'}) {
			($ip) = $ENV{'SSH_CLIENT'} =~ /^(\S+)/;
		}
    elsif (-x '/sbin/ifconfig') {
      my $out = `/sbin/ifconfig -a`;
      while ($out =~ s/inet\s+(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})//) {
        my $got = $1;
        if ($got ne '127.0.0.1') {
          $ip = $got;
          last;
        }
      }
    }
	}
	return $ip;
}

sub found_ip {
	return defined ip;
}

sub dvorak {
	run('d');
}

sub qwerty {
	run('q');
}

sub run {
	my ($mode) = @_;
	exec qw/vim.real -u/, "$ENV{'HOME'}/.vimnet/vimrc-$mode", @ARGV;
}

if (found_ip() && grep { ip() =~ /$_/ } @qwerty_ip) {
	qwerty();
}
else {
	dvorak();
}

