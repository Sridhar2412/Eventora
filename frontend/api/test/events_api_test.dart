import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for EventsApi
void main() {
  final instance = Api().getEventsApi();

  group(EventsApi, () {
    // Create a new event
    //
    // Create a new event by providing event details
    //
    //Future<EventResponse> createEvent(CreateEventRequest createEventRequest) async
    test('test createEvent', () async {
      // TODO
    });

    // Delete event by ID
    //
    // Delete the event by its unique ID
    //
    //Future<EventResponse> deleteEvent(int id) async
    test('test deleteEvent', () async {
      // TODO
    });

    // Get all events
    //
    // Retrieve a list of all events
    //
    //Future<EventsListResponse> getAllEvents() async
    test('test getAllEvents', () async {
      // TODO
    });

    // Get event by ID
    //
    // Retrieve an event by its unique ID
    //
    //Future<EventResponse> getEventById(int id) async
    test('test getEventById', () async {
      // TODO
    });

    // Update event by ID
    //
    // Update the event details for a given event ID
    //
    //Future<EventResponse> updateEvent(int id, CreateEventRequest createEventRequest) async
    test('test updateEvent', () async {
      // TODO
    });
  });
}
