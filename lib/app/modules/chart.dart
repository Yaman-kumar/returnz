import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returnz/services/responsive.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({ Key? key }) : super(key: key);

  @override
  _StocksPageState createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {

  // crate list of spots for the graph by monthly, yearly of Google Stocks
  List<FlSpot> _daylySpots = [
    FlSpot(0, 20.0),
    FlSpot(1, 20.0),
    FlSpot(2, 30.0),
    FlSpot(3, 10.0),
    FlSpot(4, 40.0),
    FlSpot(5, 60.0),
    FlSpot(6, 40.0),
    FlSpot(7, 80.0),
    FlSpot(8, 60.0),
    FlSpot(9, 70.0),
    FlSpot(10, 50.0),
    FlSpot(11, 150.0),
    FlSpot(12, 70.0),
    FlSpot(13, 80.0),
    FlSpot(14, 60.0),
    FlSpot(15, 70.0),
    FlSpot(16, 60.0),
    FlSpot(17, 80.0),
    FlSpot(18, 110.0),
    FlSpot(19, 130.0),
    FlSpot(20, 100.0),
    FlSpot(21, 130.0),
    FlSpot(22, 160.0),
    FlSpot(23, 190.0),
    FlSpot(24, 150.0),
    FlSpot(25, 170.0),
    FlSpot(26, 180.0),
    FlSpot(27, 140.0),
    FlSpot(28, 150.0),
    FlSpot(29, 150.0),
    FlSpot(30, 130.0)
  ];

  List<FlSpot> _monthlySpots = [
    FlSpot(0, 110.0),
    FlSpot(1, 110.0),
    FlSpot(2, 130.0),
    FlSpot(3, 100.0),
    FlSpot(4, 130.0),
    FlSpot(5, 160.0),
    FlSpot(6, 190.0),
    FlSpot(7, 150.0),
    FlSpot(8, 170.0),
    FlSpot(9, 180.0),
    FlSpot(10, 140.0),
    FlSpot(11, 150.0),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return
        // appBar: AppBar(
        //   backgroundColor: Color(0xff0E1117),
        //   elevation: 0,
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios, color: Colors.blueGrey),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   title: Text(
        //     'Stocks',
        //     style: TextStyle(
        //       color: Colors.blueGrey.shade200,
        //       fontSize: 18,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.search, color: Colors.blueGrey,),
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
        //
     Column(
       //  mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.only(left: 8.0,right: 25.0,bottom: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Container(
                   //adding: EdgeInsets.all(10),
                   height: 46,
                   width: 46,
                   decoration: BoxDecoration(
                     image:DecorationImage(
                       scale: 5,

                       image: AssetImage('assets/images/download.png',

                     ),


                     ),
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey,
                         offset: Offset(0.0, 0.1), //(x,y)
                         blurRadius: 6.0,
                       ),
                     ],
                     shape: BoxShape.circle,

                   ),

                 ),
               ],
             ),
           ),
           FadeInUp(
             duration: Duration(milliseconds: 1000),
             from: 60,
             child: Container(
               width: 340.kw,
                 height: 130.kh,
                 child: LineChart(
                   mainData(),
                   swapAnimationCurve: Curves.easeInOutCubic,
                   swapAnimationDuration: Duration(milliseconds: 1000),
                 )
             ),
           ),
           AnimatedContainer(
               duration: Duration(milliseconds: 500),
               height: MediaQuery.of(context).size.height * 0.1,
               padding: EdgeInsets.all(20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         _currentIndex = 0;
                       });
                     },
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: _currentIndex == 0 ? Color(0xffD8F336) : Color(0xff161b22).withOpacity(0.0),
                       ),
                       child: Text("1W", style: TextStyle(color:Colors.black, fontSize: 15),),
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         _currentIndex = 1;
                       });
                     },
                     child: AnimatedContainer(

                       duration: Duration(milliseconds: 500),
                       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: _currentIndex == 1 ? Color(0xffD8F336) : Color(0xff161b22).withOpacity(0.0),
                       ),
                       child: Text("15D", style: TextStyle(color: Colors.black, fontSize: 15),),
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         _currentIndex = 2;
                       });
                     },
                     child: AnimatedContainer(
                       duration: Duration(milliseconds: 500),
                       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: _currentIndex == 2 ? Color(0xffD8F336) : Color(0xff161b22).withOpacity(0.0),
                       ),
                       child: Text("1M", style: TextStyle(color: Colors.black, fontSize: 15),),
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         _currentIndex = 0;
                       });
                     },
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: _currentIndex == 0 ? Color(0xffD8F336) : Color(0xff161b22).withOpacity(0.0),
                       ),
                       child: Text("6M", style: TextStyle(color:Colors.black, fontSize: 15),),
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                       setState(() {
                         _currentIndex = 1;
                       });
                     },
                     child: AnimatedContainer(

                       duration: Duration(milliseconds: 500),
                       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: _currentIndex == 1 ? Color(0xffD8F336) : Color(0xff161b22).withOpacity(0.0),
                       ),
                       child: Text("1Y", style: TextStyle(color: Colors.black, fontSize: 15),),
                     ),
                   ),
                 ],
               )
           ),
         ]
     );
  }

  // Charts Data
  List<Color> gradientColors = [
    const Color(0xffD8F336),
    const Color(0xffD8F336),
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: false,
          horizontalInterval: 1.6,
          drawVerticalLine: false
      ),
      titlesData: FlTitlesData(
        show: false,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: false,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 8
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JAN';
              case 2:
                return 'FEB';
              case 3:
                return 'MAR';
              case 4:
                return 'APR';
              case 5:
                return 'MAY';
              case 6:
                return 'JUN';
              case 7:
                return 'JUL';
              case 8:
                return 'AUG';
              case 9:
                return 'SEP';
              case 10:
                return 'OCT';
              case 11:
                return 'NOV';
              case 12:
                return 'DEC';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),

          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
        ),
      ),
      minX: 0,
      maxX: _currentIndex == 0 ? _daylySpots.length-1.toDouble() : _currentIndex == 1 ? _monthlySpots.length-1.toDouble() : _currentIndex == 2 ? _daylySpots.length-20.toDouble() : _daylySpots.length.toDouble(),
      minY: 0,
      maxY: 200,
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                      radius: 8,
                      color: [
                        Colors.black,
                        Colors.black,
                      ][index],
                      strokeWidth: 2,
                      strokeColor: Colors.black,
                    ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(25),
          tooltipBgColor: Colors.white,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${touchedSpot.y.round()}.00',
                const TextStyle(color: Colors.black, fontSize: 12.0),

              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _currentIndex == 0 ? _daylySpots : _currentIndex == 1 ? _monthlySpots : _daylySpots,
          isCurved: true,
          colors: [

            const Color(0xff000000).withOpacity(1),
            const Color(0xff000000).withOpacity(1),

          ],
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              gradientFrom: Offset(0, 0),
              gradientTo: Offset(0, 1),
              colors: [

                const Color(0xffD8F336).withOpacity(1),
                const Color(0xFFFFFFFF).withOpacity(0),

              ]
          ),
        )
      ],
    );
  }
}