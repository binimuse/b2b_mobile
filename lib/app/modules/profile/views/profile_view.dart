import 'package:b2b_mobile/app/modules/profile/views/editprofile.dart';
import 'package:b2b_mobile/app/modules/profile/views/profile_menu.dart';
import 'package:b2b_mobile/app/modules/profile/views/profile_pic.dart';
import 'package:b2b_mobile/app/modules/profile/views/setting.dart';
import 'package:b2b_mobile/components/coustom_bottom_nav_bar.dart';
import 'package:b2b_mobile/constant/enums.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfilePage())),
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingsFourPage())),
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
