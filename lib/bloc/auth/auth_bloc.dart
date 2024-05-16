import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/auth_repository.dart';
import '../../data/form_status.dart';
import '../../data/network.dart';
import '../../data/user_model.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository})
      : super(AuthState(
      errorMessage: '',
      statusMessage: '',
      status: FormsStatus.pure,
      userModel: UserModel.initial()
  )) {
    on<CheckAuthenticationEvent>(_checkAuthentication);
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<LogOutUserEvent>(_logOutUser);
    on<SignInWithGoogleEvent>(_googleSignIn);
  }

  final AuthRepository authRepository;

  _checkAuthentication(CheckAuthenticationEvent event, emit) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      emit(state.copyWith(status: FormsStatus.unauthenticated));
    }
    else {
      emit(state.copyWith(status: FormsStatus.authenticated));
    }
  }

  _loginUser(LoginUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse =
    await authRepository.logInWithEmailAndPassword(
      email: "${event.username}@gmail.com",
      password: event.password,
    );
    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential = networkResponse.data as UserCredential;
      UserModel userModel=state.userModel.copyWith(
          authId:userCredential.user!.uid
      );
      emit(state.copyWith(
        status: FormsStatus.authenticated,
        userModel:userModel
      ));
    } else {
      emit(state.copyWith(
          statusMessage: networkResponse.errorText, status: FormsStatus.error));
    }
  }

  _registerUser(RegisterUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse =
    await authRepository.registerWithEmailAndPassword(
      email:event.userModel.email,
      password: event.userModel.password,
    );
    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential = networkResponse.data as UserCredential;
      UserModel userModel=event.userModel.copyWith(
        authId:userCredential.user!.uid
      );
      emit(state.copyWith(
          status: FormsStatus.authenticated,
          statusMessage: "registered",
          userModel: userModel
      ));
    } else {
      emit(state.copyWith(
          statusMessage: networkResponse.errorText, status: FormsStatus.error));
    }
  }

  _logOutUser(LogOutUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse =
    await authRepository.logOut();
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.unauthenticated,
      ));
    } else {
      emit(state.copyWith(
          statusMessage: networkResponse.errorText, status: FormsStatus.error));
    }
  }

  _googleSignIn(SignInWithGoogleEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse =
    await authRepository.googleSingIn();
    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential = networkResponse.data;
      emit(state.copyWith(
        statusMessage: "registered",
          status: FormsStatus.authenticated,
          userModel: UserModel(
            authId: userCredential.user!.uid,
            fcm: "",
            username:"",
            password: "",
            imageUrl: userCredential.user!.photoURL!,
            userId: '',
            email: userCredential.user!.email!,
            phoneNumber:'',
            lastname: userCredential.user!.displayName!,)
      ));
    } else {
      emit(state.copyWith(
          statusMessage: networkResponse.errorText, status: FormsStatus.error));
    }
  }
}
