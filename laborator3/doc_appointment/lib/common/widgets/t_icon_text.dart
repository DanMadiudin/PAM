import 'package:flutter/material.dart';

import '../styles/text_style.dart';

class TIconText extends StatelessWidget {
  const TIconText(
      {super.key, required this.text, required this.iconPath, this.iconSize, this.textSize});

  final String text;
  final String iconPath;
  final double? iconSize;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 8),
          height: iconSize ?? 16,
          child: Image.asset(iconPath),
        ),
        Text(text,
            style: AppStyle.seeAll
                .copyWith(fontWeight: FontWeight.w400, fontSize: textSize ?? 12))
      ],
    );
  }
}
