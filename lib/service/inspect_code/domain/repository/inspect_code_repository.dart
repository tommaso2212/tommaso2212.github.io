import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/service/inspect_code/domain/repository/inspect_code_repository_impl.dart';

final inspectCodeRepositoryProvider = Provider<InspectCodeRepository>((ref) {
  return InspectCodeRepositoryImpl();
});

abstract class InspectCodeRepository {
  Future<String> loadFile(String path);
}
