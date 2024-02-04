import 'package:flutter/services.dart';
import 'package:personal_website/service/inspect_code/domain/repository/inspect_code_repository.dart';

class InspectCodeRepositoryImpl implements InspectCodeRepository {
  @override
  Future<String> loadFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
