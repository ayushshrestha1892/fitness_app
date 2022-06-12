import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/screens/live_page.dart';
import 'package:fitness_app/screens/home_page.dart';
import 'package:fitness_app/screens/login/signup/login_screen.dart';
import 'package:fitness_app/screens/profile_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  int currentIndex = 0;

  final screens = [
    MyMapPage(),
    HomePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Welcome ${loggedInUser.firstName} ${loggedInUser.lastName} "),
        leading: SizedBox(
          height: 10,
          child: Image.asset(
            "assets/logo.png",
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.account_circle),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                logout(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: screens[currentIndex],

      // body: Center(
      //     child: Padding(
      //   padding: EdgeInsets.all(20),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       SizedBox(
      //         height: 180,
      //         child: Image.asset(
      //           "assets/logo.png",
      //           fit: BoxFit.contain,
      //         ),
      //       ),
      //       Text(
      //         "Welcome back",
      //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(
      //         height: 6,
      //       ),
      //       ActionChip(
      //           label: Text("logout"),
      //           onPressed: () {
      //             logout(context);
      //           }),
      //     ],
      //   ),
      // )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.white,
          selectedFontSize: 15,
          unselectedItemColor: Colors.white70,
          // showUnselectedLabels: false,

          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Live',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ]),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
