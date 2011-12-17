package Encode::JP::Mobile::UnicodeEmojiMBGA;
use strict;
use warnings;
use base qw(Encode::Encoding);
use Encode::Alias;
use Encode qw(:fallbacks);
use Encode::JP::Mobile;
use Encode::JP::Emoji;
use Encode::JP::Emoji::Property;
use Encode::MIME::Name;
our $VERSION = '0.01';

__PACKAGE__->Define(qw(x-utf8-jp-mobile-unicode-emoji-mbga));
$Encode::MIME::Name::MIME_NAME_OF{'x-utf8-jp-mobile-unicode-emoji-mbga'} = 'UTF-8';

sub _encoding1() { Encode::find_encoding('x-utf8-e4u-unicode') }
sub _encoding2() { Encode::find_encoding('x-utf8-e4u-docomo') }
sub _encoding3() { Encode::find_encoding('x-utf8-docomo') }
sub _encoding4() { Encode::find_encoding('x-utf8-softbank') }


sub decode($$;$) {
    my ($self, $str, $chk) = @_;

    $str = Encode::decode($self->_encoding1 => $str, $chk);
    if ($str =~ /\p{InEmojiGoogle}/) {
        $str = Encode::encode($self->_encoding2 => $str, $chk);
        $str = Encode::decode($self->_encoding3 => $str, $chk);
    }
    $str;
}

sub encode($$;$) {
    my ( $self, $str, $chk ) = @_;

    Encode::encode($self->_encoding4 => $str, $chk);
}

1;
__END__

=head1 NAME

Encode::JP::Mobile::UnicodeEmojiMBGA -

=head1 SYNOPSIS

  use Encode::JP::Mobile::UnicodeEmojiMBGA;

=head1 DESCRIPTION

Encode::JP::Mobile::UnicodeEmojiMBGA is

=head1 AUTHOR

Masayuki Matsuki E<lt>y.songmu@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
