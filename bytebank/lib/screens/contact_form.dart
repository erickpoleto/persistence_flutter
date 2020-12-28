import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final ContactDao contactDao = ContactDao();

  onCreate () {
    final String name = _nameController.text;
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final Contact newContact = Contact(null, name, accountNumber);
    contactDao.save(newContact).then((id) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputField('Full name', TextInputType.text, _nameController),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InputField('Account number', TextInputType.number, _accountNumberController),
            ),
            Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () {
                    this.onCreate();
                  },
                  child: Text('Create'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final TextInputType inputType;

  InputField(this.label, this.inputType, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label
      ),
      style: TextStyle(fontSize: 20),
      keyboardType: inputType,
    );
  }
}

