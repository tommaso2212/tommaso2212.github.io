import 'dart:typed_data';

import 'package:pdfx/pdfx.dart';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';

class PdfReader extends StatefulWidget {
  final Uint8List data;

  const PdfReader({Key? key, required this.data}) : super(key: key);

  @override
  State<PdfReader> createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {
  late PdfControllerPinch pdfPinchController;

  @override
  void initState() {
    super.initState();

    pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openData(Future.value(widget.data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(
      controller: pdfPinchController,
    );
  }
}
