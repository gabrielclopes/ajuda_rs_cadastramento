import 'package:ajuda_rs_cadastramento/app/ui/bloc/authentication_bloc/authentication_bloc_states.dart';
import 'package:ajuda_rs_cadastramento/data/services/config_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc extends Cubit<AuthenticationBlocState>{

  final ConfigService _service;
  AuthenticationBloc(this._service) : super(UnauthorizedUserState());

  Future<void> call(String password)async{
    emit(AuthenticationLoadingState());

    final result = await _service.signIn(password);
    if(result){
      emit(AuthorizedUserState());
      return;
    }
    emit(WrongPasswordState());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(UnauthorizedUserState());
  }

  // void init() {
  //   emit(InitialState());
  // }

}