import 'package:ai_hshm/helper/global.dart';
import 'package:ai_hshm/helper/pref.dart';
import 'package:ai_hshm/screen/home_screen.dart';
import 'package:ai_hshm/screen/onboarding.dart';
import 'package:ai_hshm/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      // Navigator.of(context).pushReplacement(
      // MaterialPageRoute(builder: (_) => const OnboardingScreen()
      // ));
      Get.off(() =>
          Pref.showOnboarding ? const OnboardingScreen() : OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    nq = MediaQuery.sizeOf(context);
    return Scaffold(
      //body
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            //for adding some space
            const Spacer(flex: 2),

            //logo
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(nq.width * .05),
                child: Image.asset(
                  'assets/images/chatbot.png',
                  width: nq.width * .4,
                ),
              ),
            ),

            //for adding some space
            const Spacer(),

            //lottie loading
            const CustomLoading(),

            //for adding some space
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
