
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  String name,profilePic,phone,email;
  ContactDetails({Key key,this.name,this.email,
    this.phone,this.profilePic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.edit),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      body: Stack(alignment: Alignment.centerRight,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.grey,
                  height: size.height * 0.5,
                    width: size.width,
                    child: Image.network(profilePic,fit: BoxFit.cover,)),
                SizedBox(height: 12,),
                ListTile(
                  leading: Icon(Icons.phone,color: Colors.blue[700],),
                  title: Text(phone.toString()),
                  subtitle: const Text('Mobile'),
                  trailing: const Icon(Icons.more),
                ),

                ListTile(
                  leading: Icon(Icons.email,color: Colors.blue[700],),
                  title: Text(email.toString()),
                  subtitle: const Text('Email'),
                )



              ],
            ),
          ),
          Positioned(
            right: 15,
              top: size.height * 0.45,
              child: CircleAvatar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.pink[400],radius: 35,
              child: Icon(Icons.star_rounded,size: 35,),)),
          Positioned(
            top: size.height * 0.4,
              left: size.width * 0.2,
              child: Text(name.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),))
        ],
      ),

    );
  }
}
