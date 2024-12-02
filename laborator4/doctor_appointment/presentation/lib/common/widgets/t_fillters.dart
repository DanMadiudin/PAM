import 'package:flutter/material.dart';

import '../styles/custom_icons.dart';
import '../styles/text_style.dart';

class TFiltter extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;
  const TFiltter(
      {super.key, required this.selectedFilter, required this.onFilterChanged});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onFilterChanged ,
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'name',
            child: Text('Sort by Name'),
          ),
          const PopupMenuItem(
            value: 'rating',
            child: Text('Sort by Rating'),
          ),
          const PopupMenuItem(
            value: 'reviews',
            child: Text('Sort by Reviews'),
          ),
          const PopupMenuItem(
            value: 'default',
            child: Text('Default'),
          ),
        ];
      },
      child: Row(
        children: [
          Text(
            selectedFilter,
            style: AppStyle.seeAll.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 4),
          Container(
            padding: const EdgeInsets.only(right: 8),
            height: 16,
            child: Image.asset(TIcons.filtter,
                color: const Color.fromRGBO(107, 114, 128, 1)),
          ),
        ],
      ),
    );
  }
}
