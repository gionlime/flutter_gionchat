import 'package:get/get.dart';

/**
 * Copyright (C), 2015-2021, suntront
 * FileName: MainController
 * Author: Jeek
 * Date: 2021/4/6
 * Description:
 */
class MainController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
