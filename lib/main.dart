import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Auth/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
runApp(MyApp());
}  

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override 
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                title: 'Flutter demo',
                theme: ThemeData(
                  primaryColor: Colors.blue,
                  ),
                    home: SignUp(),
              );
            }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text("Hello");
      },
    );
  }
}