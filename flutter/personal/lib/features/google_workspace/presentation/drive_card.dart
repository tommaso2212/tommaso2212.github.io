import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:personal/components/base_card.dart';
import 'package:personal/features/google_workspace/data/google_drive_manager.dart';
import 'package:personal/features/google_workspace/presentation/drive_file_picker/drive_file_picker.dart';
import 'package:personal/features/google_workspace/presentation/drive_file_picker/drive_file_picker_state_notifier.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class DriveCard extends ConsumerWidget {
  final File file;

  const DriveCard({Key? key, required this.file}) : super(key: key);

  IconData _buildIcon() {
    switch (file.mimeType) {
      case "application/vnd.google-apps.folder":
        return Icons.folder;
      case 'application/pdf':
        return Icons.picture_as_pdf;
      default:
        return Icons.file_open;
    }
  }

  void downloadFile(BuildContext context) async {
    Media media =
        await serviceLocator<GoogleDriveManager>().downloadFile(file.id!);
    List<int> result = List.empty(growable: true);

    for(var list in await media.stream.toList()){
      result.addAll(list);
    }

    Navigator.of(context).pop(Uint8List.fromList(result));
  }

  void onTap(BuildContext context, WidgetRef ref) {
    DriveFilePickerStateNotifier notifier =
        ref.read(driveFilePickerProvider.notifier);
    switch (file.mimeType) {
      case "application/vnd.google-apps.folder":
        notifier.navigate(file);
        break;
      case 'application/pdf':
        downloadFile(context);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseCard(
      onTap: () => onTap(context, ref),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _buildIcon(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tooltip(
              message: file.name,
              child: Text(
                file.name!,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
