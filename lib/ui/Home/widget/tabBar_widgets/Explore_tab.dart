import 'package:creartive/models/content.dart';
import 'package:creartive/ui/Home/widget/content_card.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 0.8
        ),
        itemBuilder: (context, index) {
          // If index is within the uploaded posts list
          if (index < Content.contents.length) {
            return ContentCard(content: Content.contents[index], index: index);
          }
          // Otherwise, get from fixed content
          else {
            int fixedIndex = index - Content.contents.length;
            return ContentCard(content: FixedList.fixedContent[fixedIndex], index: index);
          }
        },
        itemCount: Content.contents.length + FixedList.fixedContent.length,
      ),
    );
  }
}
