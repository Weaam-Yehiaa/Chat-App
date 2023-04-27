import 'package:chat_app_tharwat/components/chat_buble.dart';
import 'package:chat_app_tharwat/constants.dart';
import 'package:chat_app_tharwat/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);

  static String id='ChatScreen';


  final _controller= ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return  StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt,descending: true).snapshots(),
        builder: (context,snapshot){

          if (snapshot.hasData) {
            List<Message>messageList=[];
            for(int i=0;i<snapshot.data!.docs.length;i++)
              {
                messageList.add(Message.fromJson(snapshot.data!.docs[i]));
              }

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,// tl8i arrow bta3 go back al byzhr by default
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imagePath,
                      height: 50.0,
                      width: 50.0,
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(color: kPrimaryColor),


                    ),
                  ],
                ),
                centerTitle: true, //bt2ol en title ykon f center appBar
              ),
              body:Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messageList.length,
                      itemBuilder: (BuildContext context, int index)
                      {

                        return messageList[index].id==email? ChatBuble(message: messageList[index],)
                      :ChatBubleForFriend(message: messageList[index],);
                        },
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value){
                        messages.add({
                          kMessage:value,
                          kCreatedAt: DateTime.now(),
                          'id': email,
                        });
                        controller.clear();
                        _controller.animateTo(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },

                      decoration: InputDecoration(

                        hintText: 'Send Messages',
                        suffix: Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),


                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          else{
            return Text('Loading...');
          }
        },
    );
  }
}


