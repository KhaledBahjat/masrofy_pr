import 'package:fl_chart/fl_chart.dart';
import 'package:material_ui/material_ui.dart';
import 'package:masrofy/core/mock_data.dart';
import 'package:masrofy/screens/home/view/widgets/legend_item.dart';
import 'package:masrofy/screens/home/view/widgets/pie_section.dart';

class IncomePieAndStatistics extends StatelessWidget {
  final double height;

  const IncomePieAndStatistics({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final statistics = MockData.incomeStatistics;

    if (statistics.isEmpty) {
      return _emptyUI();
    }

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/Merchandise Category.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Income Categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            "In last 10 days",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: height * 0.03),

          SizedBox(
            height: height * 0.28,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 40,
                sectionsSpace: 3,
                sections: [
                  for (final item in statistics)
                    pieSection(
                      item.percentage,
                      CategoryColors.getColor(item.category),
                    ),
                ],
              ),
            ),
          ),

          SizedBox(height: height * 0.02),

          for (final item in statistics)
            LegendItem(
              title: item.category,
              percent: '${item.percentage.toStringAsFixed(1)}%',
              color: CategoryColors.getColor(item.category),
            ),
        ],
      ),
    );
  }

  Widget _emptyUI() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Text(
        "No transactions found",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

class CategoryColors {
  static const Map<String, Color> colors = {
    "Electronics": Colors.orange,
    "Supermarket purchases": Colors.green,
    "Installments": Colors.blue,
    "Restaurant lunch": Colors.purple,
    "Car fuel": Colors.red,
    "Food": Colors.brown,
    "Transport": Colors.teal,
    "Shopping": Colors.pink,
    "Bills": Colors.indigo,
    "Other": Colors.grey,
    "Extra Work": Colors.amberAccent,
    "Monthly income": Colors.lightGreenAccent,
  };

  static Color getColor(String category) {
    return colors[category] ?? Colors.grey;
  }
}