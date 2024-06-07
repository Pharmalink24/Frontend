import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  NetworkBloc() : super(ConnectionInitial()) {
    on<ListenConnection>((event, emit) {
      _subscription = Connectivity()
          .onConnectivityChanged
          .listen((List<ConnectivityResult> result) {
        // Received changes in available connectivity types!
        add(
          ConnectionChanged(
            result.contains(ConnectivityResult.wifi) ||
                    result.contains(ConnectivityResult.mobile) ||
                    result.contains(ConnectivityResult.ethernet)
                ? ConnectionSuccess()
                : ConnectionFailure(),
          ),
        );
      });
    });

    on<ConnectionChanged>((event, emit) {
      emit(event.connection);
    });
  }
  
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
