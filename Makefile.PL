#!/usr/bin/perl

# Copyright PROCURA B.V. (c) 2006-2008 H.Merijn Brand

require 5.008;
use strict;

use ExtUtils::MakeMaker;

my %wm = (
    NAME         => "Text::OutputFilter",
    ABSTRACT     => "Filter and modify output",
    AUTHOR       => "H.Merijn Brand <h.merijn\@procura.nl>",
    LICENSE	 => "perl",
    VERSION_FROM => "OutputFilter.pm",
    PREREQ_PM	 => {
	"Carp"		=> 0,
	"Test::More"	=> 0,
	},
    );

my $rv = WriteMakefile (%wm);

1;

package MY;

sub postamble
{
    join "\n" =>
	'cover test_cover:',
	'	cover -delete',
	'	HARNESS_PERL_SWITCHES=-MDevel::Cover $(MAKE) test',
	'	cover',
	'';
    } # postamble
