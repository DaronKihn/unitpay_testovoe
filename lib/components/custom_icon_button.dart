import 'package:flutter/material.dart';
import '../theme_constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, required icon, required onPress})
      : _icon = icon,
        _onPress = onPress,
        super(key: key);
  final _icon;
  final _onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      color: kAccentColor,
      width: 40.0,
      height: 40.0,
      child: IconButton(
        icon: Icon(_icon, color: kIconColor),
        onPressed: _onPress,
      ),
    );
  }
}
