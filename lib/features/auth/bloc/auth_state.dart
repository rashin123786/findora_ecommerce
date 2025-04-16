part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateNewUser extends AuthState {}

final class AuthStateOnlySKipUser extends AuthState {}

final class AuthStateLoginedUser extends AuthState {}

class AuthStateSkipSavingLoading extends AuthState {}
