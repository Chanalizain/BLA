import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:flutter/material.dart';
import 'rides_selection_header.dart';
import 'rides_selection_tile.dart';
import 'ride_preference_modal.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart';
import '../../../theme/theme.dart';

class RidesSelectionContent extends StatelessWidget {
  final RidesSelectionViewModel viewModel;

  const RidesSelectionContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: viewModel.currentPreference,
              onBackPressed: () => Navigator.pop(context),
              onFilterPressed: () {}, // TODO
              onPreferencePressed: () => onPreferencePressed(context),
            ),
            const SizedBox(height: 24), // Adjusted from 100 for better look
            Expanded(
              child: viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: viewModel.matchingRides.length,
                      itemBuilder: (ctx, index) => RideSelectionTile(
                        ride: viewModel.matchingRides[index],
                        onPressed: () => viewModel.onRideSelected(
                          viewModel.matchingRides[index],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void onPreferencePressed(BuildContext context) async {
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: viewModel.currentPreference),
          ),
        );

    if (newPreference != null) {
      viewModel.updatePreference(newPreference);
    }
  }
}
