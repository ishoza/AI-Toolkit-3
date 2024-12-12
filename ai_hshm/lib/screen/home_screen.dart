import 'package:ai_hshm/apis/apis.dart';
import 'package:ai_hshm/helper/global.dart';
import 'package:ai_hshm/helper/pref.dart';
import 'package:ai_hshm/model/home_type.dart';
import 'package:ai_hshm/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isDarkMode = Pref.isDarkMode.obs;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    nq = MediaQuery.sizeOf(context);

    APIs.getAnswer('hii');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Assistant',
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 10),
              onPressed: () {
                Get.changeThemeMode(
                    _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);

                _isDarkMode.value = !_isDarkMode.value;
                Pref.isDarkMode = _isDarkMode.value;
              },
              icon: Obx(() => Icon(
                    _isDarkMode.value
                        ? Icons.brightness_2_rounded
                        : Icons.brightness_5_rounded,
                    size: 28,
                  ))),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: nq.width * .04, vertical: nq.height * .015),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
    );
  }
}
