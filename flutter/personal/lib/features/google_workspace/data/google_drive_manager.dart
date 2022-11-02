import 'dart:typed_data';

import 'package:googleapis/drive/v3.dart';
import 'package:personal/features/authentication/application/google_authentication.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

abstract class GoogleDriveManager extends BaseInjectable {
  factory GoogleDriveManager() => _GoogleDriveManager();

  Future<void> initDriveClient();

  Future<Media> downloadFile(String id);

  Future<File> getFile(String id);

  Future<FileList> getList(String queryFilter);
}

class _GoogleDriveManager implements GoogleDriveManager {
  DriveApi? driveApi;

  @override
  Future<void> initDriveClient() async {
    driveApi =
        DriveApi(await serviceLocator<GoogleAuthentication>().getAuthClient());
  }

  @override
  Future<Media> downloadFile(String id) async {
    Object media = await driveApi!.files
        .get(id, downloadOptions: DownloadOptions.fullMedia);

    return media as Media;
  }

  @override
  void registerInjectable() {
    serviceLocator.registerInjectable<GoogleDriveManager>(this);
  }
  
  @override
  Future<FileList> getList(String queryFilter) {
    return driveApi!.files.list(q: queryFilter);
  }
  
  @override
  Future<File> getFile(String id) async {
    Object file = await driveApi!.files.get(id);

    return file as File;
  }
}
