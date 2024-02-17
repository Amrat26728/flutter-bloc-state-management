import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 600),
          BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state == InternetState.lost) {
                return const Center(child: Text("No connected!"));
              } else if (state == InternetState.gained) {
                return const Center(child: Text("Connected!"));
              } else {
                return const Center(child: Text("Loading..."));
              }
            },
          ),
        ],
      ),
    );
  }
}
