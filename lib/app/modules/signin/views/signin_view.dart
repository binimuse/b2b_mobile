import 'package:b2b_mobile/app/routes/app_pages.dart';
import 'package:b2b_mobile/components/custom_surfix_icon.dart';
import 'package:b2b_mobile/components/default_button.dart';
import 'package:b2b_mobile/components/form_error.dart';
import 'package:b2b_mobile/components/no_account_text.dart';
import 'package:b2b_mobile/components/socal_card.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:b2b_mobile/helper/keyboard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
        ),
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: controller.loginFormKey,
                      child: Column(
                        children: [
                          Obx(
                            () => controller.loading.value != true
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : TextFormField(
                                    controller: controller.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (newValue) =>
                                        controller.email = newValue,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        controller.removeError(
                                            error: kEmailNullError);
                                      }
                                      return null;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        controller.addError(
                                            error: kEmailNullError);
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Email",
                                      hintText: "Enter your email",
                                      // If  you are using latest version of flutter then lable text and hint text shown like this
                                      // if you r using flutter less then 1.20.* then maybe this is not working properly
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      suffixIcon: CustomSurffixIcon(
                                          svgIcon: "assets/icons/Mail.svg"),
                                    ),
                                  ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          Obx(
                            () => controller.loading.value != true
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : TextFormField(
                                    controller: controller.passwordController,
                                    obscureText: true,
                                    onSaved: (newValue) =>
                                        controller.password = newValue,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        controller.removeError(
                                            error: kPassNullError);
                                      }
                                      return null;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        controller.addError(
                                            error: kPassNullError);
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Password",
                                      hintText: "Enter your password",
                                      // If  you are using latest version of flutter then lable text and hint text shown like this
                                      // if you r using flutter less then 1.20.* then maybe this is not working properly
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      suffixIcon: CustomSurffixIcon(
                                          svgIcon: "assets/icons/Lock.svg"),
                                    ),
                                  ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          Row(
                            children: [
                              SizedBox(height: 50),
                              Spacer(),
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.FORGOTPASSWORD),
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                          Obx(() => controller.loading.value != true
                              ? const Center(child: CircularProgressIndicator())
                              : FormError(errors: controller.errors.value)),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          Obx(
                            () => controller.loading.value != true
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : DefaultButton(
                                    text: "Continue",
                                    press: () {
                                      if (controller.loginFormKey.currentState!
                                          .validate()) {
                                        controller.loginFormKey.currentState!
                                            .save();
                                        // if all are valid then go to success screen
                                        KeyboardUtil.hideKeyboard(context);
                                        controller.signIn();
                                      }
                                    },
                                  ),
                          )
                        ],
                      )),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  NoAccountText(),
                ],
              ),
            ),
          ),
        )));
  }
}
