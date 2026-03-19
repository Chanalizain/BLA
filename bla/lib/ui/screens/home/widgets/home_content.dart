import 'package:blabla/ui/screens/home/home_screen.dart';
import 'package:blabla/ui/screens/home/view_model/home_screen_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_history_tile.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/pickers/bla_ride_preference_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Stack(
      children: [_buildBackground(), _buildForeground(context, viewModel)],
    );
  }

  Widget _buildForeground(BuildContext context, HomeViewModel viewModel) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          "Your pick of rides at low price",
          style: BlaTextStyles.heading.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 100),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // THE PICKER
              BlaRidePreferencePicker(
                initRidePreference: viewModel.currentPreference,
                onRidePreferenceSelected: (pref) =>
                    viewModel.onRidePrefSelected(context, pref),
              ),
              const SizedBox(height: BlaSpacings.m),

              // THE HISTORY
              _buildHistory(context, viewModel),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: viewModel.history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: viewModel.history[index],
          onPressed: () =>
              viewModel.onRidePrefSelected(context, viewModel.history[index]),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(blablaHomeImagePath, fit: BoxFit.cover),
    );
  }
}
