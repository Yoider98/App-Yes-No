import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/messege.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/128/3443/3443338.png'),
          ),
        ),
        title: const Text('Tienda 🛒'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   final chatprovider = context.watch<ChatProvider>();



    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatprovider.chatScrollController,
                    itemCount: chatprovider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatprovider.messageList[index];
                      return (message.fromwho == FromWho.hers) 
                      ?  HerMessageBubble(message: message,)
                      :  MyMessageBubble(message: message,) ;
                    })),

            /// Caja de texto de mensajes
             MessageFieldBox(
             // onValue: (value) => chatprovider.sendMessege(value),
              onValue: chatprovider.sendMessege,

             ),
          ],
        ),
      ),
    );
  }
}
