import 'package:go_router/go_router.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';

/// Route path সব এক জায়গায় — পরবর্তী Phase-এ পুরনো feature ভেঙে না ফেলে
/// নতুন route যোগ করার জন্য।
class AppRoutes {
  AppRoutes._();

  static const String dashboard = '/';

  // পরিকল্পিত route (আগের Architecture Document অনুযায়ী) —
  // সংশ্লিষ্ট Phase-এ feature তৈরি হলে সক্রিয় হবে:
  //   /customers                                → গ্রাহক তালিকা      (Phase 2)
  //   /customers/add                            → নতুন গ্রাহক        (Phase 2)
  //   /customers/:id                            → গ্রাহক বিস্তারিত   (Phase 2)
  //   /customers/:id/edit                       → গ্রাহক সম্পাদনা    (Phase 2)
  //   /customers/:id/history                    → লেনদেনের ইতিহাস   (Phase 3)
  //   /transactions/add-debt?customerId=:id     → নতুন বাকি          (Phase 3)
  //   /transactions/add-payment?customerId=:id  → টাকা নিয়েছি        (Phase 3)
  //   /settings                                 → সেটিংস             (Phase 6-8)
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.dashboard,
  routes: [
    GoRoute(
      path: AppRoutes.dashboard,
      name: 'dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    // ভবিষ্যতে উপরের পরিকল্পিত route গুলো এখানে GoRoute হিসেবে যোগ হবে।
  ],
);
