import 'package:transloop/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: header(context, strTitle: "Scan", disableBackButton: true),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white12,
                blurRadius: 20.0,
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_photo_alternate,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                      Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Scan",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_box,
                        color: Colors.red[600],
                        size: 40,
                      ),
                      Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
