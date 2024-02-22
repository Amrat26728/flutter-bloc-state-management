import 'package:bloc_state_management/blocs/bottom_navbar_bloc/bottom_navbar_bloc.dart';
import 'package:bloc_state_management/screens/bottom_navbar/bottom_navbar_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_state_management/blocs/loginform_bloc/loginform_bloc.dart';
import 'package:bloc_state_management/blocs/todo_bloc/todo_bloc.dart';
import 'package:bloc_state_management/cubit/counter_cubit.dart';
// import 'package:bloc_state_management/screens/login_form/login_screen.dart';
// import 'package:practice_flutter_bloc/screens/counter_screen.dart';
// import 'package:practice_flutter_bloc/screens/todo/todo_list.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:practice_flutter_bloc/cubit/internet_cubit.dart';
// import 'package:practice_flutter_bloc/screens/home_screen.dart';
// import 'package:bloc_state_management/screens/login_form/login_screen.dart';
// import 'package:bloc_state_management/screens/counter_screen.dart';
// import 'package:bloc_state_management/screens/todo/todo_list.dart';
// import 'package:bloc_state_management/cubit/internet_cubit.dart';
// import 'package:bloc_state_management/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => InternetCubit(),
    //   child: MaterialApp(
    //     title: "Bloc Practice",
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       primaryColorDark: Colors.black54,
    //     ),
    //     home: const HomeScreen(),
    //   ),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (_) => CounterCubit(),
        ),
        BlocProvider<CounterBloc>(
          create: (_) => CounterBloc(),
        ),
        BlocProvider<TodoBloc>(
          create: (_) => TodoBloc(),
        ),
        BlocProvider<LoginFormBloc>(
          create: (_) => LoginFormBloc(),
        ),
        BlocProvider<BottomNavbarBloc>(
          create: (_) => BottomNavbarBloc(),
        ),
      ],
      child: MaterialApp(
        title: "Bloc Practice",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColorDark: Colors.black54,
        ),
        home: const BottomNavbarManager(),
      ),
    );
  }
}
