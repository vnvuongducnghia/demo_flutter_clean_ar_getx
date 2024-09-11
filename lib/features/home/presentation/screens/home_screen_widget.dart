import 'package:demo_flutter/features/user/presentation/screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.all(8.0),
              child: Text(
                'This is home page Minh',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const UserListScreen(), arguments: "Data received from first screen");
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7), // <-- Radius
                ),
              ),
              child: const Text('Example Demo User List'),
            )
          ],
        ),
      ),
    );
  }
}
