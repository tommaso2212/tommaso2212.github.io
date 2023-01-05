import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/features/google/data/google_auth.dart';
import 'package:personal/features/users/domain/user.dart';

final userRepository = Provider<UserRepository>(
  (ref) => _UserRepositoryImpl(ref),
);

abstract class UserRepository {
  Future<User?> getCurrentUser();
}

class _UserRepositoryImpl implements UserRepository {
  final ProviderRef ref;

  _UserRepositoryImpl(this.ref);

  Future<Map<String, dynamic>?> _getCurrentUserFirestore(String? id) async {
    var firestoreUser = await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get();
    return firestoreUser.data();
  }

  @override
  Future<User?> getCurrentUser() async {

    var googleAccount = ref.read(googleAuthProvider).getCurrentUser();

    if(googleAccount == null){
      return null;
    }

    var name = googleAccount.displayName;
    var imageUrl = googleAccount.photoUrl;
    var role = (await _getCurrentUserFirestore(googleAccount.email))?['role'] as int?;

    return User(
      role: role != null ? UserRole.values[role] : UserRole.public,
      name: name,
      imageUrl: imageUrl,
    );
  }
}
