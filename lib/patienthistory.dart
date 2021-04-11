import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Patienthistory());

// class Patienthistory extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'prescription history',
//       theme: new ThemeData(primarySwatch: Colors.deepPurple),
//       home: Mystatefullwidget(),
//     );
//   }
// }

class Patienthistory extends StatefulWidget {
  @override
  _Patienthistory createState() => _Patienthistory();
}

class _Patienthistory extends State<Patienthistory> {
  Icon cusIcon = Icon(Icons.search);
  Widget cussearchbar = Text("DashBoard");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8fA),
      // appBar: AppBar(title: cussearchbar, actions: <Widget>[
      //   IconButton(
      //     onPressed: () {
      //       setState(() {
      //         if (this.cusIcon.icon == Icons.search) {
      //           this.cusIcon = Icon(Icons.cancel);
      //           this.cussearchbar = TextField(
      //             textInputAction: TextInputAction.go,
      //             decoration: InputDecoration(
      //               //colors: Colors.white,
      //               hintText: "Search here",
      //             ),
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 17.0,
      //             ),
      //           );
      //         } else {
      //           this.cusIcon = Icon(Icons.search);
      //           this.cussearchbar = Text("DashBoard");
      //         }
      //       });
      //     },
      //     icon: cusIcon,
      //   ),
      //   IconButton(
      //     onPressed: () {},
      //     icon: Icon(Icons.more_vert),
      //   )
      // ]),
      // drawer: new Drawer(
      //   child: new ListView(
      //     children: [
      //       new UserAccountsDrawerHeader(
      //         accountName: new Text("Welcome"),
      //         accountEmail: new Text("Dr. Himanshu "),
      //         currentAccountPicture: new CircleAvatar(
      //           backgroundColor: Colors.white,
      //           child: new Text("H"),
      //           foregroundColor: Colors.black,
      //         ),
      //       ),
      //       // new ListTile(
      //       //   title: new Text("Home"),
      //       //   trailing: new Icon(Icons.home),
      //       //   onTap: () {
      //       //     // ignore: unnecessary_statements
      //       //     () => Navigator.of(context).pop();
      //       //     Navigator.of(context).pushNamed("/a");
      //       //   },
      //       // ),
      //       new ListTile(
      //         title: new Text("Appointments"),
      //         trailing: new Icon(Icons.calendar_today),
      //         onTap: () {
      //           //() => Navigator.of(context).pop();
      //           Navigator.of(context).pushNamed("/b");
      //         },
      //       ),
      //       new ListTile(
      //         title: new Text("Services"),
      //         trailing: new Icon(Icons.medical_services),
      //         onTap: () {
      //           // ignore: unnecessary_statements
      //           () => Navigator.of(context).pop();
      //           Navigator.of(context).pushNamed("/c");
      //         },
      //       ),
      //       new ListTile(
      //         title: new Text("profile Settings"),
      //         trailing: new Icon(Icons.settings),
      //         onTap: () {
      //           //() => Navigator.of(context).pop();
      //           Navigator.of(context).pushNamed("/d");
      //         },
      //       ),
      //       new Divider(),
      //       new ListTile(
      //         title: new Text("Close"),
      //         trailing: new Icon(Icons.close),
      //         onTap: () => Navigator.of(context).pop(),
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          //overflow: Overflow.visible,
          children: [
            Container(
              color: Colors.deepPurpleAccent,
              height: 180,
              width: 380,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Text("H"),
                    foregroundColor: Colors.black,
                    radius: 40,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170, left: 10, right: 10),
              child: Flexible(
                child: Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      border: Border.all(
                        color: Colors.deepPurpleAccent,
                        width: 2,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              child: Text(
                                "Disease Description",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.amber,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              child: Text(
                                "Disease Symptoms",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 20),
                              child: Text(
                                "1. Fever with temperature 101 degree \n 2. Dry cough  \n 3. Little Headache ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.amber,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 150,
              top: 20,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Anand Deshmukh",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BMI : 9.1 kg/m2  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Height : 5.9 Inches ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Weight : 58 Kg",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Age :22",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.red, //                   <--- border color
      width: 1.0,
    ),
  );
}
