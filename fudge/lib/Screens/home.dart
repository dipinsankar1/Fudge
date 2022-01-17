// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fudge/Widgets/profile_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fudge/Models/user.dart';
import 'package:fudge/Bloc/user_bloc.dart';
import 'package:fudge/Screens/card_screen.dart';
import 'package:fudge/Widgets/title_box.dart';
import 'package:fudge/Widgets/progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fudge/Widgets/transaction_widget';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserBLoC userBLoC = new UserBLoC();
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late List<User>? _userData;
  final List<String> images = [
    'assets/usr1.png',
    'assets/usr2.png',
    'assets/usr3.png',
    'assets/usr1.png',
    'assets/usr2.png',
    'assets/usr3.png',
    'assets/usr1.png',
    'assets/usr2.png',
    'assets/usr3.png',
    'assets/usr1.png',
  ];

  @override
  void initState() {
    super.initState();

    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      color: Colors.white,
      shouldAlwaysShow: true,
      textStyle: TextStyle(color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<User>>(
          stream: userBLoC.usersList,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('There was an error : ${snapshot.error}');
                }

                //print('My data is ${snapshot.data}');

                _userData = snapshot.data;
                print(_userData?[0].username);

                // ignore: avoid_print
                //print(users);
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Profile_Widget(),
                          tittle_Box(
                            titleText: 'PERFORMANCE CHART',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              color: Colors.transparent,
                              child: SfCartesianChart(
                                plotAreaBackgroundColor:
                                    Color.fromRGBO(83, 85, 155, 0.18),
                                palette: [Color.fromRGBO(20, 122, 214, 1)],
                                tooltipBehavior: _tooltipBehavior,

                                series: <ChartSeries>[
                                  LineSeries<SalesData, String>(
                                      name: 'Balance',
                                      dataSource: _chartData,
                                      xValueMapper: (SalesData sales, _) =>
                                          sales.month,
                                      yValueMapper: (SalesData sales, _) =>
                                          sales.sales,
                                      dataLabelSettings:
                                          DataLabelSettings(isVisible: true),
                                      enableTooltip: true)
                                ],
                                primaryXAxis: CategoryAxis(),
                                primaryYAxis:
                                    NumericAxis(minimum: 0, maximum: 800),
                                // primaryYAxis: NumericAxis(
                                //     labelFormat: '{value}M',
                                //     numberFormat:
                                //         NumberFormat.simpleCurrency(decimalDigits: 0)),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'TOP USERS FROM YOUR COMMUNITY',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          _community(_userData, images),
                          SizedBox(
                            height: 10.0,
                          ),
                          tittle_Box(
                            titleText: 'RECENT TRANSACTIONS',
                          ),
                          Container(
                            color: Colors.transparent,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return transactions_widget(
                                    index: index,
                                  );
                                }),
                          ),
                          Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'FINAL GOALS',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 45.0),
                              child: Container(
                                height: 20,
                                child: Text('XX of total XX'),
                              ),
                            ),
                          ),
                          progress_indicator(
                            colorText: Colors.blue,
                            value: 0.6,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 45.0),
                              child: Container(
                                height: 20,
                                child: Text('XX of total XX'),
                              ),
                            ),
                          ),
                          progress_indicator(
                            colorText: Colors.red,
                            value: 0.9,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 45.0),
                              child: Container(
                                height: 20,
                                child: Text('XX of total XX'),
                              ),
                            ),
                          ),
                          progress_indicator(
                            colorText: Colors.teal,
                            value: 0.4,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
            }
          }),
    );
  }

  _community(List<User>? userData, List<String> imgs) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Row(
              children: List.generate(userData!.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amberAccent,
                          ),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 75,
                    child: Align(
                        child: Text(
                      userData[index].username,
                      overflow: TextOverflow.ellipsis,
                    )),
                  )
                ],
              ),
            );
          }))
        ],
      ),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData('JAN', 300),
      SalesData('FEB', 280),
      SalesData('MAR', 489),
      SalesData('APR', 150),
      SalesData('MAY', 90)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final double sales;
}
