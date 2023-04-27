import 'package:chat_app_tharwat/components/custom_button.dart';
import 'package:chat_app_tharwat/components/custom_text_filed.dart';
import 'package:chat_app_tharwat/constants.dart';
import 'package:chat_app_tharwat/helper/show_snak_bar.dart';
import 'package:chat_app_tharwat/screens/chat_screen.dart';
import 'package:chat_app_tharwat/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

   static String id='LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            key: formKey,
            child: ListView(
             // mainAxisAlignment: MainAxisAlignment.center,

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
                      'Login',
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
                  obscureText: false,
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
                          await loginUser();
                          Navigator.pushNamed(context, ChatScreen.id , arguments: email);
                        }on FirebaseAuthException catch (e) {
                          print(e.code);
                          if (e.code == 'user-not-found') {
                            showSnakeBar(context,'No user found for that email.');

                          } else if (e.code == 'wrong-password') {
                            showSnakeBar(context,'Wrong password provided for that user.');

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
                 name: 'LOGIN'
               ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'don\'t have an account? ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    ),
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return RegisterScreen();
                            }
                            ),
                        );
                      },
                      child: Text(
                        'Register',
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


   Future<void> loginUser() async {
     var auth=FirebaseAuth.instance;
     UserCredential user = await auth.signInWithEmailAndPassword(
         email: email!,
         password: password!
     );

   }
}
