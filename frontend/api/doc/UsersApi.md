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

