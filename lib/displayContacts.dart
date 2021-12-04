import 'package:areej/addContact.dart';
import 'package:areej/contactModel.dart';
import 'package:areej/editPage.dart';
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
      appBar: AppBar(title: Text('Contact List'),),
      body: (contactList1.length == 0 || contactList1 == null)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(
                      0, (MediaQuery.of(context).size.width) / 4, 0, 0),
                  child: Center(
                    child: Text('NO contacts available'),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddContact()));
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            )
          : Container(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: ListView.builder(
                            itemCount: contactList1.length,
                            itemBuilder: (context, index) {
                              final contact = contactList1[index];
                              return GestureDetector(
                                onTap: () {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext) => AlertDialog(
                                            actionsPadding: EdgeInsets.all(7),
                                            title: Text(
                                                '${contact.firstName} ${contact.lastName}'),
                                            content: Column(
                                              children: [
                                                Text('${contact.firstPhone}'),
                                                Text('${contact.lastPhone}'),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    final x = index;
                                                    contactListDisplay
                                                        .choosenIndex = x;
                                                    print(x);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditContact()));
                                                  },
                                                  child: Text('edit')),
                                              TextButton(
                                                  onPressed: () {
                                                    contactListDisplay
                                                        .deleteContact(index);
                                                    Navigator.pop(
                                                        context, 'Delete');
                                                  },
                                                  child: Text('Delete')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context, 'close');
                                                  },
                                                  child: Text('close')),
                                            ],
                                          ));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                          '${contact.firstName[0].toUpperCase()}'),
                                    ),
                                    title: Text(
                                        '${contact.firstName} ${contact.lastName}'),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddContact()));
                            },
                            child: Icon(Icons.add),
                          ),
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
