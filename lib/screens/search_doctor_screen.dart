import 'dart:math';
import 'package:prescribed/screens/test_doctor_info.dart';
import 'package:prescribed/widgets/rounded_square_box.dart';
import 'package:flutter/material.dart';
import 'package:prescribed/constant.dart';
import 'package:prescribed/style.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DoctorData {
  final int id;
  final String fname;
  final String lname;
  final String username;
  final String phone;
  DoctorData(this.id, this.fname, this.lname, this.username, this.phone);
}

class SearchDoctorScreen extends StatefulWidget {
  final String patientUsername;
  SearchDoctorScreen({Key key, @required this.patientUsername})
      : super(key: key);
  @override
  _SearchDoctorScreenState createState() => _SearchDoctorScreenState();
}

class _SearchDoctorScreenState extends State<SearchDoctorScreen> {
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

  int random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  List<AssetImage> avatarImageList = [
    AssetImage('assets/images/doctor_avatar_1.jpg'),
    AssetImage('assets/images/doctor_avatar_2.jpg'),
    AssetImage('assets/images/doctor_avatar_3.jpg'),
    AssetImage('assets/images/doctor_avatar_4.jpg'),
  ];
  Future _future;
  String val;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cover_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // BACK BUTTON
            Positioned(
              top: 54.0,
              left: 18.0,
              child: GestureDetector(
                onTap: () {},
                child: RoundedSquareBox(
                  pillDimension: 48,
                  childDecoration: iconBoxDecoration,
                  childContent: Container(
                    padding: EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage('assets/icons/caduceus.png'),
                      color: kDarkBlueColor,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
            // SEARCH BAR
            Positioned(
              top: 54,
              left: 84,
              child: Container(
                padding: EdgeInsets.only(left: 12),
                height: 48,
                decoration: iconBoxDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.search_rounded,
                        color: kDarkBlueColor,
                        size: 24.0,
                      ),
                    ),
                    SizedBox(width: 6),
                    Container(
                      child: SizedBox(
                        width: 180,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                _future = doctorAvailable(value);
                              });
                            }
                          },
                          autofocus: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 120,
              left: 18, // (36 + 24 + 12 + 18 )= 90 + 18
              child: Container(
                child: Text(
                  'Let\'s find your right doctor ',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: kDarkBlueColor,
                  ),
                ),
              ),
            ),

            // MAIN BODY
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Categories', style: kTitleTextstyle),
                          Spacer(),
                          Text(
                            'See all',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      Container(child: CategoriesScroller()),

                      // DISPLAY DOCTOR LIST

                      Expanded(
                        child: Column(
                          children: [
                            // TextFormField(
                            //   decoration: textField(
                            //       "Search Doctor", Icon(Icons.search)),
                            //   onChanged: (value) {
                            //     if (value.isNotEmpty) {
                            //       setState(() {
                            //         _future = doctorAvailable(value);
                            //       });
                            //     }
                            //   },
                            // ),
                            Flexible(
                              child: FutureBuilder(
                                future: _future,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.data == null) {
                                    return Center(
                                      child: Text(
                                        "Enter first/last name of the doctor",
                                        style: kSubTextStyle,
                                      ),
                                    );
                                  } else if (snapshot.data.length == 0) {
                                    print('No doctor Found');
                                    return Center(
                                      child: Text(
                                          "No doctor found with this name"),
                                    );
                                  } else {
                                    print(
                                        'SNAPSHOT DATA RECEIVED:- ${snapshot.data[0].id} ${snapshot.data[0].fname}');
                                    return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder:
                                          (BuildContext context, int id) {
                                        return InfoTile(
                                          patientUsername:
                                              widget.patientUsername,
                                          doctorId: snapshot.data[id].id,
                                          name: snapshot.data[id].fname +
                                              " " +
                                              snapshot.data[id].lname,
                                          subText: snapshot.data[id].phone,
                                          hasAvatarImage: true,
                                          contact: snapshot.data[id].phone,
                                          avatarImage: AssetImage(
                                              'assets/images/doctor_avatar_' +
                                                  '${random(1, 4)}' +
                                                  '.jpg'),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// vertical category scroller
class CategoriesScroller extends StatelessWidget {
  CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    // final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/heartcare.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/dentalcare.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/opthalmologist.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/entcare.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/orthopedic.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  InfoTile({
    this.avatarImage,
    this.patientUsername,
    this.name,
    this.subText,
    this.hasAvatarImage,
    this.contact,
    this.doctorId,
  });
  final int doctorId;
  final String name;
  final String patientUsername;
  final String contact;
  final String subText;
  final double borderRadius = 18;
  final AssetImage avatarImage;
  final bool hasAvatarImage;

  final AssetImage defaultImage =
      AssetImage('assets/images/doctor_avatar_3.jpg');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              // ClinicInfo(
              //   name: snapshot.data[id].fname + " " + snapshot.data[id].lname,
              //   uname: snapshot.data[id].username,
              //   id: snapshot.data[id].id,
              //   patientUsername:
              //       // widget.patientUsername,
              //       'umang',
              // );
              return TestDoctorInfo(
                patientUsername: patientUsername,
                doctorName: name,
                doctorId: doctorId,
                contact: contact,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey[100],
              blurRadius: 3.0,
              spreadRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white,
        ),
        // width: ,
        child: Row(
          children: [
            Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
                // color: Colors.white,
                image: DecorationImage(
                  image: hasAvatarImage ? avatarImage : defaultImage,
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: kTitleTextColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subText,
                  style: TextStyle(
                    color: kBodyTextColor,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse_rounded,
                      size: 14.0,
                    ),
                    SizedBox(width: 3),
                    Text(
                      '10.00AM',
                      style: TextStyle(
                        color: kBodyTextColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
