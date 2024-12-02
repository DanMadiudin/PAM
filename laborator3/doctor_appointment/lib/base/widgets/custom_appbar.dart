import 'package:doctor_app/base/common/styles/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location',
                  style: AppStyle.mainText.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.grey)),
              Row(
                children: [
                  const Icon(Icons.location_on_rounded),
                  Text('Seattle, USA', style: AppStyle.mainText),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              )
            ],
          ),
          Stack(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications_rounded)),
              const Positioned(
                top: 12.0,
                right: 12.0,
                child: CircleAvatar(
                  radius: 5.0,
                  backgroundColor: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
