import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_state.dart';

class TvCubit extends Cubit<TvState> {
  TvCubit() : super(TvInitial());
}
