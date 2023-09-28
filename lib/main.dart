import 'package:coach_mark_samples/showcaseview_page.dart';
import 'package:coach_mark_samples/tutorial_coach_mark_page.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return ShowCaseWidget(
                        builder: Builder(
                          builder: (context) => const ShowcaseviewPage(),
                        ),
                        disableBarrierInteraction: true,
                        disableMovingAnimation: true,
                        disableScaleAnimation: true,
                      );
                    },
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'showcaseview',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const TutorialCoachMarkPage();
                    },
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'tutorial_coach_mark',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
