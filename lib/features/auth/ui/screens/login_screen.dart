import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_suit/core/helpers/extensions.dart';
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
                      "مرحبًا بعودتك!",
                      style: Styles.font24W600.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    10.0.height,
                    Text(
                      "سجل دخولك إلى حسابك",
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
                      hintText: "البريد الإلكتروني",
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          (value) =>
                              value!.isEmpty
                                  ? "من فضلك أدخل بريدك الإلكتروني"
                                  : null,
                    ),
                    20.0.height,
                    AppTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obsecureText: true,
                      controller: passwordController,
                      hintText: "كلمة المرور",
                      validator:
                          (value) =>
                              value!.isEmpty
                                  ? "من فضلك أدخل كلمة المرور"
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
                          "نسيت كلمة السر؟",
                          style: Styles.font14W400.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    30.0.height,
                    CustomButton(
                      text: "تسجيل الدخول",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
                    20.0.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ما عندكش حساب؟",
                          style: Styles.font14W400.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(Routes.register);
                          },
                          child: Text(
                            "سجّل الآن",
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
