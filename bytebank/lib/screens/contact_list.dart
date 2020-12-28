
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {

  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {

  final ContactDao contactDao = ContactDao();

  deleteData(id) {
    contactDao.delete(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts')
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: contactDao.findAll(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,),
                    Text('loading')
                  ],
                ),
              );
              break;
            case ConnectionState.done:
              if(snapshot.data.length < 1) {
                return Center(
                  child: Text("theres no data to show!", style: TextStyle(fontSize: 24)),
                );
              }
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return _ContactItem(contact.name, contact.accountNumber, contact, deleteData);
                },
                itemCount: contacts.length,
              );
              break;
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
          }
          return Text('Unknown error');
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactForm()))
        .then((value) => setState(() {})),
        child: Icon(Icons.add, size: 30,),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {

  final String name;
  final int accountNumber;
  final Contact contact;
  final Function(int) deleteData;

  _ContactItem(this.name, this.accountNumber, this.contact, this.deleteData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.name, style: TextStyle(fontSize: 24),),
        subtitle: Text(this.accountNumber.toString()),
        onLongPress: () {
          return showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Remove?'),
                content: Text("do you want to remove the data?"),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('no')
                  ),
                  FlatButton(
                    onPressed: () async {
                      await deleteData(this.contact.id);
                      Navigator.pop(context);
                    },
                    child: Text('yes')
                  )
                ],
              );
            }
          );
        },
      ),
    );
  }
}

