import 'package:flutter/material.dart';
import 'package:simple_hour/data/hour_data.dart';
import 'package:simple_hour/models/hour_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HourModel> hours = List<HourModel>();

  @override
  void initState() {
    super.initState();
    hours = getHours();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                  crossAxisCount: 1,
                  children: List.generate(
                    hours.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      color: Colors.grey[300],
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: '${hours[index].hour}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${hours[index].meridiem}',
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
            ],
          ),
        ),
      ),
    );
  }
}
