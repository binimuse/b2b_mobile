// ignore_for_file: invalid_use_of_protected_member

import 'package:b2b_mobile/app/routes/app_pages.dart';
import 'package:b2b_mobile/components/custom_surfix_icon.dart';
import 'package:b2b_mobile/components/default_button.dart';
import 'package:b2b_mobile/components/form_error.dart';
import 'package:b2b_mobile/components/socal_card.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
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
                    SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                    Text("Register Account", style: headingStyle),
                    const Text(
                      "Complete your details or continue \nwith social media",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    Obx(() => controller.loading.value != true
                        ? const Center(child: CircularProgressIndicator())
                        : Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                buildEmailFormField(),
                                SizedBox(
                                    height: getProportionateScreenHeight(30)),
                                buildPasswordFormField(),
                                SizedBox(
                                    height: getProportionateScreenHeight(30)),
                                buildConformPassFormField(),
                                FormError(errors: controller.errors.value),
                                SizedBox(
                                    height: getProportionateScreenHeight(40)),
                                DefaultButton(
                                  text: "Continue",
                                  press: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.formKey.currentState!.save();
                                      // if all are valid then go to success screen
                                      // Navigator.pushNamed(
                                      //     context, CompleteProfileScreen.routeName);

                                      Get.toNamed(Routes.HOME);
                                    }
                                  },
                                ),
                              ],
                            ),
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
                    Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => controller.conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeError(error: kPassNullError);
        } else if (value.isNotEmpty &&
            controller.password == controller.conform_password) {
          controller.removeError(error: kMatchPassError);
        }
        controller.conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kPassNullError);
          return "";
        } else if ((controller.password != value)) {
          controller.addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => controller.password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          controller.removeError(error: kShortPassError);
        }
        controller.password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          controller.addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => controller.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          controller.removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          controller.removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          controller.addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          controller.addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
