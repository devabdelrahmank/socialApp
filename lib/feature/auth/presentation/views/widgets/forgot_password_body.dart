import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/core/function/flutter_toast.dart';
import 'package:silent_corner_social/core/widgets/custom_text_form.dart';
import 'package:silent_corner_social/core/widgets/defult_custom_Button.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/Login_BackGround.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/text_image_forgotpass.dart';

class ForgotPasswordBody extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is SuccessRestPasswordState) {
            toastMessage(
              state: ToastStates.SUCCESS,
              text: 'Check Your Email To Reset Your Password',
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginBackGround(),
              ),
            );
          } else if (state is ErrorRestPasswordState) {
            toastMessage(
              state: ToastStates.ERROR,
              text: state.error,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const TextImageForgotpass(),
                      CustomTextField(
                        valeditor: (val) {
                          if (val!.isEmpty) {
                            return 'Enter Your Email';
                          }
                          return null;
                        },
                        text: 'Email Address',
                        controller: AppCubit.get(context).emailController,
                        colorSideEnableBorder: Colors.grey,
                        colorSideFocusedBorder: Colors.grey,
                        textAlign: TextAlign.start,
                        sizePadding: 18,
                        prefix: const Icon(
                          Icons.lock,
                          size: 30,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 130),
                      state is LodingRestPasswordState
                          ? const Center(child: CircularProgressIndicator())
                          : CustomTextButton(
                              width: double.infinity,
                              colorText: Colors.black87,
                              text: 'Send Reset Password Link',
                              onpressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await AppCubit.get(context)
                                      .resetPasswordWithLink();
                                }
                              },
                              colorBorder: Colors.black54,
                              colorContainer: Colors.white54,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
