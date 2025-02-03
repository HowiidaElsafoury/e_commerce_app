import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_data_entity.dart';
import 'package:e_commerce_app/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/remote_date_src/home_category_data_src.dart';
import '../model/home_data_model.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDataRemoteDataSrc _homeDataRemoteDataSrc;

  HomeRepoImpl(this._homeDataRemoteDataSrc);
  @override
  Future<Either<String, HomeDataEntity>> getHomeData() async {
    final response = await _homeDataRemoteDataSrc.getHomeData();
    return response.fold((error) {
      return Left(error);
    }, (result) {
      return Right(result.toEntity());
    });
  }
}
