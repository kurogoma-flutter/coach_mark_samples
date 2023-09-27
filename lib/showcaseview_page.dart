import 'package:bubble/bubble.dart';
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
      ShowCaseWidget.of(context).startShowCase(
        [_one, _two, _three],
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
          ShowCaseItem(
            itemKey: _one,
            message: '右上のボタン',
            width: 150,
            nip: BubbleNip.rightTop,
            position: TooltipPosition.bottom,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
      ),
      body: Center(
        child: ShowCaseItem(
          itemKey: _two,
          message: '真ん中のボタン',
          nip: BubbleNip.no,
          child: const Icon(Icons.star),
        ),
      ),
      floatingActionButton: ShowCaseItem(
        itemKey: _three,
        width: 160,
        message: '右下のボタン',
        nip: BubbleNip.rightBottom,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ShowCaseItem extends StatelessWidget {
  const ShowCaseItem({
    super.key,
    required this.itemKey,
    required this.message,
    required this.child,
    this.height = 80,
    this.width = 110,
    this.nip = BubbleNip.rightCenter,
    this.position = TooltipPosition.top,
  });

  final GlobalKey itemKey;

  final String message;
  final Widget child;
  final double height;
  final double width;
  final BubbleNip nip;
  final TooltipPosition position;

  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      key: itemKey,
      height: height,
      width: width,
      targetPadding: const EdgeInsets.all(4),
      tooltipPosition: position,
      container: Bubble(
        showNip: true,
        nip: nip,
        child: Text(message),
      ),
      disableMovingAnimation: true,
      child: child,
      onBarrierClick: () {
        print('onBarrierClick');
      },
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