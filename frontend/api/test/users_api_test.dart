import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for UsersApi
void main() {
  final instance = Api().getUsersApi();

  group(UsersApi, () {
    // Create a new user
    //
    // Create a new user by providing user details
    //
    //Future<UserResponse> createUser(CreateUserRequest createUserRequest) async
    test('test createUser', () async {
      // TODO
    });

    // Get all users
    //
    // Retrieve a list of all users in the system
    //
    //Future<UsersListResponse> getAllUsers() async
    test('test getAllUsers', () async {
      // TODO
    });

    // Get user by ID
    //
    // Retrieve a user by their unique ID
    //
    //Future<UserResponse> getUserById(int id) async
    test('test getUserById', () async {
      // TODO
    });
  });
}
