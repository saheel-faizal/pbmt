import 'package:flutter/material.dart';
import 'package:pixbit_machine_test/Services/api_service.dart';
import 'package:pixbit_machine_test/model/contact_model.dart';

class ContactsProvider extends ChangeNotifier{
  Getcontactmodel getcontacts;
  ApiService apiService = ApiService();


  Future contactsdata() async{
    getcontacts = await apiService.getcontactList();
    print(getcontacts.data.data[0].lastName);
    notifyListeners();
    return getcontacts.data.data;
  }

}