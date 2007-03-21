use ExtUtils::MakeMaker;

# Copyright PROCURA B.V. (c) 2006-2007 H.Merijn Brand

use v5.8.0;

my %wm = (
    NAME         => "Text::OutputFilter",
    ABSTRACT     => "Filter and modify output",
    AUTHOR       => "H.Merijn Brand <h.merijn\@procura.nl>",
    VERSION_FROM => "OutputFilter.pm",
    );

my $rv = WriteMakefile (%wm);

1;
