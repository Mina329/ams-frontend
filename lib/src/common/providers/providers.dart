import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export './provider_observer.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
List<CameraDescription> cameras(CamerasRef ref) {
  throw UnimplementedError();
}
