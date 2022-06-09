// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:b2b_mobile/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:b2b_mobile/components/default_button.dart';
import 'package:b2b_mobile/components/top_rounded_container.dart';
import 'package:b2b_mobile/constant/constants.dart';
import 'package:b2b_mobile/constant/global_style.dart';
import 'package:b2b_mobile/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TopUpPage extends GetView<WalletController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: GlobalStyle.appBarIconThemeColor,
        ),
        elevation: GlobalStyle.appBarElevation,
        title: Text(
          'Top Up',
          style: GlobalStyle.appBarTitle,
        ),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
        bottom: controller.reusableWidget.bottomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildComposer(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      constraints:
                          const BoxConstraints(minHeight: 80, maxHeight: 160),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 0, bottom: 0),
                        child: TextFormField(
                          maxLines: null,
                          onChanged: (String txt) {},
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          cursorColor: Colors.orange,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Enter your transaction reference number'),
                          // validator: (value) {
                          //   return walletContoller.validateName(value!);
                          // },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      constraints:
                          const BoxConstraints(minHeight: 80, maxHeight: 160),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 0, bottom: 0),
                        child: TextFormField(
                          maxLines: null,
                          onChanged: (String txt) {},
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          cursorColor: Colors.orange,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter the amount'),
                          // validator: (value) {
                          //   return walletContoller.validateName(value!);
                          // },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TopRoundedContainer(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.15,
                      right: SizeConfig.screenWidth * 0.15,
                      bottom: getProportionateScreenWidth(40),
                      top: getProportionateScreenWidth(15),
                    ),
                    child: DefaultButton(
                      text: "Submit",
                      press: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposer(BuildContext context) {
    return Obx(() => controller.loadingnew.value != true
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPicker(context);
                    },
                    child: controller.selectedImagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.file(
                                File(controller.selectedImagePath.value),
                                width: 200,
                                height: 205,
                                fit: BoxFit.contain),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 200,
                            height: 220,
                            child: Icon(
                              Icons.file_upload_sharp,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showPicker(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text("Upload your bank slip",
                          style: TextStyle(color: kPrimaryColor)),
                    ),
                  ),
                ],
              ),
            ),
          ));
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      controller.getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                      // _showAlertDialog(context);
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    controller.getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
