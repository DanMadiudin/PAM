import 'package:flutter/material.dart';

import '../styles/text_style.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonTitle = 'See All',
    required this.title,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title,
          style: AppStyle.title.copyWith(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis),
      if (showActionButton)
        TextButton(
            onPressed: onPressed,
            child: Text(buttonTitle, style: AppStyle.seeAll))
    ]);
  }
}
