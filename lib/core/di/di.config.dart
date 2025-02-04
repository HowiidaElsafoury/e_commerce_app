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
import '../../features/home/data/data_sources/remote_date_src/home_data_remote_data_src.dart'
    as _i221;
import '../../features/home/data/repo_impl/home_repo_impl.dart' as _i886;
import '../../features/home/domain/repo/home_repo.dart' as _i280;
import '../../features/home/domain/use_cases/get_home_data_use_case.dart'
    as _i222;
import '../../features/home/presentation/cubits/home_cubits/home_cubit.dart'
    as _i19;
import '../../features/layout/presentation/cubit/layout_cubit.dart' as _i917;
import '../../features/search/data/data_source/remoote_data_source/search_remote_data_src.dart'
    as _i242;
import '../../features/search/data/repo/search_repo.dart' as _i791;
import '../../features/search/presentation/cubits/cubit/search_cubit.dart'
    as _i797;

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
    gh.factory<_i917.LayoutCubit>(() => _i917.LayoutCubit());
    gh.factory<_i221.HomeDataRemoteDataSrc>(
        () => _i221.HomeDataRemoteDataSrc());
    gh.factory<_i242.SearchRemoteDataSrc>(() => _i242.SearchRemoteDataSrc());
    gh.factory<_i791.SearchRepo>(
        () => _i791.SearchRepo(gh<_i242.SearchRemoteDataSrc>()));
    gh.factory<_i55.AuthRepo>(() => _i55.AuthRepo(gh<_i383.AuthDataSources>()));
    gh.factory<_i797.SearchCubit>(
        () => _i797.SearchCubit(gh<_i791.SearchRepo>()));
    gh.factory<_i280.HomeRepo>(
        () => _i886.HomeRepoImpl(gh<_i221.HomeDataRemoteDataSrc>()));
    gh.factory<_i807.LoginCubit>(() => _i807.LoginCubit(gh<_i55.AuthRepo>()));
    gh.factory<_i927.RegisterCubit>(
        () => _i927.RegisterCubit(gh<_i55.AuthRepo>()));
    gh.factory<_i222.GetHomeDataUseCase>(
        () => _i222.GetHomeDataUseCase(gh<_i280.HomeRepo>()));
    gh.factory<_i19.HomeCubit>(
        () => _i19.HomeCubit(gh<_i222.GetHomeDataUseCase>()));
    return this;
  }
}
