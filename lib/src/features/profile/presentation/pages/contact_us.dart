import 'package:flutter/material.dart';
import 'package:jumma/src/core/extensions/context_extension.dart';
import '../../../../core/common/widgets/elevated_button.dart';
import '../../../../core/extensions/sizedbox_extension.dart';
import 'widgets/custom_text_input.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact us',
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextInput(
                hintText: 'Name*',
              ),
              12.h,
              CustomTextInput(
                hintText: 'Email*',
              ),
              12.h,
              CustomTextInput(
                hintText: 'Phone number*',
                keyboardType: TextInputType.number,
              ),
              12.h,
              CustomTextInput(
                hintText: 'Write message*',
                maxLines: 4,
              ),
              14.h,
              JummaElevatedButton(onPressed: () {}, title: 'Send', width: context.fullWidth,)
            ],
          ),
        ),
      ),
    );
  }
}
