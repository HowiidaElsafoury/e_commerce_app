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
import '../../features/best_seller/data/data_sources/remote_data_src/best_seller_remote_data_src.dart'
    as _i865;
import '../../features/best_seller/data/repo_impl/best_seller_repo_impl.dart'
    as _i333;
import '../../features/best_seller/domain/repo/best_seller_repo.dart' as _i381;
import '../../features/best_seller/domain/use_case/get_best_seller_data_use_case.dart'
    as _i1045;
import '../../features/best_seller/presentation/cubit/best_seller_cubit.dart'
    as _i1049;
import '../../features/categories/data/data_sources/remote_data_src/all_categories_remote_data_src.dart'
    as _i735;
import '../../features/categories/data/repo_impl/all_categories_repo_impl.dart'
    as _i1034;
import '../../features/categories/domain/repo/categories_repo.dart' as _i66;
import '../../features/categories/domain/use_cases/get_category_product_use_case.dart'
    as _i996;
import '../../features/categories/domain/use_cases/get_category_use_case.dart'
    as _i843;
import '../../features/categories/presentation/cubit/categories_cubit.dart'
    as _i802;
import '../../features/home/data/data_sources/remote_date_src/home_data_remote_data_src.dart'
    as _i221;
import '../../features/home/data/repo_impl/home_repo_impl.dart' as _i886;
import '../../features/home/domain/repo/home_repo.dart' as _i280;
import '../../features/home/domain/use_cases/get_home_data_use_case.dart'
    as _i222;
import '../../features/home/presentation/cubits/home_cubits/home_cubit.dart'
    as _i19;
import '../../features/layout/presentation/cubit/layout_cubit.dart' as _i917;
import '../../features/product_details/data/data_sources/remote_data_sources/product_details_remote_data_src.dart'
    as _i135;
import '../../features/product_details/data/repo_impl/product_details_repo_impl.dart'
    as _i591;
import '../../features/product_details/domain/repo/product_details_repo.dart'
    as _i151;
import '../../features/product_details/domain/use_cas/get_product-details_use_case.dart'
    as _i271;
import '../../features/product_details/presentation/cubit/product_details_cubit.dart'
    as _i4;
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
    gh.factory<_i865.BestSellerRemoteDataSrc>(
        () => _i865.BestSellerRemoteDataSrc());
    gh.factory<_i221.HomeDataRemoteDataSrc>(
        () => _i221.HomeDataRemoteDataSrc());
    gh.factory<_i917.LayoutCubit>(() => _i917.LayoutCubit());
    gh.factory<_i135.ProductDetailsRemoteDataSrc>(
        () => _i135.ProductDetailsRemoteDataSrc());
    gh.factory<_i242.SearchRemoteDataSrc>(() => _i242.SearchRemoteDataSrc());
    gh.factory<_i735.AllCategoriesRemoteDataSrc>(
        () => _i735.AllCategoriesRemoteDataSrc());
    gh.factory<_i791.SearchRepo>(
        () => _i791.SearchRepo(gh<_i242.SearchRemoteDataSrc>()));
    gh.factory<_i381.BestSellerRepo>(
        () => _i333.BestSellerRepoImpl(gh<_i865.BestSellerRemoteDataSrc>()));
    gh.factory<_i66.CategoriesRepo>(() =>
        _i1034.AllCategoriesRepoImpl(gh<_i735.AllCategoriesRemoteDataSrc>()));
    gh.factory<_i55.AuthRepo>(() => _i55.AuthRepo(gh<_i383.AuthDataSources>()));
    gh.factory<_i151.ProductDetailsRepo>(() =>
        _i591.ProductDetailsRepoImpl(gh<_i135.ProductDetailsRemoteDataSrc>()));
    gh.factory<_i797.SearchCubit>(
        () => _i797.SearchCubit(gh<_i791.SearchRepo>()));
    gh.factory<_i280.HomeRepo>(
        () => _i886.HomeRepoImpl(gh<_i221.HomeDataRemoteDataSrc>()));
    gh.factory<_i1045.GetBestSellerDataUseCase>(
        () => _i1045.GetBestSellerDataUseCase(gh<_i381.BestSellerRepo>()));
    gh.factory<_i807.LoginCubit>(() => _i807.LoginCubit(gh<_i55.AuthRepo>()));
    gh.factory<_i927.RegisterCubit>(
        () => _i927.RegisterCubit(gh<_i55.AuthRepo>()));
    gh.factory<_i843.GetCategoryUseCase>(
        () => _i843.GetCategoryUseCase(gh<_i66.CategoriesRepo>()));
    gh.factory<_i996.GetCategoryProductUseCase>(
        () => _i996.GetCategoryProductUseCase(gh<_i66.CategoriesRepo>()));
    gh.factory<_i222.GetHomeDataUseCase>(
        () => _i222.GetHomeDataUseCase(gh<_i280.HomeRepo>()));
    gh.factory<_i1049.BestSellerCubit>(
        () => _i1049.BestSellerCubit(gh<_i1045.GetBestSellerDataUseCase>()));
    gh.factory<_i271.GetProductDetailsUseCase>(
        () => _i271.GetProductDetailsUseCase(gh<_i151.ProductDetailsRepo>()));
    gh.factory<_i19.HomeCubit>(
        () => _i19.HomeCubit(gh<_i222.GetHomeDataUseCase>()));
    gh.factory<_i4.ProductDetailsCubit>(
        () => _i4.ProductDetailsCubit(gh<_i271.GetProductDetailsUseCase>()));
    gh.factory<_i802.CategoriesCubit>(() => _i802.CategoriesCubit(
          gh<_i843.GetCategoryUseCase>(),
          gh<_i996.GetCategoryProductUseCase>(),
        ));
    return this;
  }
}
