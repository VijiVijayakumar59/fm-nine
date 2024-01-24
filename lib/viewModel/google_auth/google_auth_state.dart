part of 'google_auth_bloc.dart';

@immutable
sealed class GoogleAuthState {}

final class GoogleAuthInitial extends GoogleAuthState {}

final class GoogleSignInState extends GoogleAuthState {}

final class GoogleSignInSuccess extends GoogleAuthState {}

final class GoogleSignInLoading extends GoogleAuthState {}

final class GoogleSignInFailed extends GoogleAuthState {}
