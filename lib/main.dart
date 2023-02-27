import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const TappApp());
}

class TappApp extends StatelessWidget {
  const TappApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Demo';
  static const Color darkGrey = Color.fromRGBO(169, 169, 169, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(background: darkGrey)
      ),
      home: const SplashPage(title: 'Splash Page'),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      _animationController.reverse();
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Provider.of<NavigatorState>(context, listen: false).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TappApp.darkGrey,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const Text(
            "Tapp",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tapp"),
      ),
      body: const Center(
        child: Text("Hello World"),
      ),
    );
  }
}
