import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RideRepository {
  Future<List<Ride>> getRides(RidePreference preference);
}
