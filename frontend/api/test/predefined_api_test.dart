import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for PredefinedApi
void main() {
  final instance = Api().getPredefinedApi();

  group(PredefinedApi, () {
    // Create a new predefined entity
    //
    // Create a new predefined entity by providing details
    //
    //Future<PredefinedResponse> createPredefined(CreatePredefinedRequest createPredefinedRequest) async
    test('test createPredefined', () async {
      // TODO
    });

    // Delete predefined entity by ID
    //
    // Delete the predefined entity by its unique ID
    //
    //Future<PredefinedResponse> deletePredefined(int id) async
    test('test deletePredefined', () async {
      // TODO
    });

    // Get predefined entity by ID
    //
    // Retrieve a predefined entity by its unique ID
    //
    //Future<PredefinedResponse> getPredefinedById(int id) async
    test('test getPredefinedById', () async {
      // TODO
    });

    // Get list of predefined entities
    //
    // Retrieve a list of predefined entities based on an optional filter for entityType
    //
    //Future<PredefinedListResponse> getPredefinedList(PredefinedListRequest predefinedListRequest) async
    test('test getPredefinedList', () async {
      // TODO
    });

    // Update predefined entity by ID
    //
    // Update the predefined entity details for a given ID
    //
    //Future<PredefinedResponse> updatePredefined(int id, CreatePredefinedRequest createPredefinedRequest) async
    test('test updatePredefined', () async {
      // TODO
    });
  });
}
