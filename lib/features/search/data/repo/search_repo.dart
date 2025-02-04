import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:e_commerce_app/features/search/data/data_source/remoote_data_source/search_remote_data_src.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchRepo {
  final SearchRemoteDataSrc _searchRemoteDataSrc;

  SearchRepo(this._searchRemoteDataSrc);
  Future<Either<String, List<HomeProductEntity>>> search(String query) async {
    final response = await _searchRemoteDataSrc.searchData(query);
    return response.fold(
      (error) => Left(error),
      (result) {
        return Right(
          result.map((e) => e.toEntity()).toList(),
        );
      },
    );
  }
}
