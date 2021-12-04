import 'package:areej/contactModel.dart';
import 'package:areej/displayContacts.dart';
import 'package:areej/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  final cont1 = TextEditingController();
  Widget build(BuildContext context) {
    var contactprov = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: cont1,
            ),
            FlatButton(
                onPressed: () {
                  contactprov.addContact(ContactModel(
                      firstName: cont1.text, lastName: 'a', firstPhone: 'h'));
                  print(contactprov.cont[contactprov.cont.length-1].firstName);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayContacts()));
                },
                child: Text('add'))
          ],
        ),
      ),
    );
  }
}
