import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_state.dart';
part 'connectivity_cubit.freezed.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(const _Initial()) {
    _initialize();
  }

  void _initialize() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    _emitConnectionStatus(connectivityResult.last);

    // Слушаем изменения состояния подключения
    Connectivity().onConnectivityChanged.listen((result) {
      _emitConnectionStatus(result.last);
    });
  }

  void _emitConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(const _Disconnected());
    } else {
      emit(const _Connected());
    }
  }
}
