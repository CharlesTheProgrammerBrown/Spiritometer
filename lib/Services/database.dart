import 'package:cloud_firestore/cloud_firestore.dart';



class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userDataCollection =
      Firestore.instance.collection('UserData');

  Future updateUserData(
      String photoUrl) async {
    return await userDataCollection.document(uid).setData(
      {
        'photoUrl': photoUrl ,
      },
      merge: true
    );
  }


  
}
