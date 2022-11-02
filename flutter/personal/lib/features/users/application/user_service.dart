import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal/features/authentication/application/google_authentication.dart';
import 'package:personal/features/users/data/dto/user_data.dart';
import 'package:personal/features/users/data/user_firestore_repository.dart';
import 'package:personal/features/users/domain/user.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

abstract class UserService extends BaseInjectable {

  factory UserService() => _UserService();

  Future<User> getCurrentUser();
}

class _UserService implements UserService {
  @override
  Future<User> getCurrentUser() async {
    GoogleSignInAccount? account =
        serviceLocator<GoogleAuthentication>().getCurrentUser();

    String? name = account?.displayName;
    String? imageUrl = account?.photoUrl;
    RoleEnum role = RoleEnum.public;

    UserData? userData =
        await serviceLocator<UserFirestoreRepository>().getCurrentUserData();

    if (userData != null) {
      role = RoleEnum.values[userData.role];
    }

    var user = User(name: name ?? "", imageUrl: imageUrl ?? "", role: role);
    
    return user;
  }

  @override
  void registerInjectable() {
    serviceLocator.registerInjectable<UserService>(this);
  }

}
