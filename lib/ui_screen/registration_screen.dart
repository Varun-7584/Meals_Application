import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newmeals/phone_model/user_model.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id ='registration_id';



  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  //Implement logout functionality
                }),
          ],
          title: Text('Registration',
            style: TextStyle(
              color: Colors.black54,
            ),),
          backgroundColor: Colors.lightGreen,
        ),
        backgroundColor: Colors.black38,
        body : register() ,
      )
    ;
  }
}
class register extends StatefulWidget {


  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  get _auth => FirebaseAuth.instance;
  late String email;
  late String password;
  late String phoneNo;
  late String Name ;



  ///firebase
  // TextEditingController numberController = TextEditingController();
  // TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[

                      ////////////
                      TextField(
                        // controller: emailController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black54,
                        keyboardType: TextInputType.emailAddress,

                        onChanged: (value){
                          email = value;

                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail ',

                        ),
                      ),
                      //////////////////////
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
                      TextField(
                        // controller: passController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black54,
                        keyboardType: TextInputType.phone,
                        onChanged: (value){

                          phoneNo = value ;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number ',
                        ),
                      ),
                      // TextField(
                      //   // controller: passController,
                      //   textAlign: TextAlign.center,
                      //   cursorColor: Colors.black54,
                      //   keyboardType: TextInputType.name,
                      //   obscureText: true,
                      //   onChanged: (value){
                      //     Name = value ;
                      //   },
                      //   decoration: const InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     labelText: 'Name ',
                      //   ),
                      // ),

                    ],
                  ),
                ),
              ),

              ////////////////////////text field 1
              ////////////////////////////////text field 2
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: (){
                      signUp(email, password);
                      // async{
                      // try{
                      //   final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      //   if (newUser!= null ) {
                      //     Navigator.pushNamed(context, LoginScreen.id);
                      //   }
                      // }
                      // catch(e){
                      //   print('enter the credentials +$e');
                      // }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
  void signUp (String email , String password)
  async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) =>{
      postDetailsToFirestore()
    }).catchError((e){
      Fluttertoast.showToast(msg: e!.message);
    });
  }
  postDetailsToFirestore() async{
//call the firestore
    //call user model
    //sending these value
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User ? user = _auth.currentUser;
    //the model created to send and recive data
    UserModel userModel = UserModel();

    //the values
    userModel.uid = user?.uid;
    userModel.email = user!.email;
    userModel.PhoneNo = phoneNo;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created Success");
    Navigator.pushNamed(context, LoginScreen.id);
  }
}