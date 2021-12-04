import 'package:areej/contactModel.dart';
import 'package:areej/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayContacts extends StatefulWidget {
  @override
  _DisplayContactsState createState() => _DisplayContactsState();
}

class _DisplayContactsState extends State<DisplayContacts> {
  Widget build(BuildContext context) {
    final contactListDisplay = Provider.of<HomeProvider>(context);
    final List<ContactModel> contactList1 = contactListDisplay.cont;
    
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: contactList1.length,
            itemBuilder: (context, index) {
              final contact = contactList1[index];
              return ListTile(
                leading: Text('${contact.firstName}'),
              );
            }),
      ),
    );
  }
}
