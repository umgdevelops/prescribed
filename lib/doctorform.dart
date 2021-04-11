import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescribed/checks.dart';
import 'package:prescribed/style.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Doctorform());

class Doctorform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'doctor form',
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      home: Mystatefullwidget(
        name: "himanshu",
        uname: 'himanshu321',
        id: 21,
        doctorUname: 'himanshu321',
      ),
    );
  }
}

class Mystatefullwidget extends StatefulWidget {
  final String name;
  final String uname;
  final int id;
  final String doctorUname;

  Mystatefullwidget(
      {Key key,
      @required this.name,
      @required this.uname,
      @required this.id,
      @required this.doctorUname})
      : super(key: key);

  // String grpVal;
  // String grpVal1;
  @override
  _Mystatefullwidget createState() => _Mystatefullwidget();
}

class _Mystatefullwidget extends State<Mystatefullwidget> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String validate() {
    if (formkey.currentState.validate()) {
      return "Validated";
    } else {
      return "NotValidated";
    }
  }

  Icon cusIcon = Icon(Icons.search);
  Widget cussearchbar = Text("DashBoard");

  bool indicator = true;
  DateTime _dateTime;
  String grpVal;
  String grpVal1;
  String medicineName, others = "No Data";
  String times, days;
  String prescription_id;

  void fetchPrescriptionId() async {
    var jdata1 = {
      'action': 'makePrescription',
      'pid': widget.id.toString(),
      'duname': widget.doctorUname,
    };
    var response1 = await http.post(myurl, body: jdata1);
    prescription_id = response1.body;
  }

  void initState() {
    setState(() {
      grpVal = 'Tablet';
      grpVal1 = 'No';
    });
    //fetchPrescriptionId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Start prescribing here... ",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Medicine name',
                            hintText: "Enter medicine details",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                        onChanged: (val) {
                          medicineName = val;
                        },
                        validator: check,
                      ),
                      SizedBox(
                        height: 12,
                      ),

                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       labelText: 'Description',
                      //       hintText: "Enter medicine Description details",
                      //       floatingLabelBehavior: FloatingLabelBehavior.always,
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(25))),
                      // ),

                      Row(children: [
                        //Text("NRx:"),
                        Radio(
                          value: 'Tablet',
                          groupValue: grpVal,
                          onChanged: (val) {
                            grpVal = val;
                            setState(() {});
                          },
                        ),

                        Text('Tablet'),
                        SizedBox(
                          width: 5.0,
                        ),
                        Radio(
                          value: 'Syrup',
                          groupValue: grpVal,
                          onChanged: (val) {
                            grpVal = val;
                            setState(() {});
                          },
                        ),
                        Text('Syrup'),
                        SizedBox(
                          width: 5.0,
                        ),
                        Radio(
                          value: 'Cream',
                          groupValue: grpVal,
                          onChanged: (val) {
                            grpVal = val;
                            setState(() {});
                          },
                        ),
                        Text('Cream/Ointment'),
                        SizedBox(
                          width: 5.0,
                        ),

//                  spaceWidth,
//                  Radio(),
//                  Text('Eye Drop'),
                      ]),
                      Row(
                        children: [
                          Radio(
                            value: 'Powder',
                            groupValue: grpVal,
                            onChanged: (val) {
                              grpVal = val;
                              setState(() {});
                            },
                          ),
                          Text('Powder'),
                          Radio(
                            value: 'Eye Drop',
                            groupValue: grpVal,
                            onChanged: (val) {
                              grpVal = val;
                              setState(() {});
                            },
                          ),
                          Text('EyeDrops'),
                        ],
                      ),

                      Row(children: [
                        Text("NRx:"),
                        Radio(
                          value: 'Yes',
                          groupValue: grpVal1,
                          onChanged: (val) {
                            setState(() {
                              grpVal1 = val;
                            });
                          },
                        ),
                        Text('Yes'),

                        Radio(
                          value: 'No',
                          groupValue: grpVal1,
                          onChanged: (val) {
                            setState(() {
                              grpVal1 = val;
                            });
                          },
                        ),
                        Text('No'),

                        // Radio(value: 'null', groupValue: null, onChanged: null),
                        // Text('Powder', style: TextStyle(fontSize: 15)),
                      ]),
                      grpVal1 == 'Yes'
                          ? Column(children: [
                              //spaceHeight,
                              Text(_dateTime == null
                                  ? 'Nothing has been picked yet'
                                  : _dateTime.toString().substring(0, 10)),
                              RaisedButton(
                                child: Text('Only Valid Until'),
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: _dateTime == null
                                              ? DateTime.now()
                                              : _dateTime,
                                          firstDate: DateTime(2001),
                                          lastDate: DateTime(2030))
                                      .then((date) {
                                    setState(() {
                                      _dateTime = date;
                                      String dateStr = _dateTime.toString();
                                      print(dateStr.substring(0, 10));
                                    });
                                  });
                                },
                              ),
                            ])
                          : SizedBox(
                              height: 10,
                            ),

                      //   Row(children: [

                      //   ]),
                      //   Row(children: [

                      //   ]),

                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          //labelText: 'Description',
                          hintText: "'How many times in a day?'",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          // textField(
                          // 'How many times in a day?',
                          //Icon(Icons.countertops),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          //times = int.parse(val);
                          times = val;
                        },
                        validator: check,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          //labelText: 'Description',
                          hintText: "'How many days?'",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          // textField(
                          // 'How many times in a day?',
                          //Icon(Icons.countertops),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          //days = int.parse(val);
                          //days = val;
                        },
                        validator: check,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          //labelText: 'Description',
                          hintText: "other details (optional)",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 5,
                        onChanged: (val) {
                          //others = val;
                        },
                      ),
                      indicator
                          ? FlatButton(
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: Colors.orange,
                                ),
                              ),
                              color: Colors.white,
                              child: Text(
                                'Prescribe',
                                style: btnTxt,
                              ),
                              onLongPress: () {
                                return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert('Click for Prescribing more.',
                                        'Medicine Recorded!');
                                  },
                                );
                              },
                              onPressed: () async {
                                void stateToggle(bool whatChange) {
                                  setState(() {
                                    indicator = whatChange;
                                  });
                                }

                                if (validate() == "Validated") {
                                  stateToggle(false);

                                  String date;
                                  _dateTime != null
                                      ? date =
                                          _dateTime.toString().substring(0, 10)
                                      : date = _dateTime.toString();

                                  var jdata = {
                                    'action': 'storeMedicine',
                                    'medpres_id': prescription_id,
                                    'medicine_name': medicineName,
                                    'medicine_type': grpVal,
                                    'isNRX': grpVal1,
                                    'validUntil': date,
                                    'kitniBaar': times,
                                    'kitneDin': days,
                                    'others': others
                                  };

                                  await http.post(myurl, body: jdata);
                                  stateToggle(true);

                                  return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert(
                                          'Click for Prescribing more.',
                                          'Medicine Recorded!');
                                    },
                                  );
                                }
                              },
                            )
                          : orangeCircularIndicator(),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: FloatingActionButton(
                //     child: Icon(Icons.mic),
                //     backgroundColor: Colors.pinkAccent,
                //     onPressed: () {
                //       // if (_isavailable && !_islistening)
                //       //   _speechRecognition
                //       //       .listen(locale: "en_US")
                //       //       .then((result) => print('$result'));
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
