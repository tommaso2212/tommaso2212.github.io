import 'package:pdfx/pdfx.dart';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';

class PdfReader extends StatefulWidget {
  final String fileDriveId;

  const PdfReader({Key? key, required this.fileDriveId}) : super(key: key);

  @override
  State<PdfReader> createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {
  late PdfControllerPinch pdfPinchController;

  @override
  void initState() {
    super.initState();
    pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openData(
        InternetFile.get(
            'https://drive.google.com/file/d/${widget.fileDriveId}/view'),
      ),
    );
  }

  void initPdfController(){
    
  }

  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(
      controller: pdfPinchController,
    );
  }
}
