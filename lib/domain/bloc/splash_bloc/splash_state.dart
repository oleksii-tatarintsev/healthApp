part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = StateSplashInitial;
  const factory SplashState.wizardState() = StateSplashWizard;
  const factory SplashState.authorized() = StateSplashAuthorized;
  const factory SplashState.splashUnauthorized() = StateSplashUnauthorized;
}
