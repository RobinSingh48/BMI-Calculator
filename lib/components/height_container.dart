import 'package:bmi_calculator/theme/theme_util.dart';
import 'package:flutter/material.dart';

class HeightContainer extends StatefulWidget {
  final double initialHeight;
  final ValueChanged<double> onHeightChanged;
  const HeightContainer({
    super.key,
    required this.onHeightChanged,
    required this.initialHeight,
  });

  @override
  State<HeightContainer> createState() => _HeightContainerState();
}

class _HeightContainerState extends State<HeightContainer> {
  late double _height;
  @override
  void initState() {
    _height = widget.initialHeight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.onPrimaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Height",
            style: TextStyle(
              color: context.secondary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _height.toStringAsFixed(0),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Text("cm"),
            ],
          ),

          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
              overlayColor: Color(0x29EA1555),
              activeTrackColor: Color(0xFFFEFEFF),
              inactiveTrackColor: Color(0xFF888997),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
            ),
            child: Slider(
              inactiveColor: context.secondary,

              value: _height,
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
                widget.onHeightChanged(_height);
              },
              min: 120,
              max: 220,
            ),
          ),
        ],
      ),
    );
  }
}
