import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/mock_data.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/screens/home/view/widgets/out_pie_and_statistics.dart';
import 'package:masrofy/screens/home/view/widgets/smart_alert.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    const user = MockData.currentUser;

    final totalIncome = MockData.totalIncome;
    final totalOutcome = MockData.totalOutcome;
    final balance = MockData.balance;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ---------------------- USER HEADER ----------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(user.avatarAsset),
                      ),
                      SizedBox(width: width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome back!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            user.displayName,
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () =>
                        context.push(AppRoutes.kNotificationView),
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.015),

              /// ---------------------- BALANCE CARD ----------------------
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * 0.038),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/balance.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Balance",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "£${balance.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "From: £${totalIncome.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const LinearProgressIndicator(
                      value: 0.45,
                      color: Color.fromARGB(255, 134, 88, 72),
                      backgroundColor: Colors.white24,
                      minHeight: 6,
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.012),

              /// ---------------------- INCOME / OUTCOME ----------------------
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: const Border(
                    right: BorderSide(
                      color: kGreyFontColor,
                      width: 4,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _statCard(
                        "Income",
                        "£${totalIncome.toStringAsFixed(2)}",
                        Colors.green,
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                      endIndent: 20,
                      indent: 20,
                    ),
                    Expanded(
                      child: _statCard(
                        "Outcome",
                        "£${totalOutcome.toStringAsFixed(2)}",
                        Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.012),

              /// ---------------------- SMART ALERTS ----------------------
              SmartAlert(width: width),

              SizedBox(height: height * 0.02),

              /// ---------------------- PIE CHART ----------------------
              OutcomePieAndStatistics(
                height: height,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String title, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          title == "Income"
              ? Icons.arrow_downward_rounded
              : Icons.arrow_upward_rounded,
          color: color,
          size: 25,
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}