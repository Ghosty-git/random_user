
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:random_user/internal/dependencies/get%20_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
  usesNullSafety: true,
)
void configureDependencies() => $initGetIt(getIt);

final locator = GetIt.instance;