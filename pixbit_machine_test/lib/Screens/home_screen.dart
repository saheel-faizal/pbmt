import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixbit_machine_test/Screens/contact_details.dart';
import 'package:pixbit_machine_test/model/contact_model.dart';
import 'package:pixbit_machine_test/provider/contacts_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ContactsProvider>(context,listen: false).contactsdata();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[400],
        child: Icon(Icons.add),
      ),
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('All contacts'),
        actions: const [
          Icon(Icons.sort)
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Consumer<ContactsProvider>(
          builder: (context,snapshot,child) {
            if(snapshot.getcontacts != null){
              List<Datum> data = snapshot.getcontacts.data.data;
              data.sort((a,b){
                return a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase());
              });

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Search all contacts"
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context,index){
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[200])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactDetails(
                                  name:  data[index].firstName +  data[index].lastName,
                                  phone: data[index].mobile.toString(),
                                  email: data[index].email,
                                  profilePic: "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg",
                                )));
                              },
                              leading:  const CircleAvatar(
                                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg"),),title:  Text(data[index].firstName + data[index].lastName ),minLeadingWidth: 50,),
                          ),
                        );

                      })



                ],
              );
            }else{
              return const Center(child: CupertinoActivityIndicator());
            }

          }
        ),
      ),
    );
  }
}
