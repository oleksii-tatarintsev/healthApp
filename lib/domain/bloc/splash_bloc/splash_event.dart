part of 'splash_bloc.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.initial() = EventSplashInitial;
  const factory SplashEvent.wizardState() = EventSplashWizard;
  const factory SplashEvent.authorized() = EventSplashAuthorized;
  const factory SplashEvent.splashUnauthorized() = EventSplashUnauthorized;
}
