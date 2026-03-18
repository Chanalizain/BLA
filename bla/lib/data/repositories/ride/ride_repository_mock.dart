import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/model/user/user.dart';

class RideRepositoryMock extends RideRepository {
  // Fake  Users
static List<User> fakeUsers = [
  User(
    firstName: "Alice",
    lastName: "Dupont",
    email: "alice.dupont@example.com",
    phone: "+33 612345678",
    profilePicture: "https://randomUser.me/api/portraits/women/1.jpg",
    verifiedProfile: true,
  ),
  User(
    firstName: "Bob",
    lastName: "Smith",
    email: "bob.smith@example.com",
    phone: "+44 789456123",
    profilePicture: "https://randomUser.me/api/portraits/men/2.jpg",
    verifiedProfile: false,
  ),
  User(
    firstName: "Charlie",
    lastName: "Martin",
    email: "charlie.martin@example.com",
    phone: "+33 674839201",
    profilePicture: "https://randomUser.me/api/portraits/men/3.jpg",
    verifiedProfile: true,
  ),
  User(
    firstName: "Diane",
    lastName: "Lemoine",
    email: "diane.lemoine@example.com",
    phone: "+44 741258963",
    profilePicture: "https://randomUser.me/api/portraits/women/4.jpg",
    verifiedProfile: true,
  ),
  User(
    firstName: "Ethan",
    lastName: "Brown",
    email: "ethan.brown@example.com",
    phone: "+44 785412369",
    profilePicture: "https://randomUser.me/api/portraits/men/5.jpg",
    verifiedProfile: false,
  ),
  User(
    firstName: "Fanny",
    lastName: "Durand",
    email: "fanny.durand@example.com",
    phone: "+33 675839201",
    profilePicture: "https://randomUser.me/api/portraits/women/6.jpg",
    verifiedProfile: true,
  ),
];
  final List<Ride> _rides = [
  Ride(
    departureLocation: LocationRepositoryMock.locations[0], // London
    departureDate: DateTime.now().add(Duration(hours: 3)),
    arrivalLocation: LocationRepositoryMock.locations[19], // Paris
    arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
    driver: fakeUsers[0],
    availableSeats: 2,
    pricePerSeat: 25.0,
  ),

  Ride(
    departureLocation: LocationRepositoryMock.locations[0], // London
    departureDate: DateTime.now().add(Duration(hours: 10)),
    arrivalLocation: LocationRepositoryMock.locations[19], // Paris
    arrivalDateTime: DateTime.now().add(Duration(hours: 9)),
    driver: fakeUsers[1],
    availableSeats: 1,
    pricePerSeat: 30.0,
  ),

  Ride(
    departureLocation: LocationRepositoryMock.locations[2], // Birmingham
    departureDate: DateTime.now().add(Duration(days: 1)),
    arrivalLocation: LocationRepositoryMock.locations[22], // Toulouse
    arrivalDateTime: DateTime.now().add(Duration(days: 1, hours: 4)),
    driver: fakeUsers[2],
    availableSeats: 2,
    pricePerSeat: 22.5,
  ),

  Ride(
    departureLocation: LocationRepositoryMock.locations[3], // Liverpool
    departureDate: DateTime.now().add(Duration(days: 2)),
    arrivalLocation: LocationRepositoryMock.locations[23], // Nice
    arrivalDateTime: DateTime.now().add(Duration(days: 2, hours: 6)),
    driver: fakeUsers[3],
    availableSeats: 3,
    pricePerSeat: 35.0,
  ),

  Ride(
    departureLocation: LocationRepositoryMock.locations[4], // Leeds
    departureDate: DateTime.now().add(Duration(days: 2, hours: 5)),
    arrivalLocation: LocationRepositoryMock.locations[24], // Nantes
    arrivalDateTime: DateTime.now().add(Duration(days: 2, hours: 10)),
    driver: fakeUsers[4],
    availableSeats: 4,
    pricePerSeat: 28.0,
  ),

  Ride(
    departureLocation: LocationRepositoryMock.locations[5], // Glasgow
    departureDate: DateTime.now().add(Duration(days: 3)),
    arrivalLocation: LocationRepositoryMock.locations[25], // Strasbourg
    arrivalDateTime: DateTime.now().add(Duration(days: 3, hours: 7)),
    driver: fakeUsers[5],
    availableSeats: 3,
    pricePerSeat: 40.0,
  ),

  Ride(
    departureLocation: LocationRepositoryMock.locations[6], // Sheffield
    departureDate: DateTime.now().add(Duration(days: 3, hours: 2)),
    arrivalLocation: LocationRepositoryMock.locations[26], // Montpellier
    arrivalDateTime: DateTime.now().add(Duration(days: 3, hours: 8)),
    driver: fakeUsers[0],
    availableSeats: 2,
    pricePerSeat: 26.0,
  ),

  Ride(
    departureLocation: LocationRepositoryMock.locations[7], // Bristol
    departureDate: DateTime.now().add(Duration(days: 4)),
    arrivalLocation: LocationRepositoryMock.locations[27], // Bordeaux
    arrivalDateTime: DateTime.now().add(Duration(days: 4, hours: 6)),
    driver: fakeUsers[1],
    availableSeats: 3,
    pricePerSeat: 29.0,
  ),

  Ride(
    departureLocation: LocationRepositoryMock.locations[8], // Edinburgh
    departureDate: DateTime.now().add(Duration(days: 4, hours: 4)),
    arrivalLocation: LocationRepositoryMock.locations[28], // Lille
    arrivalDateTime: DateTime.now().add(Duration(days: 4, hours: 9)),
    driver: fakeUsers[2],
    availableSeats: 4,
    pricePerSeat: 27.5,
  ),

  Ride(
    departureLocation: LocationRepositoryMock.locations[9], // Leicester
    departureDate: DateTime.now().add(Duration(days: 5)),
    arrivalLocation: LocationRepositoryMock.locations[29], // Rennes
    arrivalDateTime: DateTime.now().add(Duration(days: 5, hours: 5)),
    driver: fakeUsers[3],
    availableSeats: 3,
    pricePerSeat: 24.0,
  ),
    
  ];

  @override
  Future<List<Ride>> getRides(RidePreference preference) async{
    // TODO: implement getRides
    await Future.delayed(const Duration(microseconds: 500));
    
    return _rides.where((ride) {
      bool isDepartureMatch =
          ride.departureLocation.name == preference.departure.name;
      bool isArrivalMatch =
          ride.arrivalLocation.name == preference.arrival.name;

      return isDepartureMatch && isArrivalMatch;
    }).toList();
  }
}
