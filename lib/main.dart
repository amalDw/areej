

import 'package:areej/addContact.dart';
import 'package:areej/displayContacts.dart';
import 'package:areej/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<HomeProvider>(
    create: (context) => HomeProvider(),
    child: MaterialApp(
      home: DisplayContacts(),
    ),
  ));
}
