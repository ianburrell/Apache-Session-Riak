package Apache::Session::Riak;

use 5.006;
use strict;
use warnings;

use base qw(Apache::Session);

use Apache::Session::Store::Riak;
use Apache::Session::Generate::MD5;
use Apache::Session::Lock::Null;
use Apache::Session::Serialize::Storable;

use vars qw($VERSION);
$VERSION = '0.1';

sub populate
{
    my $self = shift;

    $self->{object_store} = Apache::Session::Store::Riak->new($self;
    $self->{lock_manager} = Apache::Session::Lock::Null->new($self);
    $self->{generate}     = \&Apache::Session::Generate::MD5::generate;
    $self->{validate}     = \&Apache::Session::Generate::MD5::validate;
    $self->{serialize}    = \&Apache::Session::Serialize::Storable::serialize;
    $self->{unserialize}  = \&Apache::Session::Serialize::Storable::unserialize;

    return $self;
}

1;

=head1 NAME

Apache::Session::Riak - The great new Apache::Session::Riak!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Apache::Session::Riak;

    my $foo = Apache::Session::Riak->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Ian Burrell, C<< <ianburrell at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-apache-session-riak at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Apache-Session-Riak>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Apache::Session::Riak


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Apache-Session-Riak>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Apache-Session-Riak>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Apache-Session-Riak>

=item * Search CPAN

L<http://search.cpan.org/dist/Apache-Session-Riak/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Ian Burrell.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Apache::Session::Riak
