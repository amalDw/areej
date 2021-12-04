import 'package:flutter/cupertino.dart';

class ContactModel {
  String firstName;

  String lastName;
  String firstPhone;
  String lastPhone;
  ContactModel(
      {@required this.firstName,
      @required this.lastName,
      @required this.firstPhone,
      this.lastPhone});
}
