import 'package:prescribed/constant.dart';
import 'package:prescribed/widgets/rounded_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookAppointmentForm extends StatefulWidget {
  BookAppointmentForm({
    @required this.patientUsername,
    @required this.doctorId,
  });
  final String patientUsername;
  final int doctorId;
  @override
  _BookAppointmentFormState createState() => _BookAppointmentFormState();
}

class _BookAppointmentFormState extends State<BookAppointmentForm> {
  
  // first time it holds the default date
  // Defaults to today's date.
  DateTime selectedDate = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay selectedTime;
  String formattedTime;
  String timeText = 'You need to set a time!';

  Future<Null> selectTime(BuildContext context) async {
    selectedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    MaterialLocalizations localizations = MaterialLocalizations.of(context);

    if (selectedTime != null) {
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);
      if (formattedTime != null) {
        setState(() {
          timeText = formattedTime;
        });
      }
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgWhite,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book Appointment',
                  style: kgreenTitleText,
                ),
                SizedBox(height: 16),
                RoundedBox(
                  boxBody: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                RoundedBox(
                  boxBody: Row(
                    children: [
                      Icon(Icons.history_edu_rounded),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Age',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // DATE PICKER
                SizedBox(height: 16),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: kDarkGreen)),
                  onPressed: () => _selectDate(context), // Refer step 3
                  child: Text(
                    'Pick your date',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Date Selected:',
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // TIME PICKER
                SizedBox(height: 16),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: kDarkGreen)),
                  onPressed: () => selectTime(context), // Refer step 3
                  child: Text(
                    'What time?',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Time Selected:',
                    ),
                    SizedBox(width: 4),
                    Text(
                      '$timeText',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: 208,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text(
                      'Confirm Booking',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: kDarkGreen,
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Yayy! Booking Confirmed'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Okay'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                      // return () {
                      //   print(widget.patientUsername);
                      //   print(widget.doctorId.toString());
                      //   var jdata = {
                      //     'action': 'bookAppointment',
                      //     'patient_user': widget.patientUsername,
                      //     'doctor_id': widget.doctorId.toString()
                      //   };
                      //   // await http.post(myurl, body: jdata);
                      //   print('APPOINTMENT BOOKED!!!!!');

                      //   showDialog(
                      //     context: context,
                      //     barrierDismissible: false,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         title: Text('Yayy! Booking Confirmed'),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             child: Text('Okay'),
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //             },
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );
                      // };
                    },
                    
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
