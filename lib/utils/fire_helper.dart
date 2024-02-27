import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireHelper{

  Future<String?> googleLogin()
  async {
   try {
     GoogleSignInAccount? account =await GoogleSignIn().signIn();
     GoogleSignInAuthentication? auth =await  account?.authentication;

     final crd = GoogleAuthProvider.credential(
       accessToken: auth!.accessToken,
       idToken: auth.idToken,
     );

     FirebaseAuth.instance.signInWithCredential(crd);
   }
   catch(e){
     return "succsess";
   }
   return null;
  }
}