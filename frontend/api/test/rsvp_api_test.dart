import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for RSVPApi
void main() {
  final instance = Api().getRSVPApi();

  group(RSVPApi, () {
    // Get RSVP status for a user and event
    //
    //Future<Boolean> apiRsvpGetMyRsvpStatusPost(UpdateRsvpRequest updateRsvpRequest) async
    test('test apiRsvpGetMyRsvpStatusPost', () async {
      // TODO
    });

    // Update the RSVP status for a user and event
    //
    //Future<RsvpStatusResponse> apiRsvpUpdateRsvpPost(UpdateRsvpRequest updateRsvpRequest) async
    test('test apiRsvpUpdateRsvpPost', () async {
      // TODO
    });
  });
}
