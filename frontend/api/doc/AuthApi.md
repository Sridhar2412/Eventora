# api.api.AuthApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://192.168.68.145:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**loginUser**](AuthApi.md#loginuser) | **POST** /api/users/login | Login a user


# **loginUser**
> LoginResponse loginUser(loginRequest)

Login a user

Login a user with email and password

### Example
```dart
import 'package:api/api.dart';

final api = Api().getAuthApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try {
    final response = api.loginUser(loginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->loginUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

