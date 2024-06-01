import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 35),
        padding: const EdgeInsets.all(10.0),
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              titleWidget: const Text(
                'Easy Payment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              body:
                  'Business-to-Consumer This is the most common form of e-commerce. Businesses sell products or services directly to consumers.',
              image: Center(
                child: Image.asset(
                  'images/boarding/image_1.png',
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            PageViewModel(
              titleWidget: const Text(
                'Low Cost Delivery',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              body:
                  'The style of a businesswoman plays a significant role in creating a professional image, conveying confidence',
              image: Image.asset(
                'images/boarding/image_2.png',
                height: 250,
                width: 250,
              ),
            ),
            PageViewModel(
              titleWidget: const Text(
                'You Will Never Get ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              body:
                  'In the rapidly evolving world of e-commerce, intelligence plays a crucial role in achieving success. Intelligent e-commerce involves leveraging advanced technologies, data analytics, and strategic planning',
              image: Image.asset(
                'images/boarding/image_3.gif',
                height: 250,
                width: 250,
              ),
            ),
          ],
          onDone: () {
            final box = GetStorage();
            box.write('hasSeenOnboarding', true);
            Navigator.pushReplacementNamed(context, 'login');
          },
          onSkip: () {
            final box = GetStorage();
            box.write('hasSeenOnboarding', true);
            Navigator.pushReplacementNamed(context, 'login');
          },
          showSkipButton: true,
          skip: Text(
            "SKIP",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kprimarayColor,
            ),
          ),
          next: Icon(
            Icons.arrow_forward,
            color: kprimarayColor,
          ),
          done: Text(
            "DONE",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kprimarayColor,
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: Size.square(10.0),
            activeSize: Size(20.0, 10.0),
            color: Colors.black26,
            activeColor: kprimarayColor,
            spacing: EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
