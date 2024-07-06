import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testik/app/routes/app_pages.dart';

import '../controllers/razrab_controller.dart';

class RazrabView extends GetView<RazrabController> {
  const RazrabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 218, 157),
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey,
        backgroundColor: const Color.fromARGB(255, 255, 206, 148),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 32,
            shadows: [
              Shadow(
                blurRadius: 3.0,
                color: Colors.grey,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          onPressed: () {
            Get.toNamed(Routes.MAIN);
          },
        ),
        flexibleSpace: Center(
          child: Image.asset(
            'assets/images/yar.png',
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'developers: pspu Team',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
