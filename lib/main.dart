import 'package:aden_fe/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/helper/route_helper.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makanan',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 49, 191, 36)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 228, 226, 226),
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      routes: RouteHelper.routes,
      initialRoute: '/',
    );
  }
}
