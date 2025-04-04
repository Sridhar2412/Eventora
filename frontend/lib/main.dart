import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master/data/source/local/shar_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  await setup();

  final pref = await SecureSharedPref.getInstance();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    ProviderScope(overrides: [
      secureSharedPrefProvider.overrideWithValue(pref),
    ], child: const App()),
  );
}

Future<void> setup() async {
  // Set the Mapbox access token directly (replace with your actual token)
  MapboxOptions.setAccessToken(const String.fromEnvironment(
      'ACCESS_TOKEN')); // Replace with your valid token
}
