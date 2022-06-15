import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jot_timer/app/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authServices;

  LoginController({required AuthService authService})
      : _authServices = authService,
        super(const LoginState.initial());

  Future<void> signIn() async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      await _authServices.signIn();
    } catch (e, s) {
      log('Erro ao realizar o login', error: e, stackTrace: s);
      emit(state.copyWith(
          status: LoginStatus.failre, errormessage: 'Erro ao realizar login'));
    }
  }
}
