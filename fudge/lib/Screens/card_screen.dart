import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fudge/Widgets/appbar_custom.dart';
import 'package:fudge/Widgets/transaction_widget';
import 'package:google_fonts/google_fonts.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final List<String> images = [
    'assets/card2.png',
    'assets/card1.png',
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        color: Colors.white,
        title: 'MySaved Cards',
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 230.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: images.length,
                viewportFraction: 0.8,
                scale: 0.9,
                autoplay: false,
                pagination: SwiperPagination(
                  margin: const EdgeInsets.only(top: 10.0),
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.grey, activeColor: Colors.blue[700]),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            DefaultTabController(
              length: 4,
              child: Container(
                height: screenHeight * .6 - 13,
                child: Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.grey,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            child: Text('Menu Title1'),
                          ),
                          Tab(
                            child: Text('Menu Title2'),
                          ),
                          Tab(
                            child: Text('Menu Title3'),
                          ),
                          Tab(
                            child: Text('Menu Title4'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: screenWidth,
                        child: TabBarView(children: [
                          //First Tab

                          Container(
                            color: Colors.transparent,
                            child: ListView.builder(
                                //physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return transactions_widget(
                                    index: index,
                                  );
                                }),
                          ),
                          //Second Tab

                          Container(
                            width: screenWidth,
                            child: const Center(
                              child: Text('SampleTextData1'),
                            ),
                          ),
                          //Third Tab
                          Container(
                            width: screenWidth,
                            child: Center(
                              child: Text('SampleTextData2'),
                            ),
                          ),
                          //Fourth Tab
                          Container(
                            width: screenWidth,
                            child: Center(
                              child: Text('SampleTextData3'),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
