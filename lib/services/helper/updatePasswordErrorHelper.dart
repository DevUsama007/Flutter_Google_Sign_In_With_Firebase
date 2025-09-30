import 'package:firebase_auth/firebase_auth.dart';

class UpdatePasswordErrorHandle {
  // Error message helper for change password
  static String getChangePasswordErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'requires-recent-login':
        return 'For security, please sign in again to change your password.';
      case 'weak-password':
        return 'Password is too weak. Please use a stronger password.';
      case 'wrong-password':
        return 'Current password is incorrect.';
      case 'user-mismatch':
        return 'The provided credentials do not match the current user.';
      case 'user-not-found':
        return 'User not found. Please sign in again.';
      case 'invalid-credential':
        return 'Invalid credentials. Please check your current password.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return error.message ?? 'Failed to change password. Please try again.';
    }
  }
}
