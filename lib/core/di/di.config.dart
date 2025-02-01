// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/remote_data_sources/auth_data_sources.dart'
    as _i383;
import '../../features/auth/data/repositary/auth_repo.dart' as _i55;
import '../../features/auth/presentation/auth/cubits/login_cubit/login_cubit.dart'
    as _i807;
import '../../features/auth/presentation/auth/cubits/register_cubit/register_cubit.dart'
    as _i927;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i383.AuthDataSources>(() => _i383.AuthDataSources());
    gh.factory<_i55.AuthRepo>(() => _i55.AuthRepo(gh<_i383.AuthDataSources>()));
    gh.factory<_i807.LoginCubit>(() => _i807.LoginCubit(gh<_i55.AuthRepo>()));
    gh.factory<_i927.RegisterCubit>(
        () => _i927.RegisterCubit(gh<_i55.AuthRepo>()));
    return this;
  }
}
