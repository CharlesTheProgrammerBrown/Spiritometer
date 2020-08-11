import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spiritometer/Services/auth.dart';
import 'package:spiritometer/models/userDataModel/userDataEntity.dart';
import 'package:spiritometer/models/userDataModel/userDataModel.dart';
import 'package:spiritometer/models/userDataModel/userDataRepository.dart';

class FirebaseUserDataRepository implements UserDataRepository {
  final AuthService _authService = AuthService();

  @override
  Future<String> addUserData(UserDataModel userData) async {
    final collection = await getCollection();
    final String userId = await _authService.getCurrentUserId();

    await collection.document(userId).setData(
          userData.userDataToEntity().toDocument(),
        );

    return userId;
  }

  @override
  Future<void> deleteUserData(UserDataModel userData) async {
    final collection = await getCollection();
    final String userId = await _authService.getCurrentUserId();

    return collection.document(userId).delete();
  }

  @override
  Stream<UserDataModel> getCurrentUserData() async* {
    final collection = await getCollection();
    final String userId = await _authService.getCurrentUserId();
    yield* collection.document(userId).snapshots().map((doc) {
      return UserDataModel.fromEntity(UserDataEntity.fromSnapshot(doc));
    });
  }

  @override
  Stream<List<UserDataModel>> getListofUserData() async* {
    final collection = await getCollection();
    yield* collection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) =>
              UserDataModel.fromEntity(UserDataEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateUserData(UserDataModel update) async {
    final collection = await getCollection();
    final String userId = await _authService.getCurrentUserId();

    return collection
        .document(userId)
        .updateData(update.userDataToEntity().toDocument());
  }

@override
  Future<void> updateUserPhoto(UserDataModel update) async {
    final collection = await getCollection();
    final String userId = await _authService.getCurrentUserId();

    return collection
        .document(userId)
        .updateData(update.userDataToEntity().toDocumentPhotoUrlUpdate());
  }
  //add collection method

  Future<CollectionReference> getCollection() async {
    return Firestore.instance.collection('UserData');
  }
}
