import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di_inject.config.dart';   // the file that will be generated

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();