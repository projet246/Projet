import 'package:flutter/material.dart';

class SilderMusic extends StatefulWidget {
  SilderMusic({Key? key, required double value}) {
    _value = value;
  }
  double _value = 6;
  @override
  State<SilderMusic> createState() => _SilderMusicState();
}

class _SilderMusicState extends State<SilderMusic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 200,
      decoration: BoxDecoration(
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
        border: Border.all(
          color: Colors.white, //                   <--- border color
          width: 3.0,
        ),
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 15,
            rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 10),
            inactiveTrackColor: Colors.lightBlueAccent,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 0.0,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 0.0,
            ),
          ),
          child: Slider(
            value: widget._value,
            onChanged: (double value) {
              setState(() {
                widget._value = value;
              });
            },
            activeColor: const Color.fromRGBO(255, 210, 23, 5),
            max: 10,
            min: 0,
          ),
        ),
      ),
    );
  }
}
