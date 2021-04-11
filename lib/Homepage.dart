import 'package:prescribed/appointment_screen.dart';
import 'package:prescribed/patientlist.dart';
import 'package:prescribed/profile_settings.dart';
import 'package:prescribed/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appointment.dart';

void main() => runApp(Homepage());

class Homepage extends StatelessWidget {
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
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      title: 'Homepage',
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
  int current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
              accountEmail: new Text("Dr. Raj Ghatkar"),
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
      body: SingleChildScrollView(
        child: new Container(
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(left: 16, top: 16),

                // ),
                Text("Update your ",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    )),
                Text('Patients count',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    )),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //child: patientCount == 'responseDataNotAvailableYet'
                      //? orangeCircularIndicator()
                     child : Row(
                    children: [
                      Container(
                        child: Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Change The Count',
                              labelText: 'Upadte',
                              floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(25)),
                            ),
                            onChanged: (value) {
                              //updatedCount = value;
                            },

                            //spaceHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Text('Update',
                              //style: btnTxt,
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          color: Colors.deepPurpleAccent,
                          onPressed: () async {
                            // var jdata = {
                            //   'action': 'updateCount',
                            //   'count': updatedCount,
                            //   'doctor_user': widget.uname
                            // };
                            // var resp =
                            //     await http.post(myurl, body: jdata);
                            // print(resp.body);
                            // asyncData();
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(children: [
                      Text(
                        'Patient Count: 3 ',
                        style: TextStyle(
                          color: Colors.black, //Color(0xff0490c1),
                          fontFamily: 'Comfortaa',
                          fontSize: 20.0,
                        ),
                      ),
                    ]),
                  ),
                ),

                Center(
                  child: FlatButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      return Navigator.push(
                          context,
                          //MaterialPageRoute(
                          //builder: (context) {
                          //     return DoctorDashboard1(
                          //       uname: widget.uname,
                          //     );
                          //   },
                          // ));

                          MaterialPageRoute(
                              builder: (context) => Patientlist()));
                    },
                    child: Text(
                      'Check your Todays Appointments', //+ widget.uname,
                      style: TextStyle(
                        color: Colors.white, //Color(0xff0490c1),
                        fontFamily: 'Comfortaa',
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),

                // Container(
                //     height: 180,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       padding: EdgeInsets.only(left: 8, right: 6, top: 8),
                //       itemCount: cards.length,
                //       itemBuilder: (context, index) {
                //         return Container(
                //           margin: EdgeInsets.only(right: 14),
                //           height: 150,
                //           width: 344,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(28),
                //             color: Colors.deepPurpleAccent,
                //           ),
                //           child: Stack(
                //             alignment: Alignment(
                //               -0.8,
                //               -0.8,
                //             ),
                //             children: [
                //               Positioned(
                //                 child: Image.asset(
                //                   "assets/images/calen.png",
                //                   height: 40,
                //                   width: 40,
                //                 ),
                //               ),
                //               Positioned(
                //                 left: 250,
                //                 top: 90,
                //                 child: Image.asset(
                //                   "assets/images/circle.png",
                //                   height: 170,
                //                   width: 170,
                //                 ),
                //               ),
                //               Positioned(
                //                 left: 29,
                //                 top: 70,
                //                 child: Text(
                //                   cards[index].user,
                //                   style: GoogleFonts.inter(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.w700,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //               ),
                //               Positioned(
                //                 left: 29,
                //                 top: 95,
                //                 child: Text(
                //                   cards[index].mobileno,
                //                   style: GoogleFonts.inter(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.w500,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //             //children
                //           ),
                //         );
                //       },
                //     )
                // ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, bottom: 13, top: 20, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Refer older patients",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: map<Widget>(cards, (index, selected) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 9,
                            width: 9,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: current == index
                                    ? Colors.deepPurpleAccent
                                    : Colors.grey),
                          );
                        }),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cards.length,
                    padding: EdgeInsets.only(left: 12),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: Operationcard(
                            operation: cards[index].user,
                            selectedicon: cards[index].mobileno,
                            isselected: current == index,
                            context: this),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, bottom: 13, top: 20, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Patient History",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cards.length,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      margin: EdgeInsets.only(bottom: 13),
                      padding: EdgeInsets.only(left: 20, top: 12, right: 22),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15,
                              spreadRadius: 3,
                              offset: Offset(8.0, 8.0),
                            ),
                          ]),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 57,
                                  width: 57,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                        "assets/images/wear_mask.png",
                                      )))),
                              SizedBox(
                                width: 13,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Himanshu Salagre",
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ], //widget
            ),
          ),
        ),
      ),
    );
  }
}

class Operationcard extends StatefulWidget {
  final String operation;
  final String selectedicon;
  final String unselectedicon;
  final bool isselected;

  Operationcard(
      {this.operation,
      this.selectedicon,
      this.unselectedicon,
      this.isselected,
      _Mystatefullwidget context});

  @override
  _OperationcardState createState() => _OperationcardState();
}

class _OperationcardState extends State<Operationcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18, bottom: 10),
      width: 115,
      height: 115,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              spreadRadius: 2,
              offset: Offset(6.0, 6.0),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: widget.isselected ? Colors.deepPurpleAccent : Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/fever.png",
            height: 70,
            width: 70,
            scale: 1,
          ),

          // SvgPicture.asset(
          //     widget.isselected ? widget.selectedicon : widget.unselectedicon),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: widget.isselected ? Colors.white : Colors.deepPurpleAccent,
            ),
          )
        ],
      ),
    );
  }
}
