
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:puretonyapp/utility/my_constant.dart';
import 'package:puretonyapp/widgets/show_images.dart';
import 'package:puretonyapp/widgets/show_text.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => IntroductionState();
}

class IntroductionState extends State<Introduction> {
  var titles = <String>[
    'Find People Who Math',
    'Easily Message & Call the',
    "Don't Wait Anymore, Find",
  ];
  var bodies = <String>[
    'With you',
    'People You Like',
    'Out Your Soulmate Now',
  ];
  var path = <String>[
    'images/intro1.png',
    'images/intro2.png',
    'images/intro3.png',
  ];

  var pageViewModels = <PageViewModel>[];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < titles.length; i++) {
      setState(() {
        pageViewModels.add(createPageViewModel(
            title: titles[i], bodies: bodies[i], path: path[i]));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IntroductionScreen(
        pages: pageViewModels,
        onDone: () {
          print('onDone Work');
          Navigator.pushNamedAndRemoveUntil(context, MyConstant.rountAuthen, (route) => false);
        },
        done: ShowText(label: 'Done', textStyle: MyConstant().h3ActiveStyle(),),
        skip: ShowText(label: 'Skip', textStyle: MyConstant().h3ActiveStyle(),),
        showSkipButton: true,
        next: ShowText(label: 'Next', textStyle: MyConstant().h3ActiveStyle(),),
        showNextButton: true,
      )),
    );
  }

  PageViewModel createPageViewModel(
      {required String title, required String bodies, required String path}) {
    return PageViewModel(
      titleWidget: ShowText(label: title, textStyle: MyConstant().h2Style(),),
      body: bodies,
      image: ShowImage(path: path),
    );
  }
}
