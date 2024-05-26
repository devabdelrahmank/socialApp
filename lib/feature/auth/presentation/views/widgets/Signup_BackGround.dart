import 'package:flutter/material.dart';
import 'package:silent_corner_social/core/utils/assets.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/signup_Screen.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/have_an_account.dart';

class SignupBackGround extends StatelessWidget {
  const SignupBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        AssetsImage.background,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 130, left: 20, right: 20),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: double.infinity,
                      height: 620,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const SignupScreen(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const HaveAnAccountAndNav(
              navegatetologin: true,
              text: 'You have an account !',
            )
          ],
        ),
      ),
    );
  }
}
