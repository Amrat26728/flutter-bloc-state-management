import 'package:bloc_state_management/blocs/bottom_navbar_bloc/bottom_navbar_bloc.dart';
import 'package:bloc_state_management/blocs/bottom_navbar_bloc/bottom_navbar_event.dart';
import 'package:bloc_state_management/blocs/bottom_navbar_bloc/bottom_navbar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavbarManager extends StatefulWidget {
  const BottomNavbarManager({super.key});

  @override
  State<BottomNavbarManager> createState() => _BottomNavbarManagerState();
}

class _BottomNavbarManagerState extends State<BottomNavbarManager> {
  final List<Widget> _screens = [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.blue),
    Container(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.index,
            onDestinationSelected: (index) {
              context
                  .read<BottomNavbarBloc>()
                  .add(BottomNavbarChangeEvent(index: index));
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.chat),
                label: "Chat",
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          ),
          body: _screens[state.index],
        );
      },
    );
  }
}
