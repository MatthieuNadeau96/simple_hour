import 'package:flutter/material.dart';
import 'package:simple_hour/models/hour_model.dart';

class StatusIcon extends StatefulWidget {
  final hour;
  StatusIcon({this.hour});

  @override
  _StatusIconState createState() => _StatusIconState();
}

class _StatusIconState extends State<StatusIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.hour.status = Status.empty;
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        // print(details);
        if (details.primaryVelocity > 0) {
          setState(() {
            widget.hour.status = Status.productive;
          });
        } else {
          setState(() {
            widget.hour.status = Status.unproductive;
          });
        }
      },
      child: Container(
        height: 50,
        width: 50,
        child: Icon(
          widget.hour.status == Status.empty
              ? Icons.circle
              : widget.hour.status == Status.productive
                  ? Icons.check
                  : Icons.cancel,
          size: 40,
        ),
      ),
    );
  }
}
