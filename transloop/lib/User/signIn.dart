import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transloop/globals/variables.dart';
import 'package:transloop/widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = globalKeys(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 0, 40, 1),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Login",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.meriendaOne(
                          textStyle:
                              TextStyle(fontSize: 30.0, color: Colors.white))),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              hrline(size.width * 0.8, Colors.white),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                height: size.height * 0.32,
                width: size.width * 0.88,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromRGBO(20, 0, 50, 1.0),
                    boxShadow: [
                      BoxShadow(color: Colors.white10, blurRadius: 10.0),
                      BoxShadow(color: Colors.black, blurRadius: 3.0)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: inputField("Email-Id")),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: inputField("Enter Password")),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.teal[900],
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(color: Colors.teal[900], blurRadius: 2.0),
                            BoxShadow(
                                color: Colors.lightGreenAccent,
                                blurRadius: 3.0),
                          ]),
                      child: Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                              text: "New Here? ",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                              children: [
                                TextSpan(
                                  text: "Create Account",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 15.0),
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //hrline(size.width * 0.82, Colors.white),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration inputBoxes() {
    return BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 30.0),
          BoxShadow(color: Colors.redAccent, blurRadius: 8.0)
        ]);
  }

  Container inputField(String hintText) {
    return Container(
      decoration: inputBoxes(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
        child: TextField(
          autofocus: false,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
