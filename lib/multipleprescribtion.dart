import 'package:prescribed/prescribinginterface.dart';
import 'package:prescribed/profile_settings.dart';
import 'package:prescribed/services.dart';
//import 'package:doctordashboard/utlis/Notes.dart';
//import 'package:doctordashboard/utlis/notes.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
//import 'package:dart:html';
import 'appointment_screen.dart';

//void main() => runApp(Multipleprescribtion());

class Multipleprescribtion extends StatelessWidget {
  final int index;
  Multipleprescribtion(this.index);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        // "/a": (BuildContext context) => new Profilesettings("Profile Settings"),
        "/b": (BuildContext context) =>
            new Appointmentscreen("Appointment_screen"),
        "/c": (BuildContext context) => new Services("Services"),
        "/d": (BuildContext context) => new Profilesettings("profile settings"),
      },
      title: 'Patient list',
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      home: Mystatefullwidget2(),
    );
  }
}

class Mystatefullwidget2 extends StatefulWidget {
  @override
  _Mystatefullwidget2 createState() => _Mystatefullwidget2();
}

class _Mystatefullwidget2 extends State<Mystatefullwidget2> {
  //List<Note> _notes;
  //mystatefullwidget() {
  //_notes = Notes.initializeNotes().getNotes;
  //}
// List names
  //  List names = [
  //   "Ram",
  //   "Sham",
  //   "Ghansham",
  //   "Suresh",
  //   "Ramesh",
  //   "Mahesh",
  //   "rahul",
  //   "xyz",
  //   "pqrs",
  //   "zaid"
  // ];
  // List designation = [
  //   "fever",
  //   "cough",
  //   "typhoid",
  //   "covid-19",
  //   "cough",
  //   "typhoid",
  //   "covid-19",
  //   "cough",
  //   "covid-19",
  //   "malaria",
  // ];

  Icon cusIcon = Icon(Icons.search);
  Widget cussearchbar = Text("DashBoard");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
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

      //drawer
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

      //app body begins here...
      // body:
      // child: ListView.builder(
      //   itemCount: 10,
      //   shrinkWrap: true,
      //   itemBuilder: (BuildContext context, int index) => Container(
      //     width: MediaQuery.of(context).size.width,
      //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
      //     child: Card(
      //       elevation: 15.0,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(0.0),
      //       ),
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   width: 55.0,
      //                   height: 55.0,

      //                   //color: Colors.deepPurple[300],
      //                   child: CircleAvatar(
      //                     backgroundColor: Colors.deepPurpleAccent,
      //                     foregroundColor: Colors.white,
      //                     child: new Text("H"),

      //                     //backgroundImage: NetworkImage(
      //                     //"https://image.flaticon.com/icons/png/512/16/16363.png"),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 10.0,
      //                 ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(names[index],
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             fontSize: 18,
      //                             fontWeight: FontWeight.bold)),
      //                     SizedBox(
      //                       height: 5.0,
      //                     ),
      //                     Text(designation[index],
      //                         style: TextStyle(
      //                             color: Colors.grey[700],
      //                             fontSize: 18,
      //                             fontWeight: FontWeight.bold)),
      //                   ],
      //                 )
      //               ],
      //             ),
      //             Container(
      //               alignment: Alignment.center,
      //               padding:
      //                   EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      //               //accept btn
      //               child: FlatButton(
      //                 onPressed: () {
      //                   Navigator.push(context,
      //                       MaterialPageRoute(builder: (context) {
      //                     return Prescribinginterface(index);
      //                   }));
      //                 },
      //                 color: Colors.deepPurpleAccent,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(20.0),
      //                 ),
      //                 child: Text(
      //                   "Click here",
      //                   style: TextStyle(fontSize: 12.0, color: Colors.white),
      //                 ),
      //               ),
      //             ),
      //             //reject btn
      //             // Expanded(
      //             //   child: Container(
      //             //     alignment: Alignment.center,
      //             //     padding: EdgeInsets.symmetric(
      //             //         horizontal: 5.0, vertical: 5.0),
      //             //     child: FlatButton(
      //             //       onPressed: () {},
      //             //       color: Colors.redAccent,
      //             //       shape: RoundedRectangleBorder(
      //             //         borderRadius: BorderRadius.circular(20.0),
      //             //       ),
      //             //       child: Text(
      //             //         "Reject",
      //             //         style: TextStyle(color: Colors.white),
      //             //       ),
      //             //     ),
      //             //   ),
      //             // ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      body: 
        _buildlistview(context),

            // Container(
            //   child: FloatingActionButton(
            //     child: Icon(Icons.note_add),
            //     mini: true,
            //     backgroundColor: Colors.deepOrange,
            //     onPressed: () {
            //
            //     },
            //   ),
            // ),

    );






  }

  ListView _buildlistview(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, index) {
        return Card(
          elevation: 10.0,
          child: ListTile(
            title: Text('prescribtion $index'),
            subtitle: Text('subtitle Disease'),
            leading: Icon(Icons.folder),
            //CircleAvatar(
            //   backgroundColor: Colors.deepPurpleAccent,
            //   foregroundColor: Colors.white,
            //   child: new Text("H"),
            // ),
            trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavBar1(index)

                      )
                      //onTap: () => Navigator.of(context).pop(),

                  );
                }

                ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavBar1(index)));
            },
          ),

        );

      },

    );


  }
}
