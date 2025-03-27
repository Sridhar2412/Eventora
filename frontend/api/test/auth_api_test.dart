import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for AuthApi
void main() {
  final instance = Api().getAuthApi();

  group(AuthApi, () {
    // Login a user
    //
    // Login a user with email and password
    //
    //Future<LoginResponse> loginUser(LoginRequest loginRequest) async
    test('test loginUser', () async {
      // TODO
    });
  });
}
