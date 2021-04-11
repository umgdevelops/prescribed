import 'package:flutter/material.dart';
import 'package:prescribed/style.dart';
import 'package:http/http.dart' as http;

class Clinic extends StatefulWidget {
  @override
  final String uname;
  Clinic({Key key, @required this.uname}) : super(key: key);
  _ClinicState createState() => _ClinicState();
}

class _ClinicState extends State<Clinic> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked;
  String time1 = "Select Start Time";
  String time2 = "Select End Time";

  Future<Null> selectTime(BuildContext context, bool isStart) async {
    picked = await showTimePicker(context: context, initialTime: _time);
    final localizations = MaterialLocalizations.of(context);
    final formattedTimeOfDay = localizations.formatTimeOfDay(picked);
    print(formattedTimeOfDay);
    setState(() {
      _time = picked;
      isStart ? time1 = formattedTimeOfDay : time2 = formattedTimeOfDay;
    });
  }

  bool indicator = false;
  String selectedValue;
  String selectedSpl;
  String selectedStartDay;
  String selectedEndDay;
  String address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DropdownButton(
              hint: Text('Select Degree'),
              value: selectedValue,
              isExpanded: true,
              onChanged: (val) {
                setState(() {
                  selectedValue = val;
                });
                print(selectedValue);
              },
              items: degree.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
            spaceHeight,
            DropdownButton(
              hint: Text('Select Specialization'),
              value: selectedSpl,
              isExpanded: true,
              onChanged: (val) {
                setState(() {
                  selectedSpl = val;
                });
                print(selectedSpl);
              },
              items: spl.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
            spaceHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  hint: Text('Select Start Day'),
                  value: selectedStartDay,
                  onChanged: (val) {
                    setState(() {
                      selectedStartDay = val;
                    });
                    print(selectedStartDay);
                  },
                  items: days.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
                Text('To'),
                DropdownButton(
                  hint: Text('Select End Day'),
                  value: selectedEndDay,
                  onChanged: (val) {
                    setState(() {
                      selectedEndDay = val;
                    });
                    print(selectedEndDay);
                  },
                  items: days.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ],
            ),
            spaceHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    selectTime(context, true);
                  },
                  child: Text(time1),
                  color: Colors.yellow,
                ),
                Text('To'),
                FlatButton(
                  onPressed: () {
                    selectTime(context, false);
                  },
                  child: Text(time2),
                  color: Colors.yellow,
                ),
              ],
            ),
            spaceHeight,
            spaceHeight,
            TextFormField(
              decoration: textField(
                  'Type your Address here...', Icon(Icons.location_city)),
              minLines: 3,
              maxLines: 10,
              onChanged: (val) {
                address = val;
              },
            ),
            spaceHeight,
            indicator
                ? orangeCircularIndicator()
                : FlatButton(
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Colors.orange,
                      ),
                    ),
                    color: Colors.white,
                    child: Text(
                      'Submit',
                      style: btnTxt,
                    ),
                    onPressed: () async {
                      print(selectedValue);
                      if (address == null ||
                          selectedStartDay == null ||
                          selectedEndDay == null ||
                          selectedValue == null ||
                          selectedSpl == null ||
                          time1 == "Select Start Time" ||
                          time2 == "Select End Time") {
                        print("All Fields Mandatory");
                        return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert('All Fields are Mandatory');
                          },
                        );
                      } else {
                        setState(() {
                          indicator = true;
                        });
                        var jdata = {
                          'action': 'clinicDetails',
                          'doctorUser': widget.uname,
                          'address': address,
                          'startDay': selectedStartDay,
                          'endDay': selectedEndDay,
                          'degree': selectedValue,
                          'startTime': time1,
                          'endTime': time2,
                          'spl': selectedSpl
                        };
                        var response = await http.post(myurl, body: jdata);
                        print(response.body);
                        setState(() {
                          indicator = false;
                        });
                        return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert('Details Recorded!');
                          },
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

List degree = [
  "MBBS",
  "BDS",
  "BHMS",
  "BAMS",
  "DHMS",
  "BUMS",
  "B.V.Sc & AH",
  "BOT",
  "BPT",
  "BNYS"
];
List days = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday"
];

List spl = [
  'General physician',
  'Gynecologist',
  'Dentist',
  'Pediatrician',
  'Dermatologist',
  'Orthopedist',
  'Psychiatric'
];
