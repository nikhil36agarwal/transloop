import 'package:flutter/material.dart';
import 'package:transloop/widgets/widgets.dart';

class SavedFilesHome extends StatefulWidget {
  @override
  _SavedFilesHomeState createState() => _SavedFilesHomeState();
}

class _SavedFilesHomeState extends State<SavedFilesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
          header(context, strTitle: "Saved Files", disableBackButton: true),
    );
  }
}
