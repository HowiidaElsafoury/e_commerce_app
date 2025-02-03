import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_data_entity.dart';
import 'package:injectable/injectable.dart';

import '../repo/home_repo.dart';

@injectable
class GetHomeDataUseCase {
  final HomeRepo _homeRepo;

  GetHomeDataUseCase(this._homeRepo);
  Future<Either<String, HomeDataEntity>> homeData() async {
    return await _homeRepo.getHomeData();
  }
}
