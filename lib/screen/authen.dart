import 'package:flutter/material.dart';
import 'package:puretonyapp/screen/create_new_account.dart';
import 'package:puretonyapp/utility/my_constant.dart';
import 'package:puretonyapp/widgets/show_button.dart';
import 'package:puretonyapp/widgets/show_form.dart';
import 'package:puretonyapp/widgets/show_images.dart';
import 'package:puretonyapp/widgets/show_text.dart';
import 'package:puretonyapp/widgets/show_text_button.dart';
import 'package:puretonyapp/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;
  bool? remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxConstrains) {
          return SingleChildScrollView(
            child: Column(
              children: [
                love_logo(boxConstraints: boxConstrains),
                new_app_name(),
                const ShowTitle(title: 'Email'),
                newemail(),
                const ShowTitle(title: 'Password'),
                newPassword(),
                newRemember(context),
                ButtonSignin(boxConstrains),
                newforgot(),
                newSignup(),

              ],
            ),
          );
        }),
      ),
    );
  }

  Row newSignup() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowText(label: "Don't Have an Account?"),
                  ShowTextButton(label: 'Sign Up', pressFunc: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNewAccount(),));
                  }),
                ],
              );
  }

  ShowTextButton newforgot() =>
      ShowTextButton(label: 'Forgot the Passwor?', pressFunc: () {});

  Container ButtonSignin(BoxConstraints boxConstrains) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: boxConstrains.maxWidth,
      child: ShowButton(
        label: 'Sign In',
        pressFunc: () {},
      ),
    );
  }

  Theme newRemember(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: MyConstant.primary,
        ),
        child: CheckboxListTile(
            activeColor: MyConstant.primary,
            controlAffinity: ListTileControlAffinity.leading,
            title: ShowText(
              label: 'Remember me',
              textStyle: MyConstant().h3ActiveStyle(),
            ),
            value: remember,
            onChanged: (value) {
              setState(() {
                remember = value;
              });
            }));
  }

  ShowForm newPassword() {
    return ShowForm(
      hide: 'Password',
      obsecu: redEye,
      redEyeFunc: () {
        setState(() {
          redEye = !redEye;
        });
      },
    );
  }

  ShowForm newemail() {
    return ShowForm(
      hide: 'Email',
    );
  }

  ShowText new_app_name() {
    return ShowText(
      label: "Les't Sign You In",
      textStyle: MyConstant().h1Style(),
    );
  }

  Container love_logo({required BoxConstraints boxConstraints}) {
    return Container(
        margin: const EdgeInsets.only(top: 32, bottom: 8),
        width: boxConstraints.maxWidth * 0.35,
        child: ShowImage(
          path: 'images/iconlove1.png',
        ));
  }
}
