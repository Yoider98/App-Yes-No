import 'dart:ffi';

enum FromWho { me, hers}

class Message{
  final String text;
  final String? imageURL;
  final FromWho fromwho;
  final Bool? visto;
  final DateTime? fecha;

  Message( {
    this.visto, 
    this.fecha,
    required this.text, 
    this.imageURL, 
    required this.fromwho
    });
}