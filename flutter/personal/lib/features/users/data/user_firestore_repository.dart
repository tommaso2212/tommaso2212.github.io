import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal/features/authentication/application/firebase_authentication.dart';
import 'package:personal/features/firestore/data/base_firestore_repository.dart';
import 'package:personal/features/users/data/dto/user_data.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

abstract class UserFirestoreRepository extends BaseFirestoreRepository {

  @override
  String get collection => 'users';

  static UserFirestoreRepository create() => _UserFirestoreRepository();

  Future<UserData?> getUserData(String id);

  Future<UserData?> getCurrentUserData();
}

class _UserFirestoreRepository extends UserFirestoreRepository {

  @override
  Future<UserData?> getUserData(String id) async {
    UserData? userData;

    DocumentSnapshot documentSnapshot = await collectionReference.doc(id).get();

    try {
      userData =
          UserData.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      userData = null;
    }

    return userData;
  }

  @override
  Future<UserData?> getCurrentUserData() async {
    UserData? userData;

    String? uid = serviceLocator<FirebaseAuthentication>().getCurrentUser()?.uid;
    if (uid != null) {
      userData = await getUserData(uid);
    }

    return userData;
  }

  @override
  void registerInjectable() {
    serviceLocator.registerInjectable<UserFirestoreRepository>(this);
  }
  
}
