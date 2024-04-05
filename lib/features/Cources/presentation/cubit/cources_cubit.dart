import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cources_state.dart';

class CourcesCubit extends Cubit<CourcesState> {
  CourcesCubit() : super(CourcesInitial());
}
