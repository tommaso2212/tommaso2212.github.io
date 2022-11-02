import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:personal/components/app_scaffold.dart';
import 'package:personal/features/book_reader/presentation/pdf_reader.dart';
import 'package:personal/features/google_workspace/data/google_drive_manager.dart';
import 'package:personal/features/google_workspace/presentation/drive_file_picker/drive_file_picker.dart';
import 'package:personal/features/google_workspace/presentation/drive_file_picker_bottom_sheet.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void showFilePickerDialog(BuildContext context) async {
    Uint8List? file = await DriveFilePickerBottomSheet.showBottomSheet(context);
    if(file == null){
      print("Niente");
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfReader(data: file,),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: MaterialButton(onPressed: () => showFilePickerDialog(context)),
    );
  }
}
