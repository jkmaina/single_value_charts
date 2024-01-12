import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedCountdownWidget extends StatefulWidget {
  final Duration initialTime;
  final bool animate;
  final TextStyle textStyle;

  const AnimatedCountdownWidget({
    Key? key,
    required this.initialTime,
    this.animate = true,
    required this.textStyle,
  }) : super(key: key);

  @override
  AnimatedCountdownWidgetState createState() => AnimatedCountdownWidgetState();
}

class AnimatedCountdownWidgetState extends State<AnimatedCountdownWidget> {
  late Duration _remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.initialTime;
    if (widget.animate) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    int days = duration.inDays;
    int hours = duration.inHours.remainder(24);
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    String formattedTime = days > 0
        ? "$days:${twoDigits(hours)}:$twoDigitMinutes:$twoDigitSeconds"
        : "${twoDigits(hours)}:$twoDigitMinutes:$twoDigitSeconds";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_remainingTime),
      style: widget.textStyle,
    );
  }
}
