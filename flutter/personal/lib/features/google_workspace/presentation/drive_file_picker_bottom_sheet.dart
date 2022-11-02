import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:personal/features/google_workspace/data/google_drive_manager.dart';
import 'package:personal/features/google_workspace/presentation/drive_file_picker/drive_file_picker.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class DriveFilePickerBottomSheet {
  static Future<File?> showBottomSheet(BuildContext context) async {
    serviceLocator<GoogleDriveManager>().initDriveClient();
    return await showModalBottomSheet<File>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) => const Padding(
        padding: EdgeInsets.all(20),
        child: DriveFilePicker(),
      ),
    );
  }
}
