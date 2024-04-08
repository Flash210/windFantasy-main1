import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';

import 'package:front/features/filter/utils/functions.dart';
import 'package:front/generated/l10n.dart';

class FilteredPage extends StatefulWidget {

  final String position;
 
  const FilteredPage({
    super.key, required this.position,
    
  });

  @override
  FilteredPageState createState() => FilteredPageState();
}

class FilteredPageState extends State<FilteredPage> {
  
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2E1),
      appBar: AppBar(
        title: MyCustomText(
          text: S.of(context).Filter,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [buildResetText(context: context)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildFilterByTeam(context),
            const SizedBox(height: 5),
            buildFilterByPrice(),
            const SizedBox(height: 5),
            builFilterByPositions(position:widget.position),
            buildApplyFilterBtn(positon:widget.position),
          ],
        ),
      ),
    );
  }
}
