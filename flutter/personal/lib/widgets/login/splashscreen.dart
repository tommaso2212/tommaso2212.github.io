import 'package:flutter/material.dart';
import 'package:personal/core/firebase/firebase_manager.dart';
import 'package:personal/widgets/login/components/login_button.dart';
import 'package:personal/widgets/pages/home_page.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  void login(BuildContext context) async {
    await FirebaseManager.initFirebase();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
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
                  child: LoginButton(
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
                    label: 'Login with Google',
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
