import 'package:prescribed/constant.dart';
import 'package:prescribed/screens/health_page.dart';
import 'package:prescribed/screens/prescription_screen.dart';
import 'package:prescribed/widgets/circular_box.dart';
import 'package:prescribed/widgets/cover.dart';
import 'package:prescribed/widgets/medicine_pill.dart';
import 'package:prescribed/widgets/rounded_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String patientUsername;
  HomePage({Key key, @required this.patientUsername}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'HOME',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kDarkBlueColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.only(top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Cover(
                    coverAvatar: AssetImage('assets/images/umg.png'),
                    childContent: Column(
                      children: [
                        Text(
                          '${widget.patientUsername}',
                          style: kHeadingTextStyle,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Age 21 | Male',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CirclularBox(
                                shadowColor: Colors.green,
                                textContent: '8.3',
                                description: 'Score',
                              ),
                              SizedBox(width: 24.0),
                              CirclularBox(
                                shadowColor: Colors.green,
                                textContent: '0',
                                description: 'Medicines',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage(
                              patientUsername: widget.patientUsername);
                        },
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HealthPage();
                          },
                        ),
                      );
                    },
                    child: RoundedBox(
                      boxBody: Row(
                        children: [
                          Icon(Icons.arrow_circle_up_outlined),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text('Check your health!'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.only(top: 16.0, left: 28.0, right: 28.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Upcoming Medicine',
                            style: kTitleTextstyle,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PrescriptionScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Medicine(
                        medColor: kDeathColor,
                        medName: 'Ecosprin AV 75',
                        medType: '2x30 days',
                        isNrx: false,
                      ),
                    ],
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
