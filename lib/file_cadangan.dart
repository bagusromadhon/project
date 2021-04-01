import 'package:flutter/material.dart';
import 'package:nyoba_authentication/auth_service.dart';
import 'auth_service.dart';
class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text:"");
  TextEditingController passwordController = TextEditingController(text:"");  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Login page")),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 500,
              height: 100,
              child: TextField(
                controller: emailController,
              ),
            ),
            Container(
              width: 500,
              height: 100,
              child: TextField(
                controller: passwordController,
              ),
            ),
            RaisedButton(
            child: Text("Login Tamu"),
              onPressed: () async{
                await AuthServices.signInAnonymous();

              }
            ),

            RaisedButton(
            child: Text("Sign In"),
              onPressed: () async{
               await AuthServices.signIn(emailController.text,passwordController.text);               

              }
            ),

            RaisedButton(
            child: Text("Sign up"),
              onPressed: () async{
               await AuthServices.signUp(emailController.text,passwordController.text);               

              }
            ),

          ],
        ),

      ),
      
    );
  }
}