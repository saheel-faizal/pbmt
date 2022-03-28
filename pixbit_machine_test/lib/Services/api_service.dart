import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:pixbit_machine_test/Screens/home_screen.dart';
import 'package:pixbit_machine_test/model/contact_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService{

  Future<Getcontactmodel> getcontactList() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    var url = 'http://training.pixbit.in/api/employees';
    var response =await http.get(Uri.parse(url),headers: {
      "Authorization":"Bearer $token"
    });
    print(response.body);

    return Getcontactmodel.fromJson(jsonDecode(response.body));
  }

   loginType(context,String email,String password) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = 'http://training.pixbit.in/api/login';
    var response =await http.post(Uri.parse(url),
        body: {
      "email":email,
      "password":password,
    });
    var data = jsonDecode(response.body);
    var message = data['message'];



    if(response.statusCode == 200){
      var datas = data['data'];
      var token = datas['access_token'];
      sharedPreferences.clear();
      if(message == 'User Logged in') {
        sharedPreferences.setString("token", token.toString());
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()),(route) => false);
      }
    }else{
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.toString())));

    }

  }

}