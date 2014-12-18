package POE::Filter::Ls;

use POE::Filter::Line;

$VERSION = 0.02;

sub new {
  my $class = shift;

  return bless [ new POE::Filter::Line( Literal => "\015\012" ) ],
    ref($class)||$class;
}

sub put {
  my ($self, $lines) = @_;
  return $self->[0]->put($lines);
}

sub get {
  my ($self, $lines) = @_;

  return [ map {
    my %info;
    if (/^(.|-)(.{9})\s+(\d+)\s+(\w+)\s+(\w+)\s+(\d+)\s+(\w{3}\s+\d+\s+(?:\d+:\d+|\d+))\s+(.*?)(?:\s+->\s+(.*))?$/) {
      @info{"type","perms","links","owner","group","size","date","filename","link"} = ($1, $2, $3, $4, $5, $6, $7, $8, $9);
    }
    \%info;
  } @{ $self->[0]->get($lines) } ];
}

1;

__END__

=pod

=head1 NAME

POE::Filter::Ls - Translates common ls formats into a hashref.

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<get($data_ar)>

 Get input data in ls format and returns reference to array with ls informations
 in hash references.

=item C<put($data_ar)>

 Put ls informations in hash references and returns data in ls format.
 TODO Not functional.

=back

=head1 DEPENDENCIES

L<POE::Filter::Line>.

=head1 DEPENDECIES

L<POE::Filter>,
L<POE::Filter::Line>.

=head1 VERSION

0.02

=cut
