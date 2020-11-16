import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:simple_hour/data/hour_data.dart';
import 'package:simple_hour/models/hour_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HourModel> hours = List<HourModel>();
  AutoScrollController _autoScrollController = AutoScrollController();
  final dataKey = new GlobalKey();

  int currentHourOfDay = TimeOfDay.now().hour;

  @override
  void initState() {
    super.initState();
    hours = getHours();
    print(currentHourOfDay);
    _autoScrollController.scrollToIndex(
      10,
      preferPosition: AutoScrollPosition.middle,
      duration: Duration(milliseconds: 2000),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  controller: _autoScrollController,
                  children: List.generate(
                    hours.length,
                    (i) => AutoScrollTag(
                      key: ValueKey(i),
                      controller: _autoScrollController,
                      index: i,
                      child: Container(
                        height: screenSize.height / 5,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        color: Colors.grey[300],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: '${hours[i].hour}',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${hours[i].meridiem}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]),
                            ),
                            Flexible(
                              child: Container(
                                height: 60,
                                color: Colors.white,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
