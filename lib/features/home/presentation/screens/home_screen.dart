import 'package:demo_flutter/common/util/AppLog.dart';
import 'package:demo_flutter/features/user/presentation/screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../qrcode/presentation/mobile_scanner_overlay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  // lay data lam trung tam

  final String title;

  @override
  State<HomeScreen> createState() {
    print('Initialization: create state');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState() {
    print('INITIALIZATION: constructor, mounted: $mounted');
    AppLog.e("Minh", "Error");
    AppLog.d("Minh", "Debug");
    AppLog.w("Minh", "Warning");
    AppLog.i("Minh", "Info");
  }

  @override
  void initState() {
    super.initState();
    print('INITIALIZATION: initState, mounted: $mounted');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('UPDATE: didChangeDependencies, mounted: $mounted');
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD: build, mounted: $mounted');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'This is home page Minh',
              ),
            ),
            SizedBox(
                child: TextButton(
                    onPressed: () {
                      Get.to(const UserListScreen(),
                          arguments: "Data received from first screen");
                    },
                    child: const Text("Example Demo User List"))),
            SizedBox(
              child: TextButton(
                onPressed: () {
                  Get.to(const BarcodeScannerWithOverlay());
                },
                child: const Text("Camera QR code"),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void reassemble() {
    print('BUILD HOT RELOAD: reassemble, mounted: $mounted');
    super.reassemble();
  }

  @override
  void setState(VoidCallback fn) {
    print('UPDATE: setState');
    super.setState(fn);
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('UPDATE: didUpdateWidget()');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('DESTRUCTION: deactivate, mounted: $mounted');
  }

  @override
  void dispose() {
    super.dispose();
    print('DESTRUCTION: dispose, mounted: $mounted');
  }

  void navigateTo(Widget screen) {
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
