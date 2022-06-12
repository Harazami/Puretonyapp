import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:puretonyapp/utility/my_constant.dart';
import 'package:puretonyapp/widgets/show_form.dart';
import 'package:puretonyapp/widgets/show_icon_button.dart';
import 'package:puretonyapp/widgets/show_images.dart';
import 'package:puretonyapp/widgets/show_text.dart';
import 'package:puretonyapp/widgets/show_title.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  var genders = <String>[
    'Male',
    'Female',
    'Other',
  ];
  String? gender;

  @override
  void initState() {
    super.initState();
    findPositions();
    
  }

  Future<void> findPositions() async {

    bool locationServiceEnable;
    LocationPermission locationPermission;

    locationServiceEnable = await Geolocator.isLocationServiceEnabled();

    if (!locationServiceEnable) {
      // If service Unenabled
      print('If Service Unenabled');
    } else {
      // if Service enabled
      print('if Service enabled');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.myWhite,
      appBar: AppBar(
        title: ShowText(
          label: 'Fill Your Profile',
          textStyle: MyConstant().h2Style(),
        ),
        foregroundColor: MyConstant.primary,
        elevation: 0,
        backgroundColor: MyConstant.myWhite,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return ListView(
          children: [
            newAvatar(boxConstraints),
            const ShowTitle(
              title: 'Full Name',
              subTitle: '*',
            ),
            ShowForm(hide: 'Full name'),
            const ShowTitle(
              title: 'Email',
              subTitle: '*',
            ),
            ShowForm(
              hide: 'Email',
              iconData: Icons.email,
            ),
            const ShowTitle(
              title: 'Phone',
              subTitle: '*',
            ),
            ShowForm(
              hide: 'Phone number',
              iconData: Icons.phone,
            ),
            const ShowTitle(
              title: 'Gender',
              subTitle: '*',
            ),
            newGender(),
            const ShowTitle(title: 'Show Location', subTitle: '*',),
            ShowText(label: 'lat = 123.456, lng = 123.456'),
          ],
        );
      }),
    );
  }

  Container newGender() {
    return Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(30)),
            child: DropdownButton<dynamic>(isExpanded: true,
              underline: const SizedBox(),
              hint: ShowText(label: 'Please Choose Gender'),
              value: gender,
              items: genders
                  .map(
                    (e) => DropdownMenuItem(
                      child: ShowText(label: e),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
          );
  }

  Row newAvatar(BoxConstraints boxConstraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: boxConstraints.maxWidth * 0.4,
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ShowImage(path: 'images/account.png'),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: ShowIconButton(
                        iconData: Icons.cameraswitch, pressFunc: () {}))
              ],
            )),
      ],
    );
  }
}
