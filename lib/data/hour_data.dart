import 'package:simple_hour/models/hour_model.dart';

List<HourModel> getHours() {
  List<HourModel> hours = [
    HourModel(hour: '1', meridiem: 'am', status: Status.empty),
    HourModel(hour: '2', meridiem: 'am', status: Status.empty),
    HourModel(hour: '3', meridiem: 'am', status: Status.empty),
    HourModel(hour: '4', meridiem: 'am', status: Status.empty),
    HourModel(hour: '5', meridiem: 'am', status: Status.empty),
    HourModel(hour: '6', meridiem: 'am', status: Status.empty),
    HourModel(hour: '7', meridiem: 'am', status: Status.empty),
    HourModel(hour: '8', meridiem: 'am', status: Status.unproductive),
    HourModel(hour: '9', meridiem: 'am', status: Status.unproductive),
    HourModel(hour: '10', meridiem: 'am', status: Status.productive),
    HourModel(hour: '11', meridiem: 'am', status: Status.productive),
    HourModel(hour: '12', meridiem: 'pm', status: Status.productive),
    HourModel(hour: '1', meridiem: 'pm', status: Status.productive),
    HourModel(hour: '2', meridiem: 'pm', status: Status.productive),
    HourModel(hour: '3', meridiem: 'pm', status: Status.productive),
    HourModel(hour: '4', meridiem: 'pm', status: Status.productive),
    HourModel(hour: '5', meridiem: 'pm', status: Status.unproductive),
    HourModel(hour: '6', meridiem: 'pm', status: Status.unproductive),
    HourModel(hour: '7', meridiem: 'pm', status: Status.unproductive),
    HourModel(hour: '8', meridiem: 'pm', status: Status.unproductive),
    HourModel(hour: '9', meridiem: 'pm', status: Status.unproductive),
    HourModel(hour: '10', meridiem: 'pm', status: Status.unproductive),
    HourModel(hour: '11', meridiem: 'pm', status: Status.empty),
    HourModel(hour: '12', meridiem: 'am', status: Status.empty),
  ];
  return hours;
}
