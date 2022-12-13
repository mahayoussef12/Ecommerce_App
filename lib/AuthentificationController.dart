import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_projet/session.dart';


import 'Login.dart';
import 'Register.dart';
import 'UserModel.dart';
import 'firebase.auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  String? get user => firebaseUser.value?.email;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() =>  session());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount != null) {
      Get.offAll(() => session());
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
      await auth.signInWithCredential (credential);
    Get.off(session());
      }
    } catch (e) {
      print(e.toString());
    }
  }
  void register(String name ,String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password).then((result) async {
        UserModel _newUser = UserModel(
            email: email,
            name: name,
            password: password, id: result.user!.uid);
        _createUserFirestore(_newUser);
        Get.offAll(Login());
      });

    } catch (firebaseAuthException) {
    }
  }
  void _createUserFirestore(UserModel user) {
    _db.collection('users').add(user.toJson());

  }
  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.off(session()));
    } catch (firebaseAuthException) {}
  }

 /* void signOut() async {
    // await auth.signOut().then((value) => Get.offAll( Login()));
  }*/
  void signOut() async {
    if ((user != null)||(googleSignInAccount != null)) {
      await auth.signOut().then((value) => Get.offAll(Login()));
    }

  }

}

