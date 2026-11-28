import 'package:material_ui/material_ui.dart';

import 'package:masrofy/screens/home/view/home_view.dart';
import 'package:masrofy/screens/reports/view/reports_view.dart';
import 'package:masrofy/screens/transaction/view/transaction_view.dart';
import 'package:masrofy/screens/budget/view/budget_view.dart';
import 'package:masrofy/screens/profile/profile_view.dart';
import 'package:masrofy/screens/home/view/widgets/custom_navigation_bar.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeView(),
    AnalyticsAndReportsView(),
    TransactionView(),
    BudgetView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}