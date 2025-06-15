import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_button.dart';
import 'package:my_suit/core/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: formKey,
            child: AnimatedBuilder(
              animation: _controller,
              builder:
                  (context, child) => Opacity(
                    opacity: _fadeAnimation.value,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: ListView(
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
                            "إنشاء حساب جديد",
                            style: Styles.font24W600.copyWith(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          10.0.height,
                          Text(
                            "املأ البيانات لإنشاء حسابك",
                            style: Styles.font16W400.copyWith(
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          40.0.height,

                          /// Name
                          AppTextFormField(
                            controller: nameController,
                            hintText: "الاسم الكامل",
                            keyboardType: TextInputType.name,
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? "من فضلك أدخل اسمك الكامل"
                                        : null,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          20.0.height,

                          /// Email
                          AppTextFormField(
                            controller: emailController,
                            hintText: "البريد الإلكتروني",
                            keyboardType: TextInputType.emailAddress,
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? "من فضلك أدخل بريدك الإلكتروني"
                                        : null,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                          ),
                          20.0.height,

                          /// Password
                          AppTextFormField(
                            controller: passwordController,
                            hintText: "كلمة المرور",
                            obsecureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? "من فضلك أدخل كلمة المرور"
                                        : null,
                          ),
                          20.0.height,

                          /// Confirm Password
                          AppTextFormField(
                            controller: confirmPasswordController,
                            hintText: "تأكيد كلمة المرور",
                            obsecureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "من فضلك أدخل تأكيد كلمة المرور";
                              } else if (value != passwordController.text) {
                                return "كلمتا المرور غير متطابقتين";
                              }
                              return null;
                            },
                          ),
                          30.0.height,

                          /// Register Button
                          CustomButton(
                            text: "إنشاء الحساب",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // Logic التسجيل
                              }
                            },
                          ),
                          20.0.height,

                          /// Already Have Account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "عندك حساب؟",
                                style: Styles.font14W400.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(
                                  "سجل الدخول",
                                  style: Styles.font14W400.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
