import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uni_jhang/views/admission.dart';
import 'package:uni_jhang/views/intro.dart';
import 'package:uni_jhang/views/login.dart';
import 'package:uni_jhang/views/result.dart';

class HomePageExam extends StatefulWidget {
  const HomePageExam({Key? key}) : super(key: key);

  @override
  State<HomePageExam> createState() => _HomePageExamState();
}

class _HomePageExamState extends State<HomePageExam> {
  String? displayName;
  bool admission = false;
  bool exam = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          setState(() {
            var test = docSnapshot.data();
            displayName = test['firstName'] + " " + test['lastName'];
          });
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

    admission = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Color(0xff764abc)),
                accountName: Text(
                  displayName.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "${FirebaseAuth.instance.currentUser?.email}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blueAccent.shade400,
                  child: Text(
                    "${displayName?.substring(0, 1)}",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout_outlined,
                ),
                title: const Text('Logout'),
                onTap: () {
                  FirebaseAuth.instance
                      .signOut()
                      .whenComplete(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UOJHomePage()),
                          ));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xff764abc),
          title: const Text('University of Jhang'),
          actions: [
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  exam = true;
                  admission = false;
                });
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text('Exams'),
            ),
            const SizedBox(width: 80),
            const SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
        body: Center(child: ResultScreen()));
  }
}
