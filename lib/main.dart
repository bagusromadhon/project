import 'package:flutter/material.dart';
import 'package:nyoba_authentication/auth_service.dart';
import 'package:provider/provider.dart';
import 'wrapper.dart';
import 'main_page.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
 
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value:AuthServices.firebaseUserStream,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}