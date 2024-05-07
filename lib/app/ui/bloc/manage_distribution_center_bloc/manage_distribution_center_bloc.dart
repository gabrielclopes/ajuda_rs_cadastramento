import 'package:ajuda_rs_cadastramento/app/ui/bloc/manage_distribution_center_bloc/manage_distribution_center_events.dart';
import 'package:ajuda_rs_cadastramento/commons/states/base_state.dart';
import 'package:ajuda_rs_cadastramento/data/services/distribution_center_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DistributionCenterBloc extends Bloc<ManageDistributionCenterEvent, BaseState> {
  final DistributionCenterService _distributionCenterService;

  DistributionCenterBloc(this._distributionCenterService) : super(InitialState()) {
    on<CreateDistributionCenterEvent>(((event, emit) async {
      emit(LoadingState());
      try {
        await _distributionCenterService.createDistributionCenter(event.distributionCenter);
        emit(SuccessState(null));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    }));

    on<DeleteDistributionCenterEvent>(((event, emit) async {
      emit(LoadingState());
      try {
        // await _usersService.deleteExtras(event.extra, event.userId);
        emit(SuccessState(null));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    }));

    on<UpdateDistributionCenterEvent>(((event, emit) async {
      emit(LoadingState());
      try {
        // await _usersService.deleteExtras(event.oldExtra, event.userId);
        // await _usersService.createExtras(event.extra, event.userId);
        emit(SuccessState(null));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    }));
  }
}
