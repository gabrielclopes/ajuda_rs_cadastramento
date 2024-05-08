import 'package:ajuda_rs_cadastramento/commons/states/base_state.dart';
import 'package:ajuda_rs_cadastramento/data/services/config_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadServiceTypeBloc extends Cubit<BaseState> {
  final ConfigService _service;
  LoadServiceTypeBloc(this._service) : super(InitialState());

  Future<void> call() async {
    emit(LoadingState());
    try {
      final List<String> result = await _service.loadServiceTypes();
      if (result.isNotEmpty) {
        emit(SuccessState(result));
        return;
      }
    } catch (e) {
      emit(ErrorState('Load Service Types Error = $e'));
    }
  }
}
