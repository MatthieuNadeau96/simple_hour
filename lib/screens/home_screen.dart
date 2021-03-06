import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:simple_hour/data/hour_data.dart';
import 'package:simple_hour/models/hour_model.dart';
import 'package:simple_hour/widget/status_icon.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  List<HourModel> hours = List<HourModel>();
  AutoScrollController _autoScrollController = AutoScrollController();
  final dataKey = new GlobalKey();

  int currentHourOfDay = TimeOfDay.now().hour;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    hours = getHours();
    print(currentHourOfDay);
    _autoScrollController.scrollToIndex(
      currentHourOfDay - 1,
      preferPosition: AutoScrollPosition.middle,
      duration: Duration(milliseconds: 2000),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              // vertical: 30,
            ),
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
                          height: screenSize.height / 6,
                          width: 200,
                          decoration: BoxDecoration(
                            border: i + 1 == currentHourOfDay
                                ? Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  )
                                : null,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: RichText(
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
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      width: 200,
                                      height: 60,
                                      color: Colors.grey[100],
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                StatusIcon(hour: hours[i]),
                              ],
                            ),
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
      ),
    );
  }
}
