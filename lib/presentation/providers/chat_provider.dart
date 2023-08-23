import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/messege.dart';

class ChatProvider extends ChangeNotifier{

final getYesNoAnswer = GetYesNoAnswer();
final  chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "Hola ", fromwho: FromWho.me),
    Message(text: "que haces?", fromwho: FromWho.me),
   
  ];

  Future<void> sendMessege(String text) async {
    if(text.isEmpty) return;
    final newMessage = Message(text: text, fromwho: FromWho.me);
    messageList.add(newMessage);
    if(text.endsWith('?')){
       herReply();
    }
    notifyListeners(); 
    moveScrollToButton();
  }

  Future <void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToButton();
  }

  Future<void> moveScrollToButton() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );
  }



}