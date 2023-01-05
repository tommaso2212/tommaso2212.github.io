import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/features/users/data/user_repository.dart';
import 'package:personal/features/users/domain/user.dart';

final userProvider = StateNotifierProvider<UserProvider, User?>(
  (ref) {
    var repo = ref.read(userRepository);
    return UserProvider(repo);
  },
);

class UserProvider extends StateNotifier<User?> {

  final UserRepository userRepository;

  UserProvider(this.userRepository) : super(null);

  Future<void> fetchUser() async {
    state = await userRepository.getCurrentUser();
  }
}