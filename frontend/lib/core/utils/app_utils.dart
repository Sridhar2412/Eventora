// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:convert';

import 'package:api/api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_master/core/exception/app_exception.dart';

import '../../data/model/api_res.dart';

class AppUtils {
  static Either<DioException, Object?> checkError(
    dynamic data,
    RequestOptions requestOptions,
  ) {
    if (data is! Map<String, dynamic> || data is List) {
      return right(
        ApiRes(
          data: data,
        ).data,
      );
    }
    final apiRes = ApiRes.fromJson(data);
    if (apiRes.error?.message?.isNotEmpty == true) {
      return left(
        DioException(
          requestOptions: requestOptions,
          error: AppException(
            message: apiRes.error?.message ?? '',
            type: ErrorType.responseError,
          ),
        ),
      );
    }
    if (apiRes.data != null) {
      return right(apiRes.data);
    }
    return right(data);
  }

  static dynamic convertDataToMap(dynamic data) {
    final temp = <String, dynamic>{};
    if (data == null) {
      return temp;
    }
    if (data is String) {
      if (data.contains('{')) {
        return jsonDecode(data);
      }
      return temp..['data'] = data;
    }
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data')) {
        return data['data'];
      }
      temp.addAll(data);
    }
    if (temp.isEmpty) {
      return data;
    }
    return temp;
  }

  static EventListByCategoryRequestCategoryEnum getCategory(String category) {
    switch (category) {
      case 'Social':
        return EventListByCategoryRequestCategoryEnum.social;

      case 'Sports':
        return EventListByCategoryRequestCategoryEnum.sports;

      case 'Travel':
        return EventListByCategoryRequestCategoryEnum.travel;

      case 'Community':
        return EventListByCategoryRequestCategoryEnum.community;

      case 'Games':
        return EventListByCategoryRequestCategoryEnum.games;

      case 'Tech':
        return EventListByCategoryRequestCategoryEnum.tech;

      case 'Education':
        return EventListByCategoryRequestCategoryEnum.education;

      case 'Business':
        return EventListByCategoryRequestCategoryEnum.business;

      case 'Art':
        return EventListByCategoryRequestCategoryEnum.art;

      case 'Dancing':
        return EventListByCategoryRequestCategoryEnum.dancing;

      case 'Music':
        return EventListByCategoryRequestCategoryEnum.music;

      case 'Political':
        return EventListByCategoryRequestCategoryEnum.political;

      default:
        return EventListByCategoryRequestCategoryEnum
            .social; // Return null if no match
    }
  }
}
