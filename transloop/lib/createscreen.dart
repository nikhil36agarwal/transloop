import 'package:transloop/scan.dart';
import 'package:transloop/uploadscanned.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import 'globals/variables.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = globalKeys(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
          header(context, strTitle: "Create New File", disableBackButton: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //1st Container
            Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(40, 0, 40, 1),
                  blurRadius: 120.0,
                )
              ]),
              child: Container(
                color: Colors.black,
              ),
            ),
            Container(
              height: size.height * 0.10,
              color: Colors.white12,
              child: Container(
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: size.width * 0.55,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextField(
                              autofocus: false,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Enter new Sheet Name",
                                  hintStyle: TextStyle(
                                    color: Colors.white38,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 75,
                          child: Container(
                              child: RaisedButton(
                            onPressed: () {},
                            color: Colors.grey,
                            child: Text("Create"),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            //Raised Buttons
            Container(
              color: Color.fromRGBO(35, 0, 40, 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.07,
                        child: Container(
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UploadScan()));
                            },
                            color: Color.fromRGBO(20, 80, 100, 0.5),
                            child: Text(
                              "Upload File",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.07,
                        child: Container(
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ScanScreen()));
                            },
                            color: Color.fromRGBO(200, 50, 10, 1),
                            child: Text(
                              "Scan Now",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
