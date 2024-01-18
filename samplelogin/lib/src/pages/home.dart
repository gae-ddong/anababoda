import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samplelogin/src/pages/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if(!snapshot.hasData){
          return LoginWidget();
        }
        else{
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${snapshot.data?.displayName}님 welcome~!"),
                FilledButton(
                onPressed: FirebaseAuth.instance.signOut, 
                child: Text("google logout"))
              ],

            ),
            
          );
        }
      }),
    );
  }
}