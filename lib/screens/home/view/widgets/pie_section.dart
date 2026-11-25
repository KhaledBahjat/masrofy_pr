 import 'package:fl_chart/fl_chart.dart';
import 'package:material_ui/material_ui.dart';

PieChartSectionData pieSection(double value, Color color) {
    return PieChartSectionData(
      value: value,
      color: color,
      radius: 45,
      showTitle: false,
    );
  }