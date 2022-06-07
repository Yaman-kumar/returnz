import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/connection_page_controller.dart';

class ConnectionPageView extends GetView<ConnectionPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConnectionPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ConnectionPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
