import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

AppBar header(context, {String strTitle, disableBackButton = false}) {
  return AppBar(
    automaticallyImplyLeading: disableBackButton ? false : true,
    backgroundColor: Color.fromRGBO(35, 0, 40, 1),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          strTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
        Container(
          child: Image.asset(
            'assets/images/logo.png',
            width: 60,
            height: 45,
          ),
        ),
      ],
    ),
  );
}

//homepage Containers
Widget homepageContainers(String labeltext, IconData icon, Size size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          width: size.width * .25,
          height: size.height * .13,
          color: Colors.black45,
          child: Container(
            child: Icon(
              icon,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Container(
        width: size.width * .35,
        height: size.height * .05,
        color: Colors.black54,
        child: Center(
          child: Text(labeltext, style: defaulttext(20)),
        ),
      ),
    ],
  );
}

List<Widget> gridTiles(dynamic itemCount, dynamic files) {
  List<Container> containers = List<Container>.generate(itemCount, (int index) {
    return new Container(
      child: Image.file(
        files[index],
        fit: BoxFit.cover,
      ),
    );
  });
  return containers;
}

launchURL(path) async {
  var url = path;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

TextStyle defaulttext(double size) {
  size == null ? size = 14 : size = size;
  return TextStyle(color: Colors.white, fontSize: size);
}

Widget cloudSnack(BuildContext context) {
  print("object");
  return Container(
    color: Colors.white,
    child: SnackBar(
      content: Text(
        'Available Soon!!',
        style: defaulttext(null),
      ),
      backgroundColor: Colors.white,
      action: SnackBarAction(label: 'OK', onPressed: () {}),
    ),
  );
}

Padding hrline(double l, Color barcolor) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child: Container(
      height: 2.0,
      alignment: Alignment.center,
      width: l,
      color: Colors.white,
    ),
  );
}
