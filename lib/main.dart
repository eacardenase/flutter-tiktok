import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:tiktok/config/theme/app_theme.dart';
import 'package:tiktok/presentation/providers/discover_provider.dart';
import 'package:tiktok/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider()),
      ],
      child: MaterialApp(
        title: 'Tiktok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
