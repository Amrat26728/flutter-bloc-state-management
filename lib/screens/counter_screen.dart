import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_state_management/blocs/counter_bloc/counter_event.dart';
// import 'package:practice_flutter_bloc/cubit/counter_cubit.dart';
// import 'package:practice_flutter_bloc/cubit/counter_cubit.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // counterCubit.decrement();
                counterBloc.add(DecrementCounterEvent());
              },
              icon: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            BlocBuilder<CounterBloc, int>(
              // bloc: counterCubit,
              builder: (_, state) {
                return Text(
                  state.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                // counterCubit.increment();
                counterBloc.add(IncrementCounterEvent());
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
