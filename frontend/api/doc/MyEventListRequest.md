# api.model.MyEventListRequest

## Load the model package
```dart
import 'package:api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **int** | The ID of the user for whom to fetch RSVPed events. | 
**isUpcoming** | **bool** | Flag to filter for upcoming events (e.g., `true` for upcoming events). | [optional] [default to false]
**isPast** | **bool** | Flag to filter for past events (e.g., `true` for past events). | [optional] [default to false]
**isToday** | **bool** | Flag to filter for today's events (e.g., `true` for today's events). | [optional] [default to false]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


