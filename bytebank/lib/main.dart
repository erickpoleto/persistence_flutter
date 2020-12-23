import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: Dashboard()
    );
  }
}

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
                    MenuBlock('Contacts', Icons.people),
                    MenuBlock('Clock', Icons.alarm),
                  ]
                )
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuBlock('Contacts', Icons.people),
                      MenuBlock('Clock', Icons.alarm),
                    ]
                )
            )
          ]
        )

    );
  }
}

class MenuBlock extends StatelessWidget {


  String title;
  IconData blockIcon;

  MenuBlock(this.title, this.blockIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 160,
      height: 120,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(blockIcon, color: Colors.white, size: 32),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 20))
        ],
      ),
    );
  }
}

