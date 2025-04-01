# api.api.PredefinedApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://192.168.0.103:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPredefined**](PredefinedApi.md#createpredefined) | **POST** /api/predefined/save | Create a new predefined entity
[**deletePredefined**](PredefinedApi.md#deletepredefined) | **DELETE** /api/predefined/{id} | Delete predefined entity by ID
[**getPredefinedById**](PredefinedApi.md#getpredefinedbyid) | **GET** /api/predefined/{id} | Get predefined entity by ID
[**getPredefinedList**](PredefinedApi.md#getpredefinedlist) | **POST** /api/predefined/list-by-type | Get list of predefined entities
[**updatePredefined**](PredefinedApi.md#updatepredefined) | **PUT** /api/predefined/{id} | Update predefined entity by ID


# **createPredefined**
> PredefinedResponse createPredefined(createPredefinedRequest)

Create a new predefined entity

Create a new predefined entity by providing details

### Example
```dart
import 'package:api/api.dart';

final api = Api().getPredefinedApi();
final CreatePredefinedRequest createPredefinedRequest = ; // CreatePredefinedRequest | 

try {
    final response = api.createPredefined(createPredefinedRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PredefinedApi->createPredefined: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createPredefinedRequest** | [**CreatePredefinedRequest**](CreatePredefinedRequest.md)|  | 

### Return type

[**PredefinedResponse**](PredefinedResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePredefined**
> PredefinedResponse deletePredefined(id)

Delete predefined entity by ID

Delete the predefined entity by its unique ID

### Example
```dart
import 'package:api/api.dart';

final api = Api().getPredefinedApi();
final int id = 1; // int | The ID of the predefined entity to delete

try {
    final response = api.deletePredefined(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PredefinedApi->deletePredefined: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| The ID of the predefined entity to delete | 

### Return type

[**PredefinedResponse**](PredefinedResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPredefinedById**
> PredefinedResponse getPredefinedById(id)

Get predefined entity by ID

Retrieve a predefined entity by its unique ID

### Example
```dart
import 'package:api/api.dart';

final api = Api().getPredefinedApi();
final int id = 1; // int | The ID of the predefined entity

try {
    final response = api.getPredefinedById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PredefinedApi->getPredefinedById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| The ID of the predefined entity | 

### Return type

[**PredefinedResponse**](PredefinedResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPredefinedList**
> PredefinedListResponse getPredefinedList(predefinedListRequest)

Get list of predefined entities

Retrieve a list of predefined entities based on an optional filter for entityType

### Example
```dart
import 'package:api/api.dart';

final api = Api().getPredefinedApi();
final PredefinedListRequest predefinedListRequest = ; // PredefinedListRequest | 

try {
    final response = api.getPredefinedList(predefinedListRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PredefinedApi->getPredefinedList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **predefinedListRequest** | [**PredefinedListRequest**](PredefinedListRequest.md)|  | 

### Return type

[**PredefinedListResponse**](PredefinedListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePredefined**
> PredefinedResponse updatePredefined(id, createPredefinedRequest)

Update predefined entity by ID

Update the predefined entity details for a given ID

### Example
```dart
import 'package:api/api.dart';

final api = Api().getPredefinedApi();
final int id = 1; // int | The ID of the predefined entity to update
final CreatePredefinedRequest createPredefinedRequest = ; // CreatePredefinedRequest | 

try {
    final response = api.updatePredefined(id, createPredefinedRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PredefinedApi->updatePredefined: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| The ID of the predefined entity to update | 
 **createPredefinedRequest** | [**CreatePredefinedRequest**](CreatePredefinedRequest.md)|  | 

### Return type

[**PredefinedResponse**](PredefinedResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

