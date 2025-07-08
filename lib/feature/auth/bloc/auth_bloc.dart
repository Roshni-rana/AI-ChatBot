import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GoogleSignIn _googleSignIn;

  AuthBloc(this._googleSignIn) : super(AuthInitial()) {
    on<SignInRequested>(_handleSignIn);
    on<SignOutRequested>(_handleSignOut);
  }

  Future<void> _handleSignIn(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await _googleSignIn.signOut();

      final account = await _googleSignIn.signIn();

      if (account != null) {
        final user = {
          'email': account.email,
          'name': account.displayName,
          'photoUrl': account.photoUrl,
          'googleId': account.id,
        };

        /// Optional: Call your backend to check if the user exists
        final isNewUser = await checkUserOnServer(user['email']!);

        if (isNewUser) {
          await registerUser(user); // Send to your backend
        }

        emit(
          AuthSuccess(
            name: user['name']!,
            email: user['email']!,
            photoUrl: user['photoUrl'],
          ),
        );
      } else {
        emit(AuthFailure("User cancelled login"));
      }
    } catch (error) {
      emit(AuthFailure("Google Sign-In failed: $error"));
    }
  }

  Future<void> _handleSignOut(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _googleSignIn.signOut();
    emit(AuthInitial());
  }

  // Example mock backend check function
  Future<bool> checkUserOnServer(String email) async {
    // Replace with actual API call
    await Future.delayed(Duration(seconds: 1));
    return true; // Simulate a new user
  }

  Future<void> registerUser(Map<String, dynamic> user) async {
    // Replace with actual API call
    await Future.delayed(Duration(seconds: 1));
    print("User registered: ${user['email']}");
  }
}
