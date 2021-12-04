import 'package:areej/contactModel.dart';
import 'package:areej/displayContacts.dart';
import 'package:areej/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditContact extends StatefulWidget {
  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  @override
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstphoneController = TextEditingController();
  final secondphoneController = TextEditingController();
  Widget build(BuildContext context) {
    var contactprov = Provider.of<HomeProvider>(context);
   
       
      firstNameController.text =  '${contactprov.cont[contactprov.choosenIndex].firstName}';
      lastNameController.text = '${contactprov.cont[contactprov.choosenIndex].lastName}';
       firstphoneController.text = '${contactprov.cont[contactprov.choosenIndex].firstPhone}';
      secondphoneController.text =  '${contactprov.cont[contactprov.choosenIndex].lastPhone}';
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: firstNameController,
              decoration: InputDecoration(
                  labelText: 'First Name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: lastNameController,
              decoration: InputDecoration(
                  labelText: 'last name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: firstphoneController,
              decoration: InputDecoration(
                  labelText: 'first phone ',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: secondphoneController,
              decoration: InputDecoration(
                  labelText: 'second phone',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            FlatButton(
                onPressed: () {
                  contactprov.editContact(ContactModel(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    firstPhone: firstphoneController.text,
                    lastPhone: secondphoneController.text == null
                        ? ''
                        : secondphoneController.text,
                  ));
                  print(
                      contactprov.cont[contactprov.cont.length - 1].firstName);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayContacts()));
                },
                child: Text('Edit'))
          ],
        ),
      ),
    );
  }
}
