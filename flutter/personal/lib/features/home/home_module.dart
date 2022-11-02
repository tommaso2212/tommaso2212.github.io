import 'package:personal/features/book_reader/book_reader_module.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class HomeModule extends BaseModule {
  final _dependencies = <BaseModule> [
    BookReaderModule(),
  ];

  @override
  List<BaseModule> get dependencies => _dependencies;

  final _injectableList = <BaseInjectable>[];

  @override
  List<BaseInjectable> get injectableList => _injectableList;
}