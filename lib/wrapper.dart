import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nyoba_authentication/home_login.dart';
import 'package:nyoba_authentication/main_page.dart';
import 'package:provider/provider.dart';
import 'home_login.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser =Provider.of<FirebaseUser>(context);
    return (firebaseUser == null) ? HomePage() : MainPage(firebaseUser); 
  }
}