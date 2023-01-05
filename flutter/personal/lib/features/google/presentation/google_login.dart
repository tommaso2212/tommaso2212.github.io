import 'package:flutter/material.dart';

class GoogleLogin extends StatelessWidget {
  final void Function()? onPressed;

  const GoogleLogin({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                onPressed: onPressed,
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
    );
  }
}
