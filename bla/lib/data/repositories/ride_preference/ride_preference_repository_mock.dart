import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock extends RidePreferenceRepository {

  final List<RidePreference> _pastPreferences = [
    RidePreference(
      departure: LocationRepositoryMock.locations[0], // London
      departureDate: DateTime.now().add(Duration(days: 1)), // Tomorrow
      arrival: LocationRepositoryMock.locations[3], // Paris
      requestedSeats: 2,
    ),
    RidePreference(
      departure: LocationRepositoryMock.locations[1], // Manchester
      departureDate: DateTime.now().add(Duration(days: 7)), // Next week
      arrival: LocationRepositoryMock.locations[4], // Lyon
      requestedSeats: 3,
    ),
    RidePreference(
      departure: LocationRepositoryMock.locations[2], // Birmingham
      departureDate: DateTime.now(), // Today
      arrival: LocationRepositoryMock.locations[5], // Marseille
      requestedSeats: 1,
    ),
    RidePreference(
      departure: LocationRepositoryMock.locations[0], // London
      departureDate: DateTime.now().add(Duration(days: 1)), // Tomorrow
      arrival: LocationRepositoryMock.locations[3], // Paris
      requestedSeats: 2,
    ),
    RidePreference(
      departure: LocationRepositoryMock.locations[4], // Manchester
      departureDate: DateTime.now().add(Duration(days: 7)), // Next week
      arrival: LocationRepositoryMock.locations[0], // Lyon
      requestedSeats: 3,
    ),
    RidePreference(
      departure: LocationRepositoryMock.locations[5], // Birmingham
      departureDate: DateTime.now(), // Today
      arrival: LocationRepositoryMock.locations[1], // Marseille
      requestedSeats: 1,
    ),
  ];

  @override
  Future<List<RidePreference>> getPastPreferences() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _pastPreferences;
  }

  @override
  Future<void> addPreference(RidePreference ridePreference) async {
    // Logic: Add the new search to the top of the list
    _pastPreferences.insert(0, ridePreference);

    if (_pastPreferences.length > 8) {
      _pastPreferences.removeLast();
    }
  }
}
