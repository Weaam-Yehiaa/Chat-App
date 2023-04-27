import 'package:chat_app_tharwat/constants.dart';

class Message{
  
  late final String message;
  final String id;

  Message(this.message,this.id);
  factory Message.fromJson(jsonData)
  {
    return Message(jsonData[kMessage],jsonData['id']);
    
  }
}