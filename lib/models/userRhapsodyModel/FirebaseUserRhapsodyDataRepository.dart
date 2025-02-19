import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spiritometer/Services/auth.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyEntity.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyModel.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyRepository.dart';

class FirebaseUserRhapsodyDataRepository implements UserRhapsodyRepository {
  final AuthService _authService = AuthService();

  @override
  Future<String> addUserRhapsodyData(UserRhapsodyModel userRhapsodyData) async {
    final collection = await getCollection();

    final doc = await collection.add(
      userRhapsodyData.rhapsodyModelToEntity().toDocument(),
    );

    return doc.documentID;
  }

  @override
  Future<void> deleteUserRhapsodyData(
      UserRhapsodyModel userRhapsodyData) async {
    final collection = await getCollection();
   // final String userId = await _authService.getCurrentUserId();

    return collection.document(userRhapsodyData.id).delete();
  }

//yield continuous stream of returns
  @override
  Stream<List<UserRhapsodyModel>> getListOfUserRhapsodyData() async* {
    final collection = await getCollection();
    yield* collection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => UserRhapsodyModel.rhapsodyModelFromEntity(
              UserRhapsodyEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateUserRhapsodyData(
      UserRhapsodyModel updateUserRhapsodyData) async {
    final collection = await getCollection();
   

    return collection.document(updateUserRhapsodyData.id).updateData(
        updateUserRhapsodyData.rhapsodyModelToEntity().toDocument());
  }

  Future<CollectionReference> getCollection() async {
    final String userId = await _authService.getCurrentUserId();
    return Firestore.instance
        .collection('UserData')
        .document(userId)
        .collection('RhapsodyArticle');
  }
}
