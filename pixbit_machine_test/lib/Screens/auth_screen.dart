import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixbit_machine_test/Screens/signup_screen.dart';

import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',height: size.width * 0.5,),
              ],
            ),
            const SizedBox(height: 10,),
            Text("DriverEx",style: TextStyle(color: Colors.deepOrange[300],fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),

        Column(
          children: [
            SizedBox(
              width: size.width * 0.8,
                height: 47,
                child: AuthButton(title: "Sign In",)),
            const SizedBox(height: 10,),
            SizedBox(
              width: size.width * 0.8,
                height: 47,
                child: AuthButton(title: "Register",)),
          ],
        ),

        Text('Take Tour',style: TextStyle(color: Colors.grey[700],fontSize: 18),),

      ],),

    );
  }
}

class AuthButton extends StatelessWidget {
  String title;
   AuthButton({
    Key key, this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _colorFromHex(String hexColor) {
      final hexCode = hexColor.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    }
    return MaterialButton(onPressed: (){
      title=="Sign In"? Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen())):
      Container();
    },color: _colorFromHex("#fc6945"),child: Text(title,style: const TextStyle(color: Colors.white),),);
  }
}
