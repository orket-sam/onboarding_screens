import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_app/increasing_text.dart';
import 'package:onboarding_app/indicator_widget.dart';
import 'package:onboarding_app/onboarding_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => OnboardingProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
    );
  }
}

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Consumer<OnboardingProvider>(builder: (
                context,
                prov,
                child,
              ) {
                return PageView(
                  controller: prov.pageController,
                  onPageChanged: (value) => prov.setIndex(value),
                  children: [
                    Image.asset(
                      'assets/a.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset('assets/b.jpg'),
                    Image.asset('assets/c.jpg'),
                  ],
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Spacer(),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (e) => IndicatorWidget(
                      index: e,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) =>
                            const IncreasingText(value: 200000)));
                  },
                  child: const Text('Skip'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
