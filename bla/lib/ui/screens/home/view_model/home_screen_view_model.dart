import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/rides_selection/rides_selection_screen.dart';
import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';
import '../../../../utils/date_time_utils.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;

  HomeViewModel({required this.ridePreferenceState}){
    ridePreferenceState.addListener(_onStateChanged);
  }

  void _onStateChanged() => notifyListeners();

  @override
  void dispose() {
    // Always remove listeners when the VM is destroyed to prevent memory leaks
    ridePreferenceState.removeListener(_onStateChanged);
    super.dispose();
  }

  // Getters for the UI
  RidePreference? get currentPreference =>
      ridePreferenceState.currentPreference;
  List<RidePreference> get history =>
      ridePreferenceState.pastPreferences.reversed.toList();

  // Logic: When a preference is selected (from Picker or History)
  void onRidePrefSelected(
    BuildContext context,
    RidePreference selectedPreference,
  ) async {
    ridePreferenceState.setCurrentPreference(selectedPreference);

    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()));
  }

  // Helper to format the title for a history item
  String getHistoryTitle(RidePreference preference) {
    return "${preference.departure.name} → ${preference.arrival.name}";
  }

  // Helper to format the subtitle for a history item
  String getHistorySubtitle(RidePreference preference) {
    String date = DateTimeUtils.formatDateTime(preference.departureDate);
    int seats = preference.requestedSeats;
    String plural = seats > 1 ? "s" : "";
    
    return "$date, $seats passenger$plural";
  }
}
