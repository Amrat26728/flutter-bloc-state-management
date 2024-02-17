import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/blocs/internet_bloc/internet_event.dart';
import 'package:bloc_state_management/blocs/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();

  StreamSubscription? _connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription!.cancel();
    return super.close();
  }
}
