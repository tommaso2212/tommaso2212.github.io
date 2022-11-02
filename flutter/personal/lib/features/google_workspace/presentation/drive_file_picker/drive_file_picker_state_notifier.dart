import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:personal/features/google_workspace/data/google_drive_manager.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class DriveFilePickerStateNotifier
    extends StateNotifier<LinkedHashMap<File, FileList>> {
  DriveFilePickerStateNotifier()
      : super(
          LinkedHashMap(),
        ) {
    navigate(File(id: 'root', name: 'My Drive',),);
  }

  

  void navigate(File file) async {
    var fileList = await serviceLocator<GoogleDriveManager>()
        .getList("'${file.id}' in parents");
    
    LinkedHashMap<File, FileList> previous = state;

    state = LinkedHashMap<File, FileList>(
      equals: (p0, p1) => p0.id! == p1.id!,
    )..addEntries(previous.entries)
    ..putIfAbsent(file, () => fileList);
  }

  void navigateBack(File file){

    if(state.keys.last.id! == file.id!){
      return;
    }

    LinkedHashMap<File, FileList> previous = LinkedHashMap.fromEntries(state.entries.toList().reversed);

    for(var i in state.entries.toList().reversed){
      if(i.key.id! == file.id!){
        break;
      }
      previous.remove(i.key);
    }

    state = LinkedHashMap.fromEntries(previous.entries.toList().reversed);
  }
}
