import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthHelper {
  static FireAuthHelper fireAuthHelper = FireAuthHelper._();

  FireAuthHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  void logOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }

  bool checkUser() {
    user = auth.currentUser;
    return user != null;
  }

  Future<String?> googleLogin() async {
    try {
      GoogleSignInAccount? account = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? auth = await account?.authentication;

      final crd = GoogleAuthProvider.credential(
        accessToken: auth!.accessToken,
        idToken: auth.idToken,
      );

      FirebaseAuth.instance.signInWithCredential(crd);
    } catch (e) {
      return "failed";
    }
    return "succsess";
  }
}
