import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:flutter/material.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../model/ride/locations.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository repository;

  RidePreference? _currentPreference;
  List<RidePreference> _pastPreferences = [];

  RidePreferenceState(this.repository);

  // Getters
  RidePreference? get currentPreference => _currentPreference;
  List<RidePreference> get pastPreferences => _pastPreferences;

  // 1. Load history from repository
  Future<void> loadPastPreferences() async {
    _pastPreferences = await repository.getPastPreferences();
    notifyListeners();
  }

  // 2. Update specific parts of the preference 
  void updateDeparture(Location departure) {
    if (_currentPreference == null) {
      // Create initial preference if null
      _currentPreference = RidePreference(
        departure: departure,
        arrival: departure,
        departureDate: DateTime.now(),
        requestedSeats: 1,
      );
    } else {
      _currentPreference = _currentPreference!.copyWith(departure: departure);
    }
    notifyListeners();
  }

  void updateArrival(Location arrival) {
    if (_currentPreference != null) {
      _currentPreference = _currentPreference!.copyWith(arrival: arrival);
      notifyListeners();
    }
  }

  // 3. Set a full preference from the history
  void setCurrentPreference(RidePreference preference) {
    _currentPreference = preference;
    repository.addPreference(preference); // Save to history
    loadPastPreferences(); // Refresh history list
    notifyListeners();
  }
}
