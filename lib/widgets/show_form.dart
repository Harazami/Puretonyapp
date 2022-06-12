// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:puretonyapp/utility/my_constant.dart';

class ShowForm extends StatelessWidget {
  final String hide;
  final bool? obsecu;
  final Function()? redEyeFunc;
  final IconData? iconData;
  const ShowForm({
    Key? key,
    required this.hide,
    this.obsecu,
    this.redEyeFunc,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        obscureText: obsecu ?? false,
        decoration: InputDecoration(
          hintText: hide,
          suffixIcon: redEyeFunc == null
              ? iconData == null  ? const SizedBox() : Icon(iconData) 
              : IconButton(
                  onPressed: redEyeFunc,
                  icon: Icon(Icons.remove_red_eye_outlined),
                ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: MyConstant.dark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: MyConstant.light),
          ),
        ),
      ),
    );
  }
}
