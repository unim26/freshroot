import 'package:flutter/material.dart';
import 'package:freshroot/data/data_service/data_services.dart';
import 'package:freshroot/pages/onboarding_page.dart';
import 'package:freshroot/providers/button_data_provider.dart';
import 'package:freshroot/providers/page_index_provider.dart';
import 'package:freshroot/providers/vege_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => VegeProvider(
            DataServices(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PageIndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ButtonDataProvider(),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // @override
  @override
  void initState() {
    context.read<VegeProvider>().getVegis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
