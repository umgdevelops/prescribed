//import 'package:avatar_glow/avatar_glow.dart';
//import 'dart:html';

//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_recognition/speech_recognition.dart';

void main() => runApp(Microphone());

class Microphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'microphone',
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      home: Mystatefullwidget(),
    );
  }
}

class Mystatefullwidget extends StatefulWidget {
  @override
  _Mystatefullwidget createState() => _Mystatefullwidget();
}

class _Mystatefullwidget extends State<Mystatefullwidget> {
  SpeechRecognition _speechRecognition;
  bool _isavailable = false;
  bool _islistening = false;
  String resulttext = '';

  //speech to text
  // stt.SpeechToText _speech;
  // bool _isListening = false;
  // String _textSpeech = 'press the button to start speaking';
  // //double _confidence = 1.0;

  // void onListen() async {
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //       onStatus: (val) => print('onStatus: $val'),
  //       onError: (val) => print('onError: $val '),
  //     );
  //     if (available) {
  //       setState(() => _isListening = true);

  //       _speech.listen(
  //           onResult: (val) => setState(() {
  //                 _textSpeech = val.recognizedWords;
  //               }));
  //     }
  //   } else {
  //     setState(() => _isListening = false);
  //     _speech.stop();
  //  }
  // }

  // void initState() {
  //   super.initState();
  //   _speech = stt.SpeechToText();
  // }

  @override
  void initState() {
    super.initState();
    initSpeechRecogniser();
  }

  void initSpeechRecogniser() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
          (bool result) => setState(() => _isavailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _islistening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
          (String speech) => setState(() => resulttext = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _islistening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isavailable = result),
    );
  }

  Icon cusIcon = Icon(Icons.search);
  Widget cussearchbar = Text("DashBoard");
  Widget build(BuildContext context) {
    return Scaffold(
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
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // floatingActionButton: AvatarGlow(
      //   animate: true,
      //   glowColor: Theme.of(context).primaryColor,
      //   endRadius: 80,
      //   duration: Duration(milliseconds: 2000),
      //   repeatPauseDuration: Duration(milliseconds: 100),
      //   repeat: true,
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     //child: Icon( ? Icons.mic : Icons.mic_none),
      //   ),
      // ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: new Text("Welcome"),
              accountEmail: new Text("Dr. Himanshu "),
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
      // body: SingleChildScrollView(
      //     reverse: true,
      //     child: Container(
      //       padding: EdgeInsets.fromLTRB(25, 25, 10, 10),
      //       child: Text("_textSpeech",
      //           style: TextStyle(
      //             fontSize: 28,
      //             color: Colors.black,
      //             fontWeight: FontWeight.w500,
      //           ),
      //           ),
      //     )
      //     )

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.cancel),
                  mini: true,
                  backgroundColor: Colors.deepOrange,
                  onPressed: () {
                    if (_islistening)
                      _speechRecognition.cancel().then((result) => setState(() {
                        _islistening = result;
                        resulttext = "";
                      }));
                  },
                ),
                FloatingActionButton(
                  child: Icon(Icons.mic),
                  backgroundColor: Colors.pinkAccent,
                  onPressed: () {
                    if (_isavailable && !_islistening)
                      _speechRecognition
                          .listen(locale: "en_US")
                          .then((result) => print('$result'));
                  },
                ),
                FloatingActionButton(
                  child: Icon(Icons.stop),
                  mini: true,
                  backgroundColor: Colors.deepPurple,
                  onPressed: () {
                    if (_islistening)
                      _speechRecognition.stop().then(
                            (result) => setState(() => _islistening = result),
                      );
                  },
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.cyanAccent[100],
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(resulttext),
            )
          ],
        ),
      ),
    );
  }
}
