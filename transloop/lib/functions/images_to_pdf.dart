import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:images_to_pdf/images_to_pdf.dart' as imp;
import 'package:pdf/widgets.dart' as pw;
import 'package:path/path.dart' as path;
import 'dart:async';

processSelectedFile(List<File> images, docfile) async {
  File inputFile;
  FileStat _pdfStat;

  print("hello");
  if (docfile == null) {
    print('into PDFprocessor');
    await _createPdf(images, _pdfStat, inputFile);
  } else {
    inputFile = docfile;
    print("hello");
  }
}

Future<void> _createPdf(
    List<File> files, FileStat _pdfStat, File inputFile) async {
  int fileno = 1;

  try {
    final doc = pw.Document();
    final tempDir = await getApplicationDocumentsDirectory();
    final output = File(path.join(tempDir.path, '$fileno' 'trasition.pdf"'));
    print('file' '$output');
    final images = files;
    print(images);
    await imp.ImagesToPdf.createPdf(
        pages: images
            .map(
              (images) => imp.PdfPage(
                imageFile: images,
                size: Size(1920, 1080),
                compressionQuality: 0.5,
              ),
            )
            .toList(),
        output: output);
    print(doc);
    inputFile = output;

    _pdfStat = await output.stat();

    output.writeAsBytesSync(doc.save());
    print(inputFile.readAsBytesSync());
    print(output);
    print("success");
  } catch (e) {
    print(e);
  }
}
