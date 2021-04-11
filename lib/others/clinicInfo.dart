import 'package:flutter/material.dart';
import 'package:prescribed/style.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ClinicInfo extends StatefulWidget {
  final int id;
  final String uname;
  final String name;
  final String patientUsername;
  ClinicInfo(
      {Key key,
      @required this.id,
      @required this.name,
      @required this.uname,
      @required this.patientUsername})
      : super(key: key);

  @override
  _ClinicInfoState createState() => _ClinicInfoState();
}

class _ClinicInfoState extends State<ClinicInfo> {
  var jsonData;
  String degree;
  bool loaded = false;

  void fetchClinicDetails() async {
    var jdata1 = {
      'action': 'fetchClinicDetails',
      'doctor_id': widget.id.toString()
    };
    var response = await http.post(myurl, body: jdata1);
    jsonData = jsonDecode(response.body);
    print(jsonData);
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    fetchClinicDetails();
    super.initState();
  }

  @override
  Text appointmentBookedMessage(String s) {
    return Text(
      s,
      style: btnTxt,
    );
  }

  String msg = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loaded
            ? Column(
                mainAxisAlignment: mainAxis,
                children: [
                  Text(
                    jsonData[0]["degree"] +
                        '\n' +
                        jsonData[0]['spl'] +
                        '\n\nAddress:' +
                        jsonData[0]['address'] +
                        '\n\n' +
                        jsonData[0]['startDay'] +
                        ' To ' +
                        jsonData[0]['endDay'] +
                        '\n\n' +
                        jsonData[0]['startTime'] +
                        ' To ' +
                        jsonData[0]['endTime'],
                    style: headTxt,
                  ),
                  FlatButton(
                    child: Text('Book'),
                    color: korange,
                    onPressed: () async {
                      print(widget.patientUsername);
                      print(widget.id.toString());
                      var jdata = {
                        'action': 'bookAppointment',
                        'patient_user': widget.patientUsername,
                        'doctor_id': widget.id.toString()
                      };
                      await http.post(myurl, body: jdata);
                      //print(response.body);
                      setState(() {
                        msg = "Appointment Booked Successfully!";
                      });
                    },
                  ),
                  appointmentBookedMessage(msg),
                ],
              )
            : Center(
                child: orangeCircularIndicator(),
              ),
      ),
    );
  }
}
