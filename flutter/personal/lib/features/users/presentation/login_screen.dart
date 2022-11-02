import 'package:flutter/material.dart';
import 'package:personal/features/firestore/application/firebase_manager.dart';
import 'package:personal/features/google_workspace/data/google_drive_manager.dart';
import 'package:personal/routing/app_route.dart';
import 'package:personal/routing/app_routing.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void login(BuildContext context) async {
    await serviceLocator<FirebaseManager>().initFirebase();
    await serviceLocator<GoogleDriveManager>().initDriveClient();
    AppRouting.replace(context, AppRoute.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          shadowColor: Colors.grey,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 34),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: OutlinedButton.icon(
                    onPressed: () => login(context),
                    icon: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA',
                          ),
                        ),
                      ),
                    ),
                    label: const Text('Login with Google'),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
