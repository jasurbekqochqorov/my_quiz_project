import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'exception/firebase_exception.dart';
import 'local/storage_repository.dart';
import 'network.dart';

class AuthRepository {
  Future<NetworkResponse> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: LogInWithEmailAndPasswordFailure.fromCode(e.code).message,
          errorCode: e.code);
    } catch (_) {
      return NetworkResponse(errorText: "An unknown occurred");
    }
  }

  Future<NetworkResponse> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: SingUpWithEmailAndPasswordFailure.fromCode(e.code).message,
          errorCode: e.code);
    } catch (_) {
      return NetworkResponse(errorText: "An unknown occurred");
    }
  }

  Future<NetworkResponse> googleSingIn() async {
    try {
      late final AuthCredential credential;
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: SingUpWithEmailAndPasswordFailure.fromCode(e.code).message,
        errorCode: e.code,
      );
    } catch (_) {
      return NetworkResponse(errorText: "An unknown occurred");
    }
  }

  Future<NetworkResponse> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return NetworkResponse(data: 'success');
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(errorText: 'Error', errorCode: e.code);
    } catch (_) {
      return NetworkResponse(errorText: "An unknown occurred");
    }
  }
}
