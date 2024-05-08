import 'package:ajuda_rs_cadastramento/app/ui/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:ajuda_rs_cadastramento/app/ui/bloc/authentication_bloc/authentication_bloc_states.dart';
import 'package:ajuda_rs_cadastramento/app/ui/view/home/components/distribution_center_list_view.dart';
import 'package:ajuda_rs_cadastramento/app/ui/view/home/components/distribution_center_register_form.dart';
import 'package:ajuda_rs_cadastramento/app/ui/view/home/dialogs/login_dialog.dart';
import 'package:ajuda_rs_cadastramento/app/ui/view/home/dialogs/show_credentials_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {

  late AuthenticationBloc _authenticationBloc;
  
  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1,),
        Expanded(
          flex: 1,
          child: Center(
            child: TextButton( 
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return BlocProvider.value(
                          value: _authenticationBloc,
                          child: const LoginDialog()
                          );
                      });
                },
                child: const Text(
                  'Autorizar',
                  // style: TextStyle(color: Colors.white),
                )),
          ),
        ),
        BlocConsumer<AuthenticationBloc, AuthenticationBlocState>(
          bloc: _authenticationBloc,
          listener: (context, state) {
            if (state is WrongPasswordState){
               ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Senha de acesso incorreta'), duration: Duration(seconds: 2),)
                );
            }
          },
          builder: (context, authenticationState) {
            return Expanded(
              flex: 6,
              child: authenticationState is AuthorizedUserState ? 
               const Row(
                children: [
                  Expanded(child: DistributionCenterRegisterForm()),
                  Expanded(child: DistributionCenterListView()),
                ],
               )  : const SizedBox.shrink()
              );
          }
        )
      ],
    );
  }
}
