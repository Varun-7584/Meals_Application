import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:newmeals/phone _verify/phone.dart';
import 'package:newmeals/screens/tabs_screen.dart';
import '../screens/filters_screen.dart';
import 'registration_screen.dart';
import 'package:newmeals/screens/tabs_screen.dart';



class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('Log In',
          style: TextStyle(
            color: Colors.black54,
          ),),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.green.shade100,


      body: wid(),
    );
  }
}
class wid extends StatefulWidget {
  const wid({Key? key}) : super(key: key);

  @override
  State<wid> createState() => _widState();
}
//for the  widget and the login page
class _widState extends State<wid> {
  String error = 'error';

  // TextEditingController _passwordTextController = TextEditingController();
  // TextEditingController _emailTextController = TextEditingController();
  get _auth => FirebaseAuth.instance;
  late String email;
  late String password;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return
      Padding(

        padding: const EdgeInsets.all(2),
        child: Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50.0,
                  child: Center(child: Text('Login')),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child:  TextField(
                  // controller: passController,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black54,
                  onChanged: (value){
                    email = value ;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child:
                TextField(
                  // controller: passController,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black54,
                  obscureText: true,
                  onChanged: (value){
                    password = value ;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child:  Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.red.shade200,
                  )
                  ,
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: Text('Login',
                    // style: TextStyle(
                    //     color: Colors.green.shade400),
                  ),
                  onPressed: ()async{
                    ///
                    // try{
                    //   FirebaseAuth.instance
                    //       .signInWithEmailAndPassword(
                    //       email: email,
                    //       password: password)
                    //       .then((value) {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => MyPhone()));
                    //   }).onError((error, stackTrace) {
                    //     print("Error ${error.toString()}");
                    //   });
                    // }
                    //
                    // catch(e){
                    //   print(e);
                    // }
                    //
                    ///
                    // try {
                    //   await _auth.signInWithEmailAndPassword(
                    //     email: email,
                    //     password: password,
                    //   );
                    // } on FirebaseAuthMultiFactorException catch (e) {
                    //   setState(() {
                    //     error = '${e.message}';
                    //   });
                    //   final firstHint = e.resolver.hints.first;
                    //   if (firstHint is! PhoneMultiFactorInfo) {
                    //     return;
                    //   }
                    //   await FirebaseAuth.instance.verifyPhoneNumber(
                    //     multiFactorSession: e.resolver.session,
                    //     multiFactorInfo: firstHint,
                    //     verificationCompleted: (PhoneAuthCredential credential) {},
                    //     verificationFailed: (FirebaseAuthException e) {},
                    //     codeSent: (String verificationId, int? resendToken) async {
                    //       final smsCode = await getSmsCodeFromUser(context);
                    //
                    //       if (smsCode != null) {
                    //         // Create a PhoneAuthCredential with the code
                    //         final credential = PhoneAuthProvider.credential(
                    //           verificationId: MyPhone.verify,
                    //           smsCode: smsCode,
                    //         );
                    //
                    //         try {
                    //           await e.resolver.resolveSignIn(
                    //             PhoneMultiFactorGenerator.getAssertion(
                    //               credential,
                    //             ),
                    //           );
                    //         } on FirebaseAuthException catch (e) {
                    //           print(e.message);
                    //         }
                    //       }
                    //     },
                    //     codeAutoRetrievalTimeout: (_) {},
                    //   );
                    // } catch (e) {
                    //   print(e);
                    // }
                    //
                    //

                    //
                    // FirebaseAuth.instance
                    //     .signInWithEmailAndPassword(
                    //     email: _emailTextController.text,
                    //     password: _passwordTextController.text)
                    //     .then((value) {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => ChatScreen()));
                    // }).onError((error, stackTrace) {
                    //   print("Error ${error.toString()}");
                    // });
                    // print(_emailTextController.text);
                    // print(_passwordTextController.text);
                    ///
                    //  Navigator.push(context,
                    //      MaterialPageRoute(builder: (context) => TabScreen()));
                    Navigator.of(context).pushNamed('/tabsScreen');
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  //if the user does not have aa account then -> move to registration screen
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Register ',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),),);
  }
}