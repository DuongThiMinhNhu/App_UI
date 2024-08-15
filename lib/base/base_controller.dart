import 'dart:async';
import 'package:app_ui/core/constants/constants.dart';
import 'package:app_ui/core/network/controller/network_controller.dart';
import 'package:app_ui/core/network/managers/network_manager.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController with NetworkManager {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _networkController = Get.find<NetworkController>();
  var _hasNetwork = true;
  StreamSubscription? _connectivitySubscription;
  RxString chooseAddress = ''.obs;
  final Connectivity _connectivity = Connectivity();
  @override
  Future<void> onInit() async {
    super.onInit();
    await checkConnectNetwork();
  }

  Future<void> checkConnectNetwork() async {
    // Check Network
    if (_networkController.connectionStatus.value == 0) {
      _hasNetwork = false;
      await callDialogErrorNetwork();
    }
    _networkController.connectionStatus.listen((status) {
      if (status == 0) {
        _hasNetwork = false;
        callDialogErrorNetwork();
      } else {
        _hasNetwork = true;
      }
    });
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<void> callDialogErrorNetwork() async {
  }

  // Future<void> doShowDialog(CommonDialogRequest dialogRequest) async {
  //   final locator = Get.find<DialogService>();
  //   final dialogResult = await locator.showDialog(dialogRequest);

  //   if (dialogResult.confirmed) {
  //     await _handleEventDialog(dialogRequest.defineEvent);
  //   } else {
  //   }
  // }
  Future<void> _handleEventDialog(String? defineEvent) async {
    switch (defineEvent) {
      case NO_CONNECT_NETWORK:
        if (_hasNetwork == false) {
          // printConsole(
          //     '${_networkController.connectionStatus.value}+++++!@#!@#@!++++');
          // await callDialogErrorNetwork();
        }
        break;
      default:
        break;
    }
  }
}
