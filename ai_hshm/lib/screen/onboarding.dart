import 'package:ai_hshm/helper/global.dart';
import 'package:ai_hshm/main.dart';
import 'package:ai_hshm/model/onboard.dart';
import 'package:ai_hshm/screen/home_screen.dart';
import 'package:ai_hshm/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      Onboard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your Best Friend & You can ask me anything & I will help you!',
          lottie: 'ai_ask_me'),

      //onboarding 2
      Onboard(
        title: 'Imagination to Reality',
        lottie: 'ai_play',
        subtitle:
            'Just Imagine anything & let me know, I will create something wonderful for you!',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;

          return Column(
            children: [
              //lottie
              Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                  height: nq.height * .6, width: isLast ? nq.width * .7 : null),

              //title
              Text(
                list[ind].title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5),
              ),

              //for adding some space
              SizedBox(height: nq.height * .015),

              //subtitle
              SizedBox(
                width: nq.width * .7,
                child: Text(list[ind].subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: .5,
                        color: Theme.of(context).lightTextColor)),
              ),

              const Spacer(),

              //dots

              Wrap(
                spacing: 10,
                children: List.generate(
                    list.length,
                    (i) => Container(
                          width: i == ind ? 15 : 10,
                          height: 8,
                          decoration: BoxDecoration(
                              color: i == ind ? Colors.blue : Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        )),
              ),

              const Spacer(),

              //button
              CustomBtn(
                  onTap: () {
                    if (isLast) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const HomeScreen()));
                      // Get.off(() => const HomeScreen());
                    } else {
                      c.nextPage(
                          duration: Duration(microseconds: 600),
                          curve: Curves.ease);
                    }
                  },
                  text: (isLast ? 'Finish' : 'Next')),

              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
