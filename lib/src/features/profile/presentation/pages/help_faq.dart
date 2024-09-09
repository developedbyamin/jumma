import 'package:flutter/material.dart';
import 'widgets/faq_item.dart';
import '../../data/models/faq_model.dart';

class HelpFaq extends StatelessWidget {
  const HelpFaq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help&FAQ',
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (_, i) {
          return FaqItem(title: faqData[i].title, description: faqData[i].description);
        },
      ),
    );
  }
}
