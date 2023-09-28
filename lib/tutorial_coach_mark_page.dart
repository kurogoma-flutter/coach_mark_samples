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
  List<TargetFocus> targets = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      createTarget();
      showTutorial(context);
    });
    super.initState();
  }

  void createTarget() {
    targets.add(
      createTargetFocus(
        message: 'あなたへのヘルスコアです！\n100点満点で、各項目の目標を達成すると\nスコアが上がっていきます！',
        key: _one,
      ),
    );
    targets.add(
      createTargetFocus(
        message:
            'AIパーソナルトレーナーからの\nアドバイスを受け取ることができます！\nあなたのスコアに応じてお伝えするので\nぜひこまめにチェックしてみてください！',
        key: _two,
      ),
    );
    targets.add(
      createTargetFocus(
        message: 'スコアの日／週を\n切り替えることができます。',
        key: _three,
        leftSpacer: true,
      ),
    );
  }

  TargetFocus createTargetFocus({
    required String message,
    required GlobalKey key,
    bool leftSpacer = false,
  }) {
    return TargetFocus(
      keyTarget: key,
      identify: key.toString(),
      paddingFocus: 16,
      radius: 16,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  leftSpacer ? const Spacer() : const SizedBox.shrink(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tutorialCoachMark.next();
                        },
                        child: const Text('次へ'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
      shape: ShapeLightFocus.RRect,
    );
  }

  void showTutorial(BuildContext context) {
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      textSkip: "",
      showSkipInLastTarget: false,
      alignSkip: Alignment.bottomCenter,
      paddingFocus: 0,
      opacityShadow: 0.8,
      pulseEnable: false,
      focusAnimationDuration: Duration.zero,
      unFocusAnimationDuration: Duration.zero,
      onClickTarget: null,
      onClickOverlay: null,
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
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    key: _two,
                    radius: 30,
                    child: const Icon(Icons.person),
                  ),
                  SizedBox(
                    key: _three,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('item'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('item'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                key: _one,
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEALTH SCORE',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '68',
                      style: TextStyle(fontSize: 60),
                    ),
                    Text(
                      '/100',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
