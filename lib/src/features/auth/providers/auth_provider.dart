import 'package:ams_frontend/src/features/auth/models/user.dart';
import 'package:ams_frontend/src/features/auth/notifiers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    AutoDisposeAsyncNotifierProvider<AuthNotifier, User?>(AuthNotifier.new);
