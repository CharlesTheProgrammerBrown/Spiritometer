import 'package:spiritometer/models/userDataModel/userDataModel.dart';

abstract class UserDataRepository {
  Future<String> addUserData(UserDataModel userData);

  Future<void> deleteUserData(UserDataModel userData);

  Stream<List<UserDataModel>> getListofUserData();

  Stream<UserDataModel> getCurrentUserData();

  Future<void> updateUserData(UserDataModel userData);

  Future<void> updateUserPhoto(UserDataModel userData);
}
