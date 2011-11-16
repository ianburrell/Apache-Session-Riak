package Apache::Session::Store::Riak;

use strict;
use Net::Riak;

our $VERSION = '0.1';

sub new
{
    my ($class, $session) = @_;
    my $self;

    $self->{client} = Net::Riak->new(...);
    $self->{bucket} = $self->{client}->bucket($opts->{bucket});

    bless $self, $class;
}

sub insert
{
    my ( $self, $session ) = @_;
    my $object = $self->{bucket}->new_object($session->{data}{_sesssion_id}, $session->{serialized} );
    $object->store();
}

*update = *insert;

sub materialize
{
    my ( $self, $session ) = @_;
    my $object = $self->{bucket}->get($session->{data}->{_session_id});
    $session->{serialized} = $object->value();
}

sub remove
{
    my ( $self, $session ) = @_;
    $self->{bucket}-delete_object($session->{data}->{_session_id});
}

1;
