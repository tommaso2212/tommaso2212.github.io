import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:personal/features/google_workspace/presentation/drive_card.dart';
import 'package:personal/features/google_workspace/presentation/drive_file_picker/drive_file_picker_state_notifier.dart';

final driveFilePickerProvider = StateNotifierProvider<
    DriveFilePickerStateNotifier, LinkedHashMap<File, FileList>>(
  (ref) => DriveFilePickerStateNotifier(),
);

class DriveFilePicker extends ConsumerWidget {
  const DriveFilePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var history = ref.watch(driveFilePickerProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: history.keys.length,
            itemBuilder: (context, index) => TextButton(
              child: Text(history.keys.elementAt(index).name!),
              onPressed: () => ref
                  .read(driveFilePickerProvider.notifier)
                  .navigateBack(history.keys.elementAt(index)),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: history.entries.isEmpty
                ? 0
                : history.entries.last.value.files!.length,
            itemBuilder: (context, index) => DriveCard(
              file: history.entries.last.value.files![index],
            ),
          ),
        )
      ],
    );
  }
}
