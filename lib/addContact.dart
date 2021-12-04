import 'package:areej/contactModel.dart';
import 'package:areej/displayContacts.dart';
import 'package:areej/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstphoneController = TextEditingController();
  final secondphoneController = TextEditingController();
  Widget build(BuildContext context) {
    var contactprov = Provider.of<HomeProvider>(context);
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
              keyboardType: TextInputType.number,
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
              keyboardType: TextInputType.number,
              controller: secondphoneController,
              decoration: InputDecoration(
                  labelText: 'second phone',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
            ),
            FlatButton(
                onPressed: () {
                 if((firstNameController.text)!=''&&  (lastNameController.text)!='' && (firstphoneController.text)!=''){
                      contactprov.addContact(ContactModel(
                    firstName: firstNameController.text,
                    lastName : lastNameController.text,
                    firstPhone:  firstphoneController.text,
                    lastPhone:  secondphoneController.text==null?'':secondphoneController.text,
                     ));
               
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayContacts()));
                 }
                 else{
                   Fluttertoast.showToast(
        msg: "please check that you write at least the first lasst and a first phone number",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 16.0
    );
                 }
                },
                child: Text('add'))
          ],
        ),
      ),
    );
  }
}
