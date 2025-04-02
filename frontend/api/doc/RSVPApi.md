# api.api.RSVPApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://192.168.0.103:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiRsvpGetMyRsvpStatusPost**](RSVPApi.md#apirsvpgetmyrsvpstatuspost) | **POST** /api/rsvp/getMyRsvpStatus | Get RSVP status for a user and event
[**apiRsvpUpdateRsvpPost**](RSVPApi.md#apirsvpupdatersvppost) | **POST** /api/rsvp/updateRsvp | Update the RSVP status for a user and event


# **apiRsvpGetMyRsvpStatusPost**
> bool apiRsvpGetMyRsvpStatusPost(updateRsvpRequest)

Get RSVP status for a user and event

### Example
```dart
import 'package:api/api.dart';

final api = Api().getRSVPApi();
final UpdateRsvpRequest updateRsvpRequest = ; // UpdateRsvpRequest | 

try {
    final response = api.apiRsvpGetMyRsvpStatusPost(updateRsvpRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RSVPApi->apiRsvpGetMyRsvpStatusPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateRsvpRequest** | [**UpdateRsvpRequest**](UpdateRsvpRequest.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiRsvpUpdateRsvpPost**
> RsvpStatusResponse apiRsvpUpdateRsvpPost(updateRsvpRequest)

Update the RSVP status for a user and event

### Example
```dart
import 'package:api/api.dart';

final api = Api().getRSVPApi();
final UpdateRsvpRequest updateRsvpRequest = ; // UpdateRsvpRequest | 

try {
    final response = api.apiRsvpUpdateRsvpPost(updateRsvpRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling RSVPApi->apiRsvpUpdateRsvpPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateRsvpRequest** | [**UpdateRsvpRequest**](UpdateRsvpRequest.md)|  | 

### Return type

[**RsvpStatusResponse**](RsvpStatusResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

