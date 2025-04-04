import 'package:api/src/model/create_event_request.dart';
import 'package:api/src/model/create_predefined_request.dart';
import 'package:api/src/model/create_user_request.dart';
import 'package:api/src/model/error.dart';
import 'package:api/src/model/error_error.dart';
import 'package:api/src/model/event.dart';
import 'package:api/src/model/event_list_by_category_request.dart';
import 'package:api/src/model/event_list_by_category_response.dart';
import 'package:api/src/model/event_response.dart';
import 'package:api/src/model/events_list_response.dart';
import 'package:api/src/model/login_request.dart';
import 'package:api/src/model/login_response.dart';
import 'package:api/src/model/login_response_data.dart';
import 'package:api/src/model/my_event_list_request.dart';
import 'package:api/src/model/predefined.dart';
import 'package:api/src/model/predefined_list_request.dart';
import 'package:api/src/model/predefined_list_response.dart';
import 'package:api/src/model/predefined_response.dart';
import 'package:api/src/model/rsvp_status_response.dart';
import 'package:api/src/model/update_rsvp_request.dart';
import 'package:api/src/model/update_user_by_id200_response.dart';
import 'package:api/src/model/update_user_by_id400_response.dart';
import 'package:api/src/model/update_user_by_id400_response_error.dart';
import 'package:api/src/model/update_user_by_id500_response.dart';
import 'package:api/src/model/update_user_by_id500_response_error.dart';
import 'package:api/src/model/update_user_by_id_request.dart';
import 'package:api/src/model/user.dart';
import 'package:api/src/model/user_response.dart';
import 'package:api/src/model/users_list_response.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType,
    {bool growable = true}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'CreateEventRequest':
      return CreateEventRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreatePredefinedRequest':
      return CreatePredefinedRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateUserRequest':
      return CreateUserRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Error':
      return Error.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ErrorError':
      return ErrorError.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Event':
      return Event.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'EventListByCategoryRequest':
      return EventListByCategoryRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'EventListByCategoryResponse':
      return EventListByCategoryResponse.fromJson(
          {"status": "OK", "code": 200, "data": value}) as ReturnType;
    case 'EventResponse':
      return EventResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'EventsListResponse':
      return EventsListResponse.fromJson(
          {"status": "OK", "code": 200, "data": value}) as ReturnType;
    case 'LoginRequest':
      return LoginRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LoginResponse':
      return LoginResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'LoginResponseData':
      return LoginResponseData.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'MyEventListRequest':
      return MyEventListRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Predefined':
      return Predefined.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PredefinedListRequest':
      return PredefinedListRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PredefinedListResponse':
      return PredefinedListResponse.fromJson(
          {"status": "OK", "code": 200, "data": value}) as ReturnType;
    case 'PredefinedResponse':
      return PredefinedResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'RsvpStatusResponse':
      return RsvpStatusResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateRsvpRequest':
      return UpdateRsvpRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateUserById200Response':
      return UpdateUserById200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateUserById400Response':
      return UpdateUserById400Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateUserById400ResponseError':
      return UpdateUserById400ResponseError.fromJson(
          value as Map<String, dynamic>) as ReturnType;
    case 'UpdateUserById500Response':
      return UpdateUserById500Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateUserById500ResponseError':
      return UpdateUserById500ResponseError.fromJson(
          value as Map<String, dynamic>) as ReturnType;
    case 'UpdateUserByIdRequest':
      return UpdateUserByIdRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'User':
      return User.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UserResponse':
      return UserResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UsersListResponse':
      return UsersListResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toList(growable: growable) as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toSet() as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!.trim(); // ignore: parameter_assignments
        return Map<String, BaseType>.fromIterables(
          value.keys as Iterable<String>,
          value.values.map((dynamic v) => deserialize<BaseType, BaseType>(
              v, targetType,
              growable: growable)),
        ) as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
