#!/usr/bin/perl


use strict;
use warnings;
use Net::DNS::Resolver;



my $hostname = 'perl.org';

my $res = Net::DNS::Resolver->new(
    nameservers => [qw(10.55.0.1)],
);

my $query = $res->search($hostname);



if ($query) {
    foreach my $rr ($query->answer) {
        next unless $rr->type eq "A";
        print "Encontrei um registro: ".$rr->address; 
    }
}