import 'package:flutter/material.dart';
// import 'prescription.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'style.dart';

class Medicines extends StatefulWidget {
  final int prescription_id;
  Medicines({Key key, @required this.prescription_id}) : super(key: key);
  @override
  _MedicinesState createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  Future<List<ListOfMedicines>> getListOfMedicines() async {
    var jdata = {
      'action': 'getListOfMedicines',
      'prescription_id': widget.prescription_id.toString()
    };
    var response = await http.post(myurl, body: jdata);
    var jsondata = jsonDecode(response.body);
//    print(response.body);
    print(jsondata);
//    print(widget.prescription_id.toString());
//    //print(widget.uname);

    List<ListOfMedicines> lom = [];
    for (var u in jsondata) {
      ListOfMedicines obj = ListOfMedicines(
          u["medicine_id"],
          u["medicine_name"],
          u["medicine_type"],
          u["kitniBaar"],
          u["kitneDin"],
          u["validUntil"],
          u["isNRX"],
          u["others"]);
      lom.add(obj);
    }
    print(lom);
    return (lom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getListOfMedicines(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: orangeCircularIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int id) {
                  return ListTile(
                    leading: Text(snapshot.data[id].medicine_type),
                    title: Text(snapshot.data[id].medicine_name),
//                    subtitle: Text(snapshot.data[id].date),

                    onTap: () {
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: snapshot.data[id].isNRX == 'Yes'
                                ? Colors.red //NRX HAI
                                : Colors.white,
                            title: Icon(Icons.medical_services),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text('How Many Times?  ' +
                                      snapshot.data[id].kitniBaar.toString()),
                                  Text('How Many Days?  ' +
                                      snapshot.data[id].kitneDin.toString()),
                                  Text("NRX? " + snapshot.data[id].isNRX),
                                  snapshot.data[id].isNRX == 'Yes'
                                      ? Text('Valid Until: ' +
                                          snapshot.data[id].validUntil)
                                      : Text(''),
                                  Text('Extra Comments  ' +
                                      snapshot.data[id].others),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    trailing: snapshot.data[id].isNRX == "Yes"
                        ? Text(
                            'NRX',
                            style: TextStyle(color: Colors.red),
                          )
                        : Text(''),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ListOfMedicines {
  final int id;
  final String medicine_name;
  final String medicine_type;
  final int kitniBaar;
  final int kitneDin;
  final String validUntil;
  final String isNRX;
  final String others;
  ListOfMedicines(this.id, this.medicine_name, this.medicine_type,
      this.kitniBaar, this.kitneDin, this.validUntil, this.isNRX, this.others);
//  this.medicine_type,
//      this.kitniBaar, this.kitneDin, this.isNRX);
}
