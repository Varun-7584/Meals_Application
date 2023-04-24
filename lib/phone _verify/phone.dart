import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newmeals/phone_model/user_model.dart';

class MyPhone extends StatefulWidget {
  //declare a static method so the verification id and sms code can be verified
  static String verify = "" ;
  //extract from below where code is send ... i.e  send the code

  @override
  State<MyPhone> createState() => _MyPhoneState();

}


class _MyPhoneState extends State<MyPhone> {
  //ex: +91
  TextEditingController countryController = TextEditingController();
//make a phone variable
  var phone ="";
  //extract the phone number from text field with a value

  //created a instance to get the phone no.
  User? user = FirebaseAuth.instance.currentUser;

  UserModel signedUpUser = UserModel();
//create a init state
  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value){
      this.signedUpUser = UserModel.fromMap(value.data());
      setState((){});

    });

  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   countryController.text = "+91";
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: Colors.grey),
                //     borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // SizedBox(
                    //   width: 40,
                    // child: TextField(
                    //   // onChanged: (value){
                    //   //   cCode = value ;
                    //   // },
                    //   controller:  countryController ,
                    //   keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //   ),
                    // ),
                    // ),
                    // Text(
                    //   "|",
                    //   style: TextStyle(fontSize: 33, color: Colors.grey),
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Text("${signedUpUser.PhoneNo}"
                      ,style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      // otp sending
                      /// await FirebaseAuth.instance.verifyPhoneNumber(
                      //   phoneNumber: '${signedUpUser.PhoneNo}',
                      //   verificationCompleted: (PhoneAuthCredential credential) {},
                      //   verificationFailed: (FirebaseAuthException e) {},
                      //   codeSent: (String verificationId, int? resendToken) {
                      //     MyPhone.verify = verificationId;
                      //     //this verification id can be used in otp screen
                      //     Navigator.pushNamed(context,'verify');
                      //   },
                      //
                      //   codeAutoRetrievalTimeout: (String verificationId) {
                      //   },
                      /// );
                      final session = await user?.multiFactor.getSession();
                      final auth = FirebaseAuth.instance;
                      await auth.verifyPhoneNumber(
                        multiFactorSession: session,
                        phoneNumber:'${signedUpUser.PhoneNo}',
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.pushNamed(context,'verify');
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
