import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

@injectable
class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
}
