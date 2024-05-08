import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowCredentialsDialog extends StatelessWidget {
  final String login;
  final String password;

  const ShowCredentialsDialog(
      {required this.login, required this.password, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: "Login: $login\nSenha: $password"));
          },
          child: const Text(
            'Copiar dados',
            style: TextStyle(color: Colors.blueGrey),
            // style: TextStyle(color: Colors.black45),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancelar',
            // style: TextStyle(color: Colors.black45),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Login: "),
              SelectableText(
                login,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Senha: "),
              SelectableText(password),
            ],
          ),
        ],
      ),
    );
  }
}
