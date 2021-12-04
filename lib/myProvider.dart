import 'package:areej/contactModel.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  List<ContactModel> cont = [];
  addContact(ContactModel c) {
    cont.add(c);
    notifyListeners();
  }
}
