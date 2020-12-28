import 'package:bytebank/screens/contact_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('Dashboard')
        ),
        drawer: Drawer(),
        body: Column(
            children:[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('images/bytebank_logo.png'),
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuBlock('Contacts', Icons.people, ContactsList()),
                        MenuBlock('Clock', Icons.alarm, ContactsList()),
                      ]
                  )
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuBlock('Contacts', Icons.people, ContactsList()),
                        MenuBlock('Clock', Icons.alarm, ContactsList()),
                      ]
                  )
              )
            ]
        )

    );
  }
}

class MenuBlock extends StatelessWidget {

  final String title;
  final IconData blockIcon;
  final Widget refWidget;

  MenuBlock(this.title, this.blockIcon, this.refWidget);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactsList()));
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          width: 160,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(blockIcon, color: Colors.white, size: 32),
              Text(title, style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}
