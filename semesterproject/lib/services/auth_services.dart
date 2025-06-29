import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Get the current Firebase user
  User? get currentUser => _auth.currentUser;

  /// Listen to auth state changes (login/logout)
  Stream<User?> get userChanges => _auth.userChanges();

  /// Check if a user is currently logged in
  bool get isLoggedIn => _auth.currentUser != null;

  /// Sign in using Google Sign-In
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("Google Sign-In cancelled by user");
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      print("User signed in: ${userCredential.user?.displayName}");
      return userCredential;
    } catch (e) {
      print("Google Sign-In error: $e");
      return null;
    }
  }

  /// Sign out from Google and Firebase
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      print("User signed out successfully.");
    } catch (e) {
      print("Sign-out failed: $e");
    }
  }

  /// Sign in anonymously (if enabled in Firebase console)
  Future<UserCredential?> signInAnonymously() async {
    try {
      return await _auth.signInAnonymously();
    } catch (e) {
      print("Anonymous sign-in failed: $e");
      return null;
    }
  }

  /// Delete the current user (if needed)
  Future<void> deleteUser() async {
    try {
      await _auth.currentUser?.delete();
      print("User deleted");
    } catch (e) {
      print("Delete user failed: $e");
    }
  }

  /// Refresh user info from Firebase
  Future<void> refreshUser() async {
    try {
      await _auth.currentUser?.reload();
      print("User refreshed");
    } catch (e) {
      print("Refresh failed: $e");
    }
  }

  /// DisplayName of current user
  String get displayName => _auth.currentUser?.displayName ?? 'User';

  /// User email
  String get email => _auth.currentUser?.email ?? 'No Email';

  /// Profile photo URL
  String get photoURL => _auth.currentUser?.photoURL ?? '';
}
