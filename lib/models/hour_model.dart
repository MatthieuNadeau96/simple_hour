import 'package:flutter/material.dart';

enum Status {
  productive,
  unproductive,
  empty,
}

class HourModel {
  final String hour;
  final String meridiem;
  Status status;

  HourModel({
    this.hour,
    this.meridiem,
    this.status,
  });
}
