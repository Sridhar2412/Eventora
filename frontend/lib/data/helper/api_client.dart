// ignore_for_file: avoid_public_notifier_properties
import 'package:api/api.dart' as models;
import 'package:api/api.dart';
import 'package:flutter_master/data/helper/dio_instance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

@Riverpod(keepAlive: true)
models.Api api(ApiRef ref) {
  final api = models.Api(dio: ref.read(dioInstanceProvider));
  return api;
}
