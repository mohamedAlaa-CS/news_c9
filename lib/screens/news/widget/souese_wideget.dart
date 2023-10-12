import 'package:flutter/material.dart';
import 'package:news/models/Sourseresponse.dart';
import 'package:news/screens/news/widget/source_item.dart';

class SourseWidget extends StatefulWidget {
  const SourseWidget({super.key, required this.sources});
  final List<Sources> sources;
  @override
  State<SourseWidget> createState() => _SourseWidgetState();
}

class _SourseWidgetState extends State<SourseWidget> {
  int curantSelect = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
            width: 5,
          ),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  curantSelect = index;
                  setState(() {});
                },
                child: SourceItem(
                  text: widget.sources[index].name ?? '',
                  isSelected: widget.sources.elementAt(curantSelect) ==
                      widget.sources[index],
                ));
          },
          itemCount: widget.sources.length,
        ),
      ),
    );
  }
}
