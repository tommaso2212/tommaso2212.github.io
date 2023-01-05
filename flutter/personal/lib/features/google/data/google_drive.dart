import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:personal/features/google/data/google_auth.dart';

final googleDriveProvider = Provider<GoogleDrive>(
  (ref) {
    var googleAuth = ref.read<GoogleAuth>(googleAuthProvider);
    return _GoogleDriveImpl(googleAuth);
  },
);

abstract class GoogleDrive {
  Future<void> init();

  Future<Media> downloadFile(String id);

  Future<File> getFile(String id);

  Future<FileList> getList(String queryFilter);
}

class _GoogleDriveImpl implements GoogleDrive {
  final GoogleAuth googleAuth;
  late DriveApi? driveApi;

  _GoogleDriveImpl(this.googleAuth);

  @override
  Future<void> init() async {
    var client = await googleAuth.getAuthClient();
    if (client != null) {
      driveApi = DriveApi(client);
    }
  }

  @override
  Future<Media> downloadFile(String id) async {
    Object media = await driveApi!.files
        .get(id, downloadOptions: DownloadOptions.fullMedia);

    return media as Media;
  }

  @override
  Future<File> getFile(String id) async {
    Object file = await driveApi!.files.get(id);

    return file as File;
  }

  @override
  Future<FileList> getList(String queryFilter) {
    return driveApi!.files.list(q: queryFilter);
  }
}
