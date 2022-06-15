part of 'login_controller.dart';

enum LoginStatus{ initial, loading, failre }


class LoginState extends Equatable {
  final LoginStatus status;
  final String? errormessage;
  
  const LoginState._({
    required this.status,
    this.errormessage
  });

  const LoginState.initial(): this._(status: LoginStatus.initial);
  
  @override
  List<Object?> get props => [status, errormessage];
  

  LoginState copyWith({
    LoginStatus? status,
    String? errormessage,
  }) {
    return LoginState._(
      status: status ?? this.status,
      errormessage: errormessage ?? this.errormessage,
    );
  }
}
