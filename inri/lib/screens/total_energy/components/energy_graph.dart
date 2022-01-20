import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/total_energy_model.dart';
import 'package:inri/utils/formatters/date_formater.dart';

class EnergyGraph extends StatefulWidget {
  final List<TotalEnergyModel> energyList;
  const EnergyGraph(this.energyList);

  @override
  _EnergyGraphState createState() => _EnergyGraphState();
}

class _EnergyGraphState extends State<EnergyGraph> {
  late List<FlSpot> _spots;
  late int _biggers;
  List<Color> gradientColors = [
    kPrimaryColor,
    kSecondaryColor,
  ];

  @override
  void initState() {
    
    _spots = widget.energyList.map((e) => FlSpot(widget.energyList.indexOf(e).toDouble(), e.average!)).toList();
    super.initState();
  }

  double get biggets {
    double bigger = 0;
    widget.energyList.forEach((element) {
      if (element.average! > bigger){
        bigger = element.average!+10;
      }
    });
    return bigger;
  }

  bool showAvg = false;
  TextStyle get _subtitleStyle => const TextStyle(color: kSecondaryColor, fontSize: 10);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(mainData()),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(color: kSecondaryColor.withOpacity(0.2), strokeWidth: 1);
        },
        getDrawingVerticalLine: (value) {
          return FlLine(color: kSecondaryColor.withOpacity(0.2), strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => _subtitleStyle,
          rotateAngle: 30,
          getTitles: (value){
            if (value % 120 == 0) {
              return widget.energyList.elementAt(value.toInt()).createdAt!.hour.toString();
            }
            return '';
          },
          margin: 5,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => _subtitleStyle,
          getTitles: (value){ 
              if (value % 120 == 0){
                return value.toString();
              }
              return '';
              // return widget.energyList.elementAt(value.toInt()).average!.toStringAsFixed(0);
              // return '';
          },
          reservedSize: 25,
          margin: 4,
        ),
      ),
      borderData: FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 0.5)),
      minX: 0,
      maxX: 1438,
      minY: 0,
      maxY: biggets,
      lineBarsData: [
        LineChartBarData(
          spots: _spots,
          isCurved: false,
          colors: gradientColors,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
