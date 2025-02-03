import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_data_entity.dart';

abstract class HomeRepo {
  Future<Either<String, HomeDataEntity>> getHomeData();
}
