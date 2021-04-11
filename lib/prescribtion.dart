import 'package:flutter/material.dart';

void main() => runApp(Precribtion());

class Precribtion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'prescription',
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      home: Mystatefullwidget(),
    );
  }
}

class Mystatefullwidget extends StatefulWidget {
  @override
  _Mystatefullwidget createState() => _Mystatefullwidget();
}

class _Mystatefullwidget extends State<Mystatefullwidget> {

  Icon cusIcon = Icon(Icons.search);
  Widget cussearchbar = Text("DashBoard");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: cussearchbar, actions: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              if (this.cusIcon.icon == Icons.search) {
                this.cusIcon = Icon(Icons.cancel);
                this.cussearchbar = TextField(
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    //colors: Colors.white,
                    hintText: "Search here",
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                );
              } else {
                this.cusIcon = Icon(Icons.search);
                this.cussearchbar = Text("DashBoard");
              }
            });
          },
          icon: cusIcon,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        )
      ]),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: new Text("Welcome"),
              accountEmail: new Text("Dr. Himanshu "),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("H"),
                foregroundColor: Colors.black,
              ),
            ),
            // new ListTile(
            //   title: new Text("Home"),
            //   trailing: new Icon(Icons.home),
            //   onTap: () {
            //     // ignore: unnecessary_statements
            //     () => Navigator.of(context).pop();
            //     Navigator.of(context).pushNamed("/a");
            //   },
            // ),
            new ListTile(
              title: new Text("Appointments"),
              trailing: new Icon(Icons.calendar_today),
              onTap: () {
                //() => Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/b");
              },
            ),
            new ListTile(
              title: new Text("Services"),
              trailing: new Icon(Icons.medical_services),
              onTap: () {
                // ignore: unnecessary_statements
                    () => Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/c");
              },
            ),
            new ListTile(
              title: new Text("profile Settings"),
              trailing: new Icon(Icons.settings),
              onTap: () {
                //() => Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/d");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),



      body: Center(
        child: Text("prescription"),
      ),
    );
  }
}
