import 'package:flutter/material.dart';
import 'package:personal_website/service/dialog/dialog_service.dart';
import 'package:personal_website/service/dialog/presentation/base_dialog.dart';
import 'package:personal_website/service/inspect_code/presentation/inspect_code_dialog.dart';

class InspectableWidget extends StatelessWidget {
  const InspectableWidget({required this.path, required this.child, super.key});

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => DialogService.openDialog(
        builder: (context) => BaseDialog(
          title: Text(
            path,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          child: Expanded(
            child: InspectCodeDialog(path: path),
          ),
        ),
      ),
      child: child,
    );
  }
}
