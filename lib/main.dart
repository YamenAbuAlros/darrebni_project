import 'package:flutter/material.dart';
import 'package:template/app/my_app.dart';
import 'package:template/app/my_app_controller.dart';
import 'package:template/core/data/repositories/shared_preference_repositories.dart';
import 'package:template/core/services/connectivity_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  //*  -- Add To Dependency Injection --
  Get.put(SharedPreferenceRepositories());
  Get.put(ConnectivityService());
  Get.put(MyAppController()); 
  
  runApp(const MyApp());
}
