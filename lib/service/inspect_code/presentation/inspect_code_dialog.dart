import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/service/inspect_code/domain/repository/inspect_code_repository.dart';
import 'package:personal_website/service/inspect_code/presentation/components/inspect_code_text_field.dart';

final _codeProvider = FutureProvider.family<String, String>((ref, path) async {
  return ref.read(inspectCodeRepositoryProvider).loadFile(path);
});

class InspectCodeDialog extends ConsumerWidget {
  const InspectCodeDialog({required this.path, super.key});

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(_codeProvider(path));
    return code.when(
      data: (data) => SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: InspectCodeTextField(code: data),
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
