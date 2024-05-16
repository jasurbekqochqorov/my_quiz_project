part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormsStatus status;
  final UserModel userModel;

  const AuthState({
    required this.userModel,
    required this.errorMessage,
      required this.statusMessage,
      required this.status});

  AuthState copyWith(
      {String? errorMessage, String? statusMessage, FormsStatus? status,UserModel? userModel}) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      userModel: userModel ?? this.userModel,
      statusMessage: statusMessage ?? this.statusMessage,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    errorMessage,
    userModel,
    statusMessage,
    status
  ];
}
