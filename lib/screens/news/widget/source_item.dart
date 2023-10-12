import 'package:flutter/material.dart';
import 'package:news/shared/component/constants.dart';

class SourceItem extends StatelessWidget {
  const SourceItem({super.key, required this.text, required this.isSelected});
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isSelected ? Constants.primaryColorLight : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Constants.primaryColorLight, width: 1.5)),
      child: Text(
        text,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
