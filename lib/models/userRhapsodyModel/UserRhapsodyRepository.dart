import '../userRhapsodyModel/UserRhapsodyModel.dart';

abstract class UserRhapsodyRepository {
  Future<String> addUserRhapsodyData(UserRhapsodyModel userRhapsodyData);

  Future<void> deleteUserRhapsodyData(UserRhapsodyModel userRhapsodyData);

  Stream<List<UserRhapsodyModel>> getListOfUserRhapsodyData();

  Future<void> updateUserRhapsodyData(UserRhapsodyModel updateUserRhapsodyData);
}
