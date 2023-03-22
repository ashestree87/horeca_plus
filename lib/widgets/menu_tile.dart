import 'package:flutter/material.dart';
import 'package:simple_horeca/utils/constants.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  MenuTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPrimaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: kMenuTitleTextStyle,
          ),
        ),
      ),
    );
  }
}
