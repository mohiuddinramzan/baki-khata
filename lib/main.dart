import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_strings.dart';
import 'core/constants/app_theme.dart';
import 'core/routing/app_router.dart';

void main() {
  runApp(const BakiKhataApp());
}

class BakiKhataApp extends StatelessWidget {
  const BakiKhataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Phase 1+ থেকে CustomerProvider, TransactionProvider, DashboardProvider
      // ইত্যাদি এখানে যোগ হবে। এখন কাঠামো প্রস্তুত রাখা হলো।
      providers: const [],
      child: MaterialApp.router(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
