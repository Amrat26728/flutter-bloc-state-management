import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/blocs/loginform_bloc/loginform_bloc.dart';
import 'package:bloc_state_management/blocs/loginform_bloc/loginform_event.dart';
import 'package:bloc_state_management/blocs/loginform_bloc/loginform_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            BlocListener<LoginFormBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                } else if (state is LoginSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginFormBloc>(context).add(
                    LoginRequestEvent(
                      email: email.text.trim(),
                      password: password.text.trim(),
                    ),
                  );
                },
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
