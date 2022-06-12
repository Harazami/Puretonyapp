import 'package:flutter/material.dart';
import 'package:puretonyapp/utility/my_constant.dart';
import 'package:puretonyapp/widgets/show_form.dart';
import 'package:puretonyapp/widgets/show_images.dart';
import 'package:puretonyapp/widgets/show_text.dart';
import 'package:puretonyapp/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            love_logo(),
            new_app_name(),
            ShowTitle(title: 'Email'),
            ShowForm(
              hide: 'Email',
            ),
            ShowTitle(title: 'Password'),
            ShowForm(
              hide: 'Password',
              obsecu: redEye,
              redEyeFunc: () {
                setState(() {
                  redEye = !redEye;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  ShowText new_app_name() {
    return ShowText(
      label: "Les't Sign You In",
      textStyle: MyConstant().h1Style(),
    );
  }

  SizedBox love_logo() {
    return SizedBox(
        width: 200,
        child: ShowImage(
          path: 'images/iconlove1.png',
        ));
  }
}
