import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

FirebaseAuth auth = FirebaseAuth.instance;

  void signUpAction() async{
    try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword
        ( 
        email: email, 
        password: password );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void signInAction() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  String email=' ';
  String password=' ';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.purple,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical:35, horizontal: 30),
        child: new Form(
          child: Column(
            children: [

              TextFormField(
                decoration: InputDecoration(
                hintText: 'Email'),
                onChanged: (val)=> setState((){
                  email=val;
                })
              ),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                hintText: 'Password'),
                onChanged: (val)=> setState((){
                  password=val;
                })
              ),

              // ignore: deprecated_member_use
              RaisedButton(
                child: Text('Sign Up'),
                onPressed:() async=> {
                  signUpAction()
                }
                ),

                // ignore: deprecated_member_use
                RaisedButton(
                child: Text('Sign In'),
                onPressed:() async=> {
                  signInAction()
                }
                )
          ],)),
      ),
    );
  }
}