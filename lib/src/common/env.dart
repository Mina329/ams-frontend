import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
class EnvVars {
  @EnviedField(varName: 'API_URL')
  static const apiUrl = _EnvVars.apiUrl;
}
