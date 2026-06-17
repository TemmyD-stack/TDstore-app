import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:t_store/data/repositories.authentication/authentication_repository.dart';
import 'package:t_store/firebase_options.dart';

// ...
Future<void> main() async{
  // Add Widet binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // init local storage
  await GetStorage.init();
  // Init payment methods
  // await native splash screen
   if (!kIsWeb) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  // initialize firebase
  // initialize authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository())
  );


  // load all the material design, themes, localizations, binding
  runApp(const App());
}


