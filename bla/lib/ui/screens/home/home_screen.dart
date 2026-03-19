import 'package:blabla/ui/screens/home/view_model/home_screen_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_content.dart';
import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(
          ridePreferenceState: context.read<RidePreferenceState>(),
        ),
        child: const HomeContent(),
      ),
    );
  }
}

