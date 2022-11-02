import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal/features/firestore/application/firebase_manager.dart';
import 'package:personal/utils/service_locator/injectable/base_injectable.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

abstract class BaseFirestoreRepository extends BaseInjectable {
  String get collection;

  FirebaseFirestore get firestore =>
      serviceLocator<FirebaseManager>().firestore;

  CollectionReference<Map<String, dynamic>> get collectionReference =>
      firestore.collection(collection);
}
