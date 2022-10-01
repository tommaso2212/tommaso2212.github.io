import 'package:flutter/material.dart';
import 'package:personal/core/authentication/firebase_authentication.dart';
import 'package:personal/core/firestore/model/user_data.dart';
import 'package:personal/widgets/login/splashscreen.dart';

class Profile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final RoleEnum role;

  const Profile(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.role})
      : super(key: key);

  void logout(BuildContext context) async {
    await FirebaseAuthentication.logout();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Splashscreen()));
  }

  TextDecoration getTextDecoration() {
    switch (role) {
      case RoleEnum.admin:
        return TextDecoration.underline;
      default:
        return TextDecoration.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 18,
              decoration: getTextDecoration(),
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () => logout(context),
          child: const Text("Logout"),
        ),
      ],
    );
  }
}
