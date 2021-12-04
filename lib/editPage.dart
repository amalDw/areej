import 'package:areej/contactModel.dart';
import 'package:areej/displayContacts.dart';
import 'package:areej/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

    firstNameController.text =
        '${contactprov.cont[contactprov.choosenIndex].firstName}';
    lastNameController.text =
        '${contactprov.cont[contactprov.choosenIndex].lastName}';
    firstphoneController.text =
        '${contactprov.cont[contactprov.choosenIndex].firstPhone}';
    secondphoneController.text =
        '${contactprov.cont[contactprov.choosenIndex].lastPhone}';
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    if ((firstNameController.text) != '' &&
                        (lastNameController.text) != '' &&
                        (firstphoneController.text) != '') {
                      contactprov.editContact(ContactModel(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        firstPhone: firstphoneController.text,
                        lastPhone: secondphoneController.text == null
                            ? ''
                            : secondphoneController.text,
                      ));

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DisplayContacts()));
                    } else {
                      Fluttertoast.showToast(
                          msg: "please make sure to fill first,last name and first phone number",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 4,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Text('Edit')),
            )
          ],
        ),
      ),
    );
  }
}
