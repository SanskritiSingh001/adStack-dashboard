import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

// Line chart showing "Over All Performance The Years".
// I am using dummy data points here, values don't mean anything real.
class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    // dummy data for pending vs done projects over the years
    List<FlSpot> pendingData = const [
      FlSpot(0, 15),
      FlSpot(1, 22),
      FlSpot(2, 18),
      FlSpot(3, 30),
      FlSpot(4, 20),
      FlSpot(5, 35),
    ];

    List<FlSpot> doneData = const [
      FlSpot(0, 25),
      FlSpot(1, 15),
      FlSpot(2, 32),
      FlSpot(3, 20),
      FlSpot(4, 40),
      FlSpot(5, 28),
    ];

    List<String> years = ["2015", "2016", "2017", "2018", "2019", "2020"];

    return SizedBox(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _legendDot(AppColors.pink, "Pending"),
              const SizedBox(width: 16),
              _legendDot(AppColors.purple, "Project Done"),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index < 0 || index >= years.length) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            years[index],
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: AppColors.textGrey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: pendingData,
                    isCurved: true,
                    color: AppColors.pink,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots: doneData,
                    isCurved: true,
                    color: AppColors.purple,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGrey),
        ),
      ],
    );
  }
}
