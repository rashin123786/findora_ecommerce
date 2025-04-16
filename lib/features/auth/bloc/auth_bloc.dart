import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/shared/services/auth_preference.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthPreference _authPreference = AuthPreference();
  AuthBloc() : super(AuthInitial()) {
    // on<AuthEvent>((event, emit) {});
    on<AuthEventInitial>(_onAuthStateCheck);
    on<AuthEventOnSkipButtonClick>(_onSkipButtonClick);
  }

  Future<void> _onAuthStateCheck(
      AuthEventInitial event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());
    await Future.delayed(
      Duration(seconds: 2),
    );
    final isSkipped = await _authPreference.getUserEntered();
    if (isSkipped) {
      emit(AuthStateOnlySKipUser());
    } else {
      emit(AuthStateNewUser());
    }
  }

  Future<void> _onSkipButtonClick(
      AuthEventOnSkipButtonClick event, Emitter<AuthState> emit) async {
    emit(AuthStateSkipSavingLoading());
    await _authPreference.saveSKipLogin(true);
    bool isSuccess = await _authPreference.getUserEntered();
    if (isSuccess) {
      emit(AuthStateOnlySKipUser());
    }
  }
}
