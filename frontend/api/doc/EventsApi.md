# api.api.EventsApi

## Load the API package
```dart
import 'package:api/api.dart';
```

All URIs are relative to *http://192.168.0.103:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createEvent**](EventsApi.md#createevent) | **POST** /api/event/save | Create a new event
[**deleteEvent**](EventsApi.md#deleteevent) | **DELETE** /api/event/{id} | Delete event by ID
[**getAllEvents**](EventsApi.md#getallevents) | **GET** /api/event/list | Get all events
[**getEventById**](EventsApi.md#geteventbyid) | **GET** /api/event/{id} | Get event by ID
[**getEventListByType**](EventsApi.md#geteventlistbytype) | **POST** /api/event/list-by-category | Get list of event by category
[**getMyEvents**](EventsApi.md#getmyevents) | **POST** /api/event/myEvent/list | Get a list of events a user has RSVPed to
[**updateEvent**](EventsApi.md#updateevent) | **PATCH** /api/event/{id} | Update event by ID


# **createEvent**
> EventResponse createEvent(createEventRequest)

Create a new event

Create a new event by providing event details

### Example
```dart
import 'package:api/api.dart';

final api = Api().getEventsApi();
final CreateEventRequest createEventRequest = ; // CreateEventRequest | 

try {
    final response = api.createEvent(createEventRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->createEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createEventRequest** | [**CreateEventRequest**](CreateEventRequest.md)|  | 

### Return type

[**EventResponse**](EventResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEvent**
> EventResponse deleteEvent(id)

Delete event by ID

Delete the event by its unique ID

### Example
```dart
import 'package:api/api.dart';

final api = Api().getEventsApi();
final int id = 1; // int | The ID of the event to delete

try {
    final response = api.deleteEvent(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->deleteEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| The ID of the event to delete | 

### Return type

[**EventResponse**](EventResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllEvents**
> EventsListResponse getAllEvents(isUpcoming)

Get all events

Retrieve a list of all events

### Example
```dart
import 'package:api/api.dart';

final api = Api().getEventsApi();
final String isUpcoming = true; // String | If set to \"true\", only upcoming events will be returned

try {
    final response = api.getAllEvents(isUpcoming);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->getAllEvents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **isUpcoming** | **String**| If set to \"true\", only upcoming events will be returned | [optional] 

### Return type

[**EventsListResponse**](EventsListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEventById**
> Event getEventById(id)

Get event by ID

Retrieve an event by its unique ID

### Example
```dart
import 'package:api/api.dart';

final api = Api().getEventsApi();
final int id = 1; // int | The ID of the event

try {
    final response = api.getEventById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->getEventById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| The ID of the event | 

### Return type

[**Event**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEventListByType**
> EventListByCategoryResponse getEventListByType(eventListByCategoryRequest)

Get list of event by category

Retrieve a list of event category based on an optional filter for category

### Example
```dart
import 'package:api/api.dart';

final api = Api().getEventsApi();
final EventListByCategoryRequest eventListByCategoryRequest = ; // EventListByCategoryRequest | 

try {
    final response = api.getEventListByType(eventListByCategoryRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->getEventListByType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventListByCategoryRequest** | [**EventListByCategoryRequest**](EventListByCategoryRequest.md)|  | 

### Return type

[**EventListByCategoryResponse**](EventListByCategoryResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyEvents**
> EventsListResponse getMyEvents(myEventListRequest)

Get a list of events a user has RSVPed to

This endpoint returns a list of events that the user has RSVPed to, based on the isUpcoming, isPast, and isToday flags.

### Example
```dart
import 'package:api/api.dart';

final api = Api().getEventsApi();
final MyEventListRequest myEventListRequest = ; // MyEventListRequest | 

try {
    final response = api.getMyEvents(myEventListRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->getMyEvents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **myEventListRequest** | [**MyEventListRequest**](MyEventListRequest.md)|  | 

### Return type

[**EventsListResponse**](EventsListResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateEvent**
> EventResponse updateEvent(id, createEventRequest)

Update event by ID

Update the event details for a given event ID

### Example
```dart
import 'package:api/api.dart';

final api = Api().getEventsApi();
final int id = 1; // int | The ID of the event to update
final CreateEventRequest createEventRequest = ; // CreateEventRequest | 

try {
    final response = api.updateEvent(id, createEventRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->updateEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| The ID of the event to update | 
 **createEventRequest** | [**CreateEventRequest**](CreateEventRequest.md)|  | 

### Return type

[**EventResponse**](EventResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

