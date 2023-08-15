import 'package:chat_project/provider/auth_provider.dart';
import 'package:chat_project/ui/auth/auth_screen.dart';
import 'package:chat_project/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<AuthProvider>().listenAuthState(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );

          }else if(snapshot.data == null){
            return AuthScreen();
          }else{
            return HomeScreen();
          }
        },
      ),
    );
  }
}
