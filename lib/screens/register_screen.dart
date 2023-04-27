import 'package:chat_app_tharwat/constants.dart';
import 'package:chat_app_tharwat/helper/show_snak_bar.dart';
import 'package:chat_app_tharwat/screens/chat_screen.dart';
import 'package:chat_app_tharwat/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/custom_button.dart';
import '../components/custom_text_filed.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({Key? key}) : super(key: key);

  static String id='RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  bool isLoading=false;

  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey ,
            child: ListView(

              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300,),
                Image.asset(
                  imagePath,
                  height: 350,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'pacifico',
                        fontSize: 32,
                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'pacifico',
                        fontSize: 24,
                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomFormTextFiled(
                  onChanged: (value){
                    email=value;
                  },
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomFormTextFiled(
                  onChanged: (value){
                    password=value;
                  },
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomButton(
                  onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading=true;
                    setState(() {

                    });
                    try{
                      await registerUser();
                      Navigator.pushNamed(context, ChatScreen.id);
                    }on FirebaseAuthException catch (e) {
                      print(e.code);
                      if (e.code == 'weak-password') {
                        showSnakeBar(context,'The password provided is too weak.');

                      } else if (e.code == 'email-already-in-use') {
                        showSnakeBar(context,'The account already exists for that email.');

                      }
                    } catch(e)
                      {
                        showSnakeBar(context,'there was an error. ');
                      }
                    isLoading=false;
                    setState(() {

                    });

                  }

                  },
                    name: 'Register'
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account? ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                       // Navigator.pushNamed(context, LoginScreen.id); kda ana b-create new screen 3la al fady wrong logic
                       Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),

                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }



  Future<void> registerUser() async {
     var auth=FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!
    );

  }
}
