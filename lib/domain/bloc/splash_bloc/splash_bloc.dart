import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial()) {
    on<SplashEvent>(
      (event, emit) {
        event.map(
          initial: (_) {
            emit(SplashState.initial());
          },
          wizardState: (_) {
            emit(SplashState.wizardState());
          },
          authorized: (_) {
            emit(SplashState.authorized());
          },
          splashUnauthorized: (_) {
            emit(SplashState.splashUnauthorized());
          },
        );
      },
    );
  }

  Future<void> replaceSplashScreen() async {
    await Future.delayed(
      Duration(seconds: 3),
      () async {
        add(SplashEvent.wizardState());
      },
    );
  }
}
