import 'package:flutter/material.dart';
import 'auth_service.dart';
class SignUpPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text:"");
  TextEditingController passwordController = TextEditingController(text:"");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
      elevation: 0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon:Icon(Icons.arrow_back_ios,
      size: 20,
      color:Colors.black,),


      ),
      ),
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Register",
                  style: TextStyle(fontSize:30, fontWeight:FontWeight.bold),
                  ),
                  SizedBox(height:20,),
                  Text("Register Akun Dan Login",
                  style: TextStyle(
                    fontSize:15,
                    color: Colors.grey[700]
                  ),),
                SizedBox(height:20),
                
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:40),
                child:Column(
                  children: <Widget>[
                  Container(
              width: 500,
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                   hintText: "Masukan Gmail",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Gmail",
                labelStyle: TextStyle(color: Colors.black87),
                ),
                controller: emailController,
              ),
            ),
            Container(
              width: 500,
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Masukan Password",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black87),
                ),
                controller: passwordController,
              ),
            ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal:40),
              
              
                child:Container(
                  padding: EdgeInsets.only(top:3, left:3),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    
                  ),
                  ),
                  child: RaisedButton(
                   
                    onPressed: () async{
                    await AuthServices.signUp(emailController.text,passwordController.text);   
                    },
                    color: Color(0xFF175FE4),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text("Register",style: TextStyle(fontWeight:FontWeight.w600,
                    fontSize: 10,
                    color: Colors.white,

                    ),
                    ),
                  ),
                ),
                ),
            

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sign Up", style:TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,

                  ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top:100),
                height: 200,
                decoration: BoxDecoration(
                  image:DecorationImage(image: AssetImage("assets/regis.png"),
                  fit:BoxFit.fitHeight
                  ),
                ),
              ),
            ],
          ),
          ),
          ],
        ),
      ),
    );
  }
}

Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
      label,
      style: TextStyle(
        fontSize:15,
        fontWeight:FontWeight.w400,
        color:Colors.black87,
      ),
      ),
      SizedBox(
        height: 5,

      ),
      TextField(
        obscureText:obscureText,
        decoration:InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400],
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.grey[400]),

          ),
          labelText: "password",
        ),
      ),
      SizedBox(height:10)
    ],
  );
}