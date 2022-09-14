import 'package:flutter/services.dart';
import 'package:transloop/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:transloop/globals/variables.dart';
import 'package:file_picker/file_picker.dart';
import 'functions/images_to_pdf.dart';

class UploadScan extends StatefulWidget {
  @override
  _UploadScanState createState() => _UploadScanState();
}

class _UploadScanState extends State<UploadScan> {
  String fileName;
  String path;
  String type;
  var fileSize;
  File doc;
  PlatformFile file;
  List<String> paths;
  List<File> files;
  bool loadingPath = false;
  bool multipick = true;

  void fileFromLocalStorage(multipick) async {
    setState(() {
      loadingPath = true;
    });
    try {
      if (multipick) {
        FilePickerResult result = await FilePicker.platform.pickFiles(
            allowMultiple: true,
            allowedExtensions: ['jpg', 'jpeg', 'png'],
            type: FileType.custom);

        if (result != null) {
          file = null;
          doc = null;
          files = result.paths.map((path) => File(path)).toList();
          print(result.paths);
        }
      } else {
        FilePickerResult result = await FilePicker.platform.pickFiles(
            allowMultiple: false,
            allowedExtensions: ['pdf', 'doc'],
            type: FileType.custom);
        if (result != null) {
          files = null;
          doc = File(result.files.single.path);
          file = result.files.first;
          type = file.extension;
          fileName = file.name;
          path = file.path;
          fileSize = file.size;
        }
      }
    } on PlatformException catch (e) {
      print("Unsupported" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      loadingPath = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = globalKeys(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
          header(context, strTitle: "Upload Scans", disableBackButton: true),
      body: Column(
        children: [
          Container(
            height: size.height * 0.75,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white10,
                blurRadius: 30.0,
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                color: Colors.black54,
                child: loadingPath
                    ? Center(
                        child: CircularProgressIndicator(
                          semanticsLabel: "LOADING",
                        ),
                      )
                    : files == null && file == null
                        ? Center(
                            child: Text(
                            "No files Slected",
                            style: defaulttext(17),
                          ))
                        : file == null
                            ? Container(
                                child: GridView.extent(
                                    maxCrossAxisExtent: size.width / 3,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0,
                                    children: gridTiles(files.length, files)),
                              )
                            : Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "Document Details \n" +
                                          "\n Filename:  " +
                                          fileName +
                                          "\n\n location:  " +
                                          path +
                                          "\n\n Size:" +
                                          "$fileSize KB",
                                      style: defaulttext(null),
                                    ),
                                  ),
                                ],
                              ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
            child: Container(
              width: 120,
              child: RaisedButton(
                color: Colors.white10,
                onPressed: () {
                  showBottomSheet(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Icon(
                        Icons.collections,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Import",
                        style: defaulttext(15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          processSelectedFile(files, doc);
        },
        tooltip: "Next",
        backgroundColor: Colors.red,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
      backgroundColor: Color.fromRGBO(35, 0, 40, 0.8),
      context: context,
      builder: (BuildContext buildContext) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Local Images',
                    style: defaulttext(null),
                  ),
                  onTap: () => {fileFromLocalStorage(multipick = true)}),
              ListTile(
                  leading: Icon(
                    Icons.picture_as_pdf,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Local Documents(.pdf,.doc)',
                    style: defaulttext(null),
                  ),
                  onTap: () => {fileFromLocalStorage(multipick = false)}),
              ListTile(
                leading: Icon(
                  Icons.cloud,
                  color: Colors.white,
                ),
                title: Text('Cloud Storage', style: defaulttext(null)),
                onTap: () => {cloudSnack(context)},
              ),
            ],
          ),
        );
      },
    );
  }
}
