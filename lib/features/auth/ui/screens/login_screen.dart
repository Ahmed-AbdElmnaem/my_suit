import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/routing/routes.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_button.dart';
import 'package:my_suit/core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: formKey,
            child: AnimationLimiter(
              child: ListView(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 700),
                  delay: const Duration(milliseconds: 200),
                  childAnimationBuilder:
                      (widget) => SlideAnimation(
                        horizontalOffset: 50.0,
                        curve: Curves.easeOut,
                        child: FadeInAnimation(child: widget),
                      ),
                  children: [
                    60.0.height,
                    Center(
                      child: Image.asset(
                        "assets/images/png/logo.png",
                        width: 170.w,
                        height: 170.h,
                      ),
                    ),
                    30.0.height,
                    Text(
                      LocaleKeys.welcome_back.tr(),
                      style: Styles.font24W600.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    10.0.height,
                    Text(
                      LocaleKeys.login_to_your_account.tr(),
                      style: Styles.font16W400.copyWith(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    40.0.height,
                    AppTextFormField(
                      suffixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      controller: emailController,
                      hintText: LocaleKeys.email_hint.tr(),
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          (value) =>
                              value!.isEmpty
                                  ? LocaleKeys.email_validator.tr()
                                  : null,
                    ),
                    20.0.height,
                    AppTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obsecureText: true,
                      controller: passwordController,
                      hintText: LocaleKeys.password_hint.tr(),
                      validator:
                          (value) =>
                              value!.isEmpty
                                  ? LocaleKeys.password_validator.tr()
                                  : null,
                    ),
                    10.0.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // رايح لنسيت كلمة المرور
                        },
                        child: Text(
                          LocaleKeys.forgot_password.tr(),
                          style: Styles.font14W400.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    30.0.height,
                    CustomButton(
                      text: LocaleKeys.login.tr(),
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {

                        // }
                        context.pushNamed(Routes.layout);
                      },
                    ),
                    20.0.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.no_account.tr(),
                          style: Styles.font14W400.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(Routes.register);
                          },
                          child: Text(
                            LocaleKeys.register_now.tr(),
                            style: Styles.font14W400.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.0.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
