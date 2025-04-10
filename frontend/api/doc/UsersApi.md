# api.api.UsersApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://192.168.0.103:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createUser**](UsersApi.md#createuser) | **POST** /api/users/save | Create a new user
[**getAllUsers**](UsersApi.md#getallusers) | **GET** /api/users/list | Get all users
[**getUserById**](UsersApi.md#getuserbyid) | **GET** /api/users/{id} | Get user by ID
[**getUserByToken**](UsersApi.md#getuserbytoken) | **GET** /api/users | Get user by token
[**updateUserById**](UsersApi.md#updateuserbyid) | **PATCH** /api/users/{id} | Update user information


# **createUser**
> UserResponse createUser(createUserRequest)

Create a new user

Create a new user by providing user details

### Example
```dart
import 'package:api/api.dart';

final api = Api().getUsersApi();
final CreateUserRequest createUserRequest = ; // CreateUserRequest | 

try {
    final response = api.createUser(createUserRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->createUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserRequest** | [**CreateUserRequest**](CreateUserRequest.md)|  | 

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllUsers**
> UsersListResponse getAllUsers()

Get all users

Retrieve a list of all users in the system

### Example
```dart
import 'package:api/api.dart';

final api = Api().getUsersApi();

try {
    final response = api.getAllUsers();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->getAllUsers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UsersListResponse**](UsersListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserById**
> UserResponse getUserById(id)

Get user by ID

Retrieve a user by their unique ID

### Example
```dart
import 'package:api/api.dart';

final api = Api().getUsersApi();
final int id = 1; // int | The ID of the user

try {
    final response = api.getUserById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->getUserById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| The ID of the user | 

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserByToken**
> UserResponse getUserByToken(authorization)

Get user by token

### Example
```dart
import 'package:api/api.dart';

final api = Api().getUsersApi();
final String authorization = Bearer your-jwt-token-here; // String | Bearer token for authentication.

try {
    final response = api.getUserByToken(authorization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->getUserByToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Bearer token for authentication. | 

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUserById**
> UpdateUserById200Response updateUserById(id, updateUserByIdRequest)

Update user information

Updates user details like mobile, fullname, email, password, etc.

### Example
```dart
import 'package:api/api.dart';

final api = Api().getUsersApi();
final String id = id_example; // String | The user ID to update.
final UpdateUserByIdRequest updateUserByIdRequest = ; // UpdateUserByIdRequest | User information to update

try {
    final response = api.updateUserById(id, updateUserByIdRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UsersApi->updateUserById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The user ID to update. | 
 **updateUserByIdRequest** | [**UpdateUserByIdRequest**](UpdateUserByIdRequest.md)| User information to update | 

### Return type

[**UpdateUserById200Response**](UpdateUserById200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

