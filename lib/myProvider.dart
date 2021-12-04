import 'package:areej/contactModel.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  List<ContactModel> cont = [];
  int choosenIndex = -1;
  addContact(ContactModel c) {
    cont.add(c);
    notifyListeners();
  }

  deleteContact(index) {
    cont.removeAt(index);
    notifyListeners();
  }

  editContact(ContactModel c) {
    cont[choosenIndex].firstName = c.firstName;
    cont[choosenIndex].lastName = c.lastName;
    cont[choosenIndex].firstPhone = c.firstPhone;
    cont[choosenIndex].lastPhone = c.lastPhone;
    notifyListeners();
  }
}
