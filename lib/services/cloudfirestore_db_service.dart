import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_up/models/amenity.dart';
import 'package:sign_up/models/caters.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection refrence
  final CollectionReference emeAmenities =
      Firestore.instance.collection('Our Amenities');

  final CollectionReference emeCaters = Firestore.instance.collection('Caters');

  final CollectionReference emeUser =
      Firestore.instance.collection('Users Profile');
  Future updateUserData(String displayName, String photoUrl, String phoneNumber,
      String email) async {
    return await emeUser.document(uid).setData({
      'name': displayName,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'email': email
    });
  }

  List<Amenity> _amenityAmenityListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Amenity(
          imgPath: doc.data['ImageUrl'] ?? '0',
          amenityName: doc.data['Name'] ?? '0',
          route: doc.data['Route'] ?? '0');
    }).toList();
  }

  // get Amenities stream from firebase
  Stream<List<Amenity>> get emeAmenitiesList {
    return emeAmenities.snapshots().map(_amenityAmenityListFromSnapshot);
  }

  List<Caters> _catersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Caters(
        catersName: doc.data['Name'] ?? '0',
        catersAbout: doc.data['About'] ?? '0',
        catersRating: doc.data['Rating'] ?? 0.0,
        caterId: doc.data['Id'] ?? 0,
        maxPricePerPlate: doc.data['Maxprice'] ?? 0,
        minPricePerPlate: doc.data['Minprice'] ?? 0,
        imageUrl: List<String>.from(doc.data['Url']) ?? [],
      );
    }).toList();
  }

  Stream<List<Caters>> get caterList {
    return emeCaters.snapshots().map(_catersListFromSnapshot);
  }
}
