use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'I22r::Translate',
    AUTHOR              => q{Marty O'Brien <mob@cpan.org>},
    VERSION_FROM        => 'lib/I22r/Translate.pm',
    ABSTRACT_FROM       => 'lib/I22r/Translate.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    META_MERGE => {
	no_index => {
	    package => [
		'I22r::Translate::Request',
		'I22r::Translate::Result',
		'I22r::REST::Google',
		'I22r::REST::Google::Translate',
		'I22r::REST::Google::Data'
		],
	}
    },
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
	'Moose' => 0,
	'Moose::Role' => 0,
	'MooseX::ClassAttribute' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'I22r-Translate-*' },
);

print STDERR qq[
*******************************************************************
Using the Google translation backend requires an API key.
If you wish to test the Google backend, you will need to
edit the file

       t/Constants.pm

and specify your API key. You can get a Google API key from

       https://code.google.com/apis/console/

*******************************************************************
];
