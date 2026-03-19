import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_selection_content.dart';
import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/repositories/ride/ride_repository.dart';

///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RidesSelectionViewModel>(
      create: (context) => RidesSelectionViewModel(
        rideRepository: context.read<RideRepository>(),
        ridePreferenceState: context.read<RidePreferenceState>(),
      ),
      child: Consumer<RidesSelectionViewModel>(
        builder: (context, viewModel, child) =>
            RidesSelectionContent(viewModel: viewModel),
      ),
    );
  }
}
