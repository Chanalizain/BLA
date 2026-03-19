import 'package:blabla/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../state/ride_preference_state.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RideRepository rideRepository;
  final RidePreferenceState ridePreferenceState;

  List<Ride> _matchingRides = [];
  List<Ride> get matchingRides => _matchingRides;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RidesSelectionViewModel({
    required this.rideRepository,
    required this.ridePreferenceState,
  }) {
    // Listen to global state so we refresh if preference changes
    ridePreferenceState.addListener(fetchRides);
    fetchRides();
  }

  RidePreference get currentPreference =>
      ridePreferenceState.currentPreference!;

  Future<void> fetchRides() async {
    _isLoading = true;
    notifyListeners();

    _matchingRides = await rideRepository.getRides(currentPreference);

    _isLoading = false;
    notifyListeners();
  }

  void updatePreference(RidePreference newPreference) {
    ridePreferenceState.setCurrentPreference(newPreference);
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(fetchRides);
    super.dispose();
  }
  void onRideSelected(Ride ride) {
    // Later
  }

}
