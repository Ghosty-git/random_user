// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:random_user/features/users/data/repositories/user_repository_impl.dart'
    as _i4;
import 'package:random_user/features/users/domain/repositories/user_repository.dart'
    as _i3;
import 'package:random_user/features/users/domain/use_cases/user_use_case.dart'
    as _i5;
import 'package:random_user/features/users/presentation/logic/bloc/user_bloc.dart'
    as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.UserRepository>(() => _i4.UserRepositoryImpl());
  gh.factory<_i5.UseUserCase>(
      () => _i5.UseUserCase(userRepository: gh<_i3.UserRepository>()));
  gh.factory<_i6.UserBloc>(() => _i6.UserBloc(gh<_i5.UseUserCase>()));
  return getIt;
}
