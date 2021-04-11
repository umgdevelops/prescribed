import 'package:flutter/material.dart';
import 'package:prescribed/clinicInfo.dart';
import 'package:prescribed/dbmodel.dart';
import 'package:prescribed/prescribingInterface.dart';
import 'package:prescribed/style.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Search extends StatefulWidget {
  final String patientUsername;
  Search({Key key, @required this.patientUsername}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<List<DoctorData>> doctorAvailable(String value) async {
    var jdata = {'action': 'doctorAvailable', 'value': value};
    var response = await http.post(myurl, body: jdata);
    var jsondata = jsonDecode(response.body);
    //print(response.body);
    //print(jsondata);

    List<DoctorData> doctors = [];
    for (var u in jsondata) {
      DoctorData obj = DoctorData(u["doctor_id"], u["doctor_fname"],
          u["doctor_lname"], u["doctor_user"], u["doctor_phone"]);
      doctors.add(obj);
    }
    return (doctors);
  }

  Future _future;
  String val;

//  void setValue(String value){
//    val=value;
//    _future = doctorAvailable(val);
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _future = doctorAvailable(val);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              decoration: textField("Search Doctor", Icon(Icons.search)),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _future = doctorAvailable(value);
                  });
                }
              },
            ),
            Flexible(
              child: FutureBuilder(
                future: _future,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Text(
                        "Start Typing First or Last name of the Doctor.\n\nGeneral physician - cold and cough, fever, headache🤧 🤕\nGynecologist - irregular periods, fungal infection, period cramps🙅‍♀️\nDentist - toothache, bleeding gums, mouth ulcers 🦷\nPediatrician - fever, child’s nutrition, bed wetting 👨‍👦\nDermatologist - itching, pigmentation, skin rashes 😰 😥\nOrthopedist - knee pain, frozen shoulder, muscle pain 💪 🦵\nPsychiatric - anxiety, mental health issues, depression 🤯",
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int id) {
                        return ListTile(
                          leading: Text(snapshot.data[id].username),
                          title: Text(snapshot.data[id].fname +
                              " " +
                              snapshot.data[id].lname),
                          subtitle: Text(snapshot.data[id].phone),
                          onTap: () {
                            return Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  print(widget.patientUsername);
                                  return ClinicInfo(
                                    name: snapshot.data[id].fname +
                                        " " +
                                        snapshot.data[id].lname,
                                    uname: snapshot.data[id].username,
                                    id: snapshot.data[id].id,
                                    patientUsername: widget.patientUsername,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorData {
  final int id;
  final String fname;
  final String lname;
  final String username;
  final String phone;
  DoctorData(this.id, this.fname, this.lname, this.username, this.phone);
}
