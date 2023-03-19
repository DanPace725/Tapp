import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'models/task.dart';

import 'screens/home_page.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://rqfaxzgokyylytcfauxq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJxZmF4emdva3l5bHl0Y2ZhdXhxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzg4NTU2NjQsImV4cCI6MTk5NDQzMTY2NH0.75Tfqd_BwMhvSXWSPLGqSDO4b3oQjnpi5Vo07kXWhQA', // Set your supabase anon key here (optional)
  );

  // Get a reference to your Supabase Client
  final supabase = Supabase.instance.client;

  runApp(TappApp(supabase: supabase));
}

class TappApp extends StatelessWidget {
  final SupabaseClient supabase;
  const TappApp({Key? key, required this.supabase}) : super(key: key);
  // const TappApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tapp',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        },
      );
  }
}  
