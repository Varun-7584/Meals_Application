import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:newmeals/widgets/main_drawer.dart';
import 'package:newmeals/Login/screens/homepage/components/home_page_body.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

Color _mainDarkColor = Color(0xff002638);

class _MyHomepageState extends State<MyHomepage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen.shade100,
        appBar: AppBar(
          title: Text(
            "User: ${user.email!}",
            style: const TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
          ],
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 20.0,
                child: Lottie.asset('Animation/72342-welcome.json'),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightGreen.shade700,
                      ),
                      height: 50.0,
                      width: double.infinity,
                      child: TextButton(onPressed: () {
                        Navigator.of(context).pushNamed('/tabsScreen');
                      },
                        child: Text('Meals Application',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightGreen.shade700,
                      ),
                      height: 50.0,
                      width: double.infinity,
                      child: TextButton(onPressed: () {
                        Navigator.of(context).pushNamed('/prdovr');

                      },
                        child: Text('Shopping Application',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightGreen.shade700,
                      ),
                      height: 50.0,
                      width: double.infinity,
                      child: TextButton(onPressed: () {  },
                        child: Text('Cart App',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

    );
  }
}
