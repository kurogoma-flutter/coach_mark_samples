import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

final GlobalKey _one = GlobalKey();

class ShowcaseviewPage extends StatefulWidget {
  const ShowcaseviewPage({super.key});

  @override
  State<ShowcaseviewPage> createState() => _ShowcaseviewPageState();
}

class _ShowcaseviewPageState extends State<ShowcaseviewPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase(
        [_one],
      );
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ShowCaseItem(
              itemKey: _one,
              container: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 14),
                        child: Text(
                          'あなたへのヘルスコアです！\n100点満点で、各項目の目標を達成すると\nスコアが上がっていきます！',
                          style: TextStyle(color: Colors.white),
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
        ),
      ),
    );
  }
}

class ShowCaseItem extends StatelessWidget {
  const ShowCaseItem({
    super.key,
    required this.itemKey,
    required this.container,
    required this.child,
    this.position = TooltipPosition.bottom,
  });

  final GlobalKey itemKey;

  final Widget container;
  final Widget child;

  final TooltipPosition position;

  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      key: itemKey,
      height: 300,
      width: 200,
      targetPadding: const EdgeInsets.all(4),
      tooltipPosition: position,
      container: container,
      disableMovingAnimation: true,
      child: child,
    );
  }
}



// return Scaffold(
//       appBar: AppBar(
//         title: const Text('Showcaseview'),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.menu),
        //   ),
        // ],
//       ),
//       body: const Center(
//         child: Icon(Icons.star),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//     );