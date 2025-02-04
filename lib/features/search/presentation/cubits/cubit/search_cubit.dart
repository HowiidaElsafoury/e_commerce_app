import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/home/domain/entities/home_product_entity.dart';
import 'package:e_commerce_app/features/search/data/repo/search_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitial());
  Future<void> searchData(String query) async {
    emit(SearchLoading());

    final response = await _searchRepo.search(query);
    response.fold((error) => emit(SearchFailure(error)), (result) {
      if (result.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(
          SearchSuccess(result),
        );
      }
    });
  }
}
