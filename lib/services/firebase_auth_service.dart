import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_up/models/user.dart';
import 'package:sign_up/services/cloudfirestore_db_service.dart';

class AuthService {
  // firebaseauth instance for auth service
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  // create custom object from firebaseAuth
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid,displayName: user.displayName,email:user.email,photoUrl: user.photoUrl,phoneNumber: user.phoneNumber) : null;
  }

  // auth change state
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((event) => _userFromFirebaseUser(event));
  }

  Future signInAnom() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // SignIn with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle() async {
    try {
     GoogleSignInAccount gSIA = await googleSignIn.signIn().catchError((onError){print('Error $onError');});
     GoogleSignInAuthentication gSA = await gSIA.authentication;
     
     final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken);
     final AuthResult result = await _auth.signInWithCredential(credential);
     FirebaseUser user = result.user;
     
     assert (!user.isAnonymous);
     assert (await user.getIdToken() != null);

     final FirebaseUser currentUser = await _auth.currentUser();
     assert(user.uid == currentUser.uid);
     
     await DatabaseService(uid:user.uid).updateUserData(user.displayName,user.photoUrl,user.phoneNumber,user.email);
     return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out anom
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
