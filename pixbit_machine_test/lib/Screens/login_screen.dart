import 'package:flutter/material.dart';
import 'package:pixbit_machine_test/Services/api_service.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey =  GlobalKey();
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color _colorFromHex(String hexColor) {
      final hexCode = hexColor.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign In",style: TextStyle(color: Colors.blueGrey[700],fontSize: 50),),
            ],
          ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value){
                      if(value.isEmpty){
                        return "Field is Empty";
                      }else{
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value){
                      if(value.isEmpty){
                        return "Field is Empty";
                      }else{
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Forgot Password?',style: TextStyle(color: Colors.deepOrange,fontSize: 20),)

                  ],),
                ),

                const SizedBox(height: 15,),

                SizedBox(
                  width: size.width * 0.8,
                  height: 47,
                  child: MaterialButton(onPressed: (){
                    if(formKey.currentState.validate()){
                      apiService.loginType(context, emailController.text, passwordController.text);
                    }

                  },color: _colorFromHex("#fc6945"),child: const Text("Sign In",style: TextStyle(color: Colors.white),),),
                )

              ],
            )

        ],),
      ),

    );
  }
}
