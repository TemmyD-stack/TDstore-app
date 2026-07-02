import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/data/repositories.authentication/user/user_repository.dart';
import 'package:t_store/features/autentication/screens/login/login.dart';
import 'package:t_store/features/autentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/autentication/screens/signup/widgets/verify_email.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
 

//get authenticated user data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch
  @override
  void onReady(){
    super.onReady();

    WidgetsBinding.instance.addPostFrameCallback((_) {
     if (!kIsWeb) {
      FlutterNativeSplash.remove();
    }
      screenRedirect();
    });
  }

  // Function to show relevant screen
  void screenRedirect() {
    final user = _auth.currentUser;
    if(user != null){
        if(user.emailVerified){
          Get.offAll(() => const NavigationMenu());
        }else {
        Get.offAll(()=> VerifyEmail(email: _auth.currentUser?.email));
      }
    }else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() =>  const LoginScreen()) : Get.offAll( const OnboardingScreen());
    
    }
  }
    /*------------------------------------------------ Email & Password sign-in ----------------------------------------*/

  //Email Authentication - login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
      
    } on FirebaseAuthException catch (e) {
      //throw 'Something went wrong. Please try again ${e.code}';
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
        throw const TFormatException();

    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;

    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  
  
  // Re-authenticate user
  Future<void> reAutheticateEmailAndPassword(String email, String password) async {
    try{
      //create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      //Re authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
      
    } on FirebaseAuthException catch (e) {
      //throw 'Something went wrong. Please try again ${e.code}';
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
        throw const TFormatException();

    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;

    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

//Email authentication - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
    } on FirebaseAuthException catch (e) {
      //throw 'Something went wrong. Please try again ${e.code}';
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
        throw const TFormatException();

    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;

    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  
/// Email verification
  Future<void> sendEmailVerification() async {
    try{
       await _auth.currentUser?.sendEmailVerification();
      
    } on FirebaseAuthException catch (e) {
      //throw 'Something went wrong. Please try again ${e.code}';
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
        throw const TFormatException();

    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;

    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

// Email Authentication - Forget Password
Future<void> sendPasswordResetEmail(String email) async {
    try{
       await _auth.sendPasswordResetEmail(email: email);
      
    } on FirebaseAuthException catch (e) {
      //throw 'Something went wrong. Please try again ${e.code}';
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
        throw const TFormatException();

    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;

    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }



    /*------------------------------------------------ Federated identity & social sign-in ----------------------------------------*/
   Future<UserCredential?> signInWithGoogle() async {
    try {
       final GoogleSignInAccount userAccount = await GoogleSignIn.instance.authenticate();
      // ignore: unnecessary_null_comparison
      if (userAccount == null) return null;

      // Google auth details (yields identity parameters including idToken)
      final GoogleSignInAuthentication googleAuth = userAccount.authentication;

      // 2. FIX: Safely authorize profile access scopes to extract the modern accessToken path
      final authorizedClient = await userAccount.authorizationClient.authorizeScopes(['email']);
      final String accessToken = authorizedClient.accessToken;

      // Create a new Firebase credential using both tokens
      final AuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: googleAuth.idToken,
      );
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong. $e');
      return null;
    }
  }





///Loutout user
  Future<void> logout() async {
    try{
       await _auth.signOut();
       Get.offAll(()=> const LoginScreen());
      
    } on FirebaseAuthException catch (e) {
      //throw 'Something went wrong. Please try again ${e.code}';
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
        throw const TFormatException();

    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;

    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // DELETE USER_ Remove user Auth and Firestore account
   Future<void> deleteAccount() async {
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
      
    } on FirebaseAuthException catch (e) {
      //throw 'Something went wrong. Please try again ${e.code}';
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
        throw const TFormatException();

    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;

    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}