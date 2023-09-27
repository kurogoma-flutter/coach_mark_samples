import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

final GlobalKey _one = GlobalKey();
final GlobalKey _two = GlobalKey();
final GlobalKey _three = GlobalKey();

class TutorialCoachMarkPage extends StatefulWidget {
  const TutorialCoachMarkPage({super.key});

  @override
  State<TutorialCoachMarkPage> createState() => _TutorialCoachMarkPageState();
}

class _TutorialCoachMarkPageState extends State<TutorialCoachMarkPage> {
  late TutorialCoachMark tutorialCoachMark;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showTutorial(context);
    });
    super.initState();
  }

  void showTutorial(BuildContext context) {
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      textSkip: "SKIP",
      alignSkip: Alignment.bottomCenter,
      paddingFocus: 10,
      opacityShadow: 0.8,
      pulseEnable: false,
      focusAnimationDuration: const Duration(milliseconds: 300),
      unFocusAnimationDuration: const Duration(milliseconds: 300),
      onClickTarget: (target) {
        print('onClickTarget');
      },
      onClickOverlay: (target) {
        print('onClickOverlay');
        // 次へ
        tutorialCoachMark.next();
      },
      onFinish: () {
        print('onFinish');
      },
      onSkip: () {},
    );
    tutorialCoachMark.show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TutorialCoachMark'),
        actions: [
          SizedBox(
            key: _one,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          key: _two,
          child: const Icon(
            Icons.star,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: _three,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

final List<TargetFocus> targets = [
  TargetFocus(
    identify: "Target 1",
    keyTarget: _one,
    enableOverlayTab: true,
    contents: [
      TargetContent(
        child: const Text(
          "サンプルテキスト",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      )
    ],
    shape: ShapeLightFocus.Circle,
  ),
  TargetFocus(
    keyTarget: _two,
    identify: "target 2",
    enableOverlayTab: true,
    contents: [
      TargetContent(
        customPosition: CustomTargetContentPosition(
          bottom: 100,
          left: 200,
        ),
        child: const Text(
          "真ん中のボタン",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        align: ContentAlign.top,
      ),
    ],
  ),
  TargetFocus(
    keyTarget: _three,
    identify: "target 3",
    enableOverlayTab: true,
    contents: [
      TargetContent(
        child: const Text(
          "左下のボタン",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        align: ContentAlign.left,
      ),
    ],
  ),
];
