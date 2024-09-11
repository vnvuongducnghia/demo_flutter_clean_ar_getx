import 'package:demo_flutter/features/home/presentation/screens/home_screen_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

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
    return HomeScreenWidget();
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
