import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

final GlobalKey _one = GlobalKey();
final GlobalKey _two = GlobalKey();
final GlobalKey _three = GlobalKey();

class ShowcaseviewPage extends StatefulWidget {
  const ShowcaseviewPage({super.key});

  @override
  State<ShowcaseviewPage> createState() => _ShowcaseviewPageState();
}

class _ShowcaseviewPageState extends State<ShowcaseviewPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        ShowCaseWidget.of(context).startShowCase(
          [_one, _two, _three],
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showcaseview'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
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
                  ShowCaseItem(
                    itemKey: _two,
                    width: 100,
                    containerMessage:
                        'AIパーソナルトレーナーからの\nアドバイスを受け取ることができます！\nあなたのスコアに応じてお伝えするので\nぜひこまめにチェックしてみてください！',
                    child: const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                  ),
                  ShowCaseItem(
                    itemKey: _three,
                    containerMessage: 'スコアの日／週を\n切り替えることができます。',
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ShowCaseItem(
                itemKey: _one,
                width: 200,
                containerMessage:
                    'あなたへのヘルスコアです！\n100点満点で、各項目の目標を達成すると\nスコアが上がっていきます！',
                containerAlignment: CrossAxisAlignment.start,
                containerPadding: const EdgeInsets.only(
                  left: 32,
                  top: 16,
                  bottom: 16,
                ),
                child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}

class ShowCaseItem extends StatelessWidget {
  const ShowCaseItem({
    super.key,
    required this.itemKey,
    required this.containerMessage,
    required this.child,
    this.position = TooltipPosition.bottom,
    this.height = 300,
    this.width = 200,
    this.containerAlignment = CrossAxisAlignment.start,
    this.containerPadding = const EdgeInsets.symmetric(vertical: 16),
  });

  final GlobalKey itemKey;

  final String containerMessage;
  final Widget child;
  final double height;
  final double width;
  final CrossAxisAlignment containerAlignment;
  final EdgeInsets containerPadding;

  final TooltipPosition position;

  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      key: itemKey,
      height: height,
      width: width,
      targetPadding: const EdgeInsets.all(4),
      targetBorderRadius: const BorderRadius.all(Radius.circular(16)),
      tooltipPosition: position,
      container: SizedBox(
        child: Padding(
          padding: containerPadding,
          child: Column(
            crossAxisAlignment: containerAlignment,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Text(
                  containerMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ShowCaseWidget.of(context).next();
                },
                child: const Text('次へ'),
              )
            ],
          ),
        ),
      ),
      disableMovingAnimation: true,
      child: child,
    );
  }
}
