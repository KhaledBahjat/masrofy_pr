
import 'package:flutter/material.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/mock_data.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';
import 'package:masrofy/screens/home/view/widgets/in_pie_and_statistics.dart';
import 'package:masrofy/screens/home/view/widgets/out_pie_and_statistics.dart';
import 'package:masrofy/screens/home/view/widgets/smart_alert.dart';

class AnalyticsAndReportsView extends StatelessWidget {
  const AnalyticsAndReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String userId = MockData.currentUser.uid;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(width: width, text: 'Analytics'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IncomePieAndStatistics(height: height, userId: userId),
              SizedBox(height: height * 0.02),
              OutcomePieAndStatistics(height: height, userId: userId),
              SizedBox(height: height * 0.02),
              SmartAlert(width: width),
            ],
          ),
        ),
      ),
    );
  }
}
