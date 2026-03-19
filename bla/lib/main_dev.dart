import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:blabla/ui/state/ride_preference_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  // 1. Initialize your Mock Repositories
  final locationRepo = LocationRepositoryMock();
  final rideRepo = RideRepositoryMock();
  final ridePrefRepo = RidePreferenceRepositoryMock();

  runApp(
    MultiProvider(
      providers: [
        // 2. Inject them as the Abstract class type
        Provider<LocationRepository>(create: (_) => locationRepo),
        Provider<RideRepository>(create: (_) => rideRepo),
        Provider<RidePreferenceRepository>(create: (_) => ridePrefRepo),

        ChangeNotifierProvider<RidePreferenceState>(
          create: (context) =>
              RidePreferenceState(context.read<RidePreferenceRepository>()),
        ),
      ],
      child: const BlaBlaApp(), 
    ),
  );
}
