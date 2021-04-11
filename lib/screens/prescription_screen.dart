import 'package:prescribed/constant.dart';
import 'package:prescribed/widgets/medicine_pill.dart';
import 'package:flutter/material.dart';

class PrescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '03/04/2021',
                  style: kTitleTextstyle,
                ),
                Text(
                  'Dr Raj Ghatkar',
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: kPrimaryColor,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/fever.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mr. Anand Deshmukh',
                                style: TextStyle(
                                  fontFamily: 'DidactGothic',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                )),
                            Text(
                              'lorem asds tik',
                              style: kSubTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Test Conclusions',
                  style: TextStyle(
                    fontSize: 18,
                    color: kPrimaryColor,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 0, right: 8.0, top: 8.0, bottom: 0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed feugiat lorem, eu pulvinar turpis. Nullam ullamcorper viverra scelerisque.',
                    style: kSubTextStyle,
                  ),
                ),
                // SizedBox(height: 15.0),
                SizedBox(
                  child: Divider(
                    color: kDarkBlueColor,
                    thickness: 1.0,
                    endIndent: 1.0,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NRx',
                        style: TextStyle(
                          fontFamily: 'DidactGothic',
                          color: kDeathColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        'Medications',
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                        ),
                      ),
                      Medicine(
                        medColor: Colors.grey,
                        medName: 'Ivermectin 10',
                        medType: '2x7 days',
                        isNrx: false,
                      ),
                      Medicine(
                        medColor: kInfectedColor,
                        medName: 'Ecosprin AV 75',
                        medType: '2x30 days',
                        isNrx: false,
                      ),
                      SizedBox(height: 4.0),
                      Medicine(
                        medColor: kPrimaryColor,
                        medName: 'Candid B',
                        medType: 'Powder',
                        isNrx: false,
                      ),
                      SizedBox(height: 4.0),
                      Medicine(
                        medColor: kRecovercolor,
                        medName: 'Grillynctus',
                        medType: 'Syrup',
                        isNrx: true,
                      ),
                      SizedBox(height: 4.0),
                      Medicine(
                        medColor: kRecovercolor,
                        medName: 'Wymox D',
                        isNrx: false,
                        medType: 'EyeDrop',
                      ),
                      SizedBox(height: 4.0),
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
