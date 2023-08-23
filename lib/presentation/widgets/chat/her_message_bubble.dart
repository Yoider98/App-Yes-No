import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/messege.dart';
class HerMessageBubble extends StatelessWidget {

  final Message message;
  const HerMessageBubble({
    super.key, 
    required this.message, 
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Container(
          
          decoration:  BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(message.text, style: const TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble( message.imageURL! ),
        const SizedBox(height: 15),
      ],

    );
  }
}

class _ImageBubble extends StatelessWidget {
   final String imageURL;

  const _ImageBubble(  this.imageURL);

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: 
      Image.network(imageURL,
      width: size.width *0.7,
      height: size.height *0.3,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null){
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
      },
      )

    );
    
  }
}