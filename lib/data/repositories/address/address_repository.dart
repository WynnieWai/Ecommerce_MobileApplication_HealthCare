import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/data/repositories/authentication/authentication_repository.dart';
import 'package:testing_asg1/features/personalization/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw 'Unable to find user information. Try again in few minutes.';

      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();

      // Additional code to fetch addresses would go here...
    } catch (e) {
      throw 'Something went wrong while fetching Address Information. Try again later';
    }
  }

    /// Clean the "selected" field for all addresses
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      // (logic for updating the 'selected' field in Firestore goes here)
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db
      .collection('Users')
      .doc(userId)
      .collection('Addresses')
      .doc(addressId)
      .update({'SelectedAddress': selected});

    } catch (e) {
      throw 'Unable to update your address selection. Try again later';
    }
  }

  /// Store new user order
Future<String> addAddress(AddressModel address) async {
  try {
    final userId = AuthenticationRepository.instance.authUser!.uid;
    final currentAddress = await _db
        .collection('Users')
        .doc(userId)
        .collection('Addresses')
        .add(address.toJson());
    return currentAddress.id;
  } catch (e) {
    throw 'Something went wrong while saving Address Information. Try again later';
  }
}

  Future<void> deleteAddress(String addressId) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .delete();
    } catch (e) {
      throw 'Something went wrong while deleting the address. Try again later';
    }
  }

}
