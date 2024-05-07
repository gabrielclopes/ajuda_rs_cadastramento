import 'package:ajuda_rs_cadastramento/app/ui/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:ajuda_rs_cadastramento/app/ui/bloc/authentication_bloc/authentication_bloc_states.dart';
import 'package:ajuda_rs_cadastramento/commons/validator/authentication_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginDialog extends StatefulWidget {
  const LoginDialog({
    super.key,
  });

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final _formKey = GlobalKey<FormState>();
  late final AuthenticationBloc _authBloc;
  late TextEditingController _passwordController;

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthenticationBloc>(context);
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return AlertDialog(
      content: BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
          bloc: _authBloc,
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Digite sua senha de acesso:'),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    style: theme.textTheme.bodySmall,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    validator: EmptyValidator.empty,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      const SizedBox(width: 4),
                      BlocListener<AuthenticationBloc, AuthenticationBlocState>(
                        bloc: _authBloc,
                        listener: (context, state) async {
                          if (state is AuthorizedUserState || state is WrongPasswordState) {
                            Navigator.pop(context);
                          }
                        },
                        child: TextButton(
                          onPressed: state is AuthenticationLoadingState ? null : 
                          () async {
                            if (_formKey.currentState!.validate()) {
                              await _authBloc(_passwordController.text.trim());
                            }
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green)),
                          child: state is AuthenticationLoadingState ? 
                          const SizedBox(height: 10, width: 10,child: CircularProgressIndicator(),) : 
                          const Text(
                            'Autorizar acesso',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}