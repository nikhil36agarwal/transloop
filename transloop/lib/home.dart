import 'package:transloop/createscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transloop/globals/variables.dart';
import 'package:transloop/savedfolder/savedfiles_home.dart';
import 'package:transloop/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = globalKeys(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 0, 40, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("TransLoop",
                style: GoogleFonts.meriendaOne(
                    textStyle: TextStyle(color: Colors.white))),
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                width: 60,
                height: 45,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              defalutbox(Color.fromRGBO(30, 70, 20, 1), "Perks",
                  Icons.trending_up, size),
              GestureDetector(
                onTap: () {
                  _nextScreen(context, SavedFilesHome());
                },
                child: defalutbox(Color.fromRGBO(212, 175, 55, 1),
                    "Saved Files", Icons.archive, size),
              ),
            ],
          ),
          SizedBox(height: size.height * .05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: defalutbox(Color.fromRGBO(40, 0, 50, 1), "Create Loop",
                    Icons.all_inclusive, size),
              ),
              GestureDetector(
                onTap: () {
                  _nextScreen(context, CreateScreen());
                },
                child: defalutbox(Color.fromRGBO(70, 5, 10, 1), "Create New",
                    Icons.add_box, size),
              ),
            ],
          ),
          SizedBox(height: size.height * .05),
        ],
      ),
    );
  }

  Container defalutbox(
      Color boxcolor, String labeltext, IconData icon, Size size) {
    return Container(
      height: size.height * .203,
      width: size.width * .302,
      color: boxcolor,
      child: homepageContainers(labeltext, icon, size),
    );
  }

  void _nextScreen(BuildContext context, Widget newPage) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => newPage));
  }
}
