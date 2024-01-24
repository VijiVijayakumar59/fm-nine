part of 'google_auth_bloc.dart';

@immutable
sealed class GoogleAuthEvent {}

class SignInWithGoogleEvent extends GoogleAuthEvent {}

class SignOutEvent extends GoogleAuthEvent {}
