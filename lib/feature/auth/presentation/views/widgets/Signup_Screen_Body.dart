// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/core/cache/shared.dart';
import 'package:silent_corner_social/core/function/flutter_toast.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/Login_BackGround.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/signup_field.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/logo_And_text.dart';
import '../../../../../core/widgets/defult_custom_Button.dart';

class SignupScreenBody extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  SignupScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is SuccessSignUpState) {
          CacheHelper().saveData(
            key: 'idd',
            value: state.id,
          );
          toastMessage(state: ToastStates.SUCCESS, text: 'Sign Up Successful');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginBackGround(),
            ),
          );
        } else if (state is ErrorLoginState) {
          toastMessage(
            state: ToastStates.ERROR,
            text: state.error,
          );
        }
      },
      builder: (context, state) {
        final auth = AppCubit.get(context);
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const LogoAndText(
                    logo: 'Sign Up',
                    text: 'To Have an account in Silent Corner',
                  ),
                  const SizedBox(height: 20),
                  SignupField(
                    obscureText: auth.isShow,
                    emailController: AppCubit.get(context).emailController,
                    passwordController:
                        AppCubit.get(context).passwordController,
                    nameController: AppCubit.get(context).nameController,
                    phoneController: AppCubit.get(context).phoneController,
                    iconsuffix: auth.icon,
                    onpressedSuffix: () {
                      auth.passwordShowSuffix();
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: state is LodingSignUpState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : CustomTextButton(
                            bottomLeft: 20,
                            bottomRight: 20,
                            topLeft: 20,
                            topRight: 20,
                            width: double.infinity,
                            colorText: Colors.black,
                            colorContainer: Colors.white54,
                            text: 'Signup',
                            onpressed: () async {
                              if (formKey.currentState!.validate()) {
                                await AppCubit.get(context)
                                    .createUserWithEmailAndPassword();
                              }
                            },
                            colorBorder: Colors.black54,
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
