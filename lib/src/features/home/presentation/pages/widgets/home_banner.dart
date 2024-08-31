import 'package:flutter/material.dart';

import '../../../../../core/assets/assets/app_images.dart';
import '../../../../../core/common/widgets/elevated_button.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.17,
            decoration: const BoxDecoration(
              color: Color(0xFF95C8FF),
              image: DecorationImage(
                alignment: Alignment.bottomRight,
                image: AssetImage(AppImages.banner),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.17,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Məscidlərimizə dəstək olun',
                    style: textTheme.headlineLarge!.copyWith(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'İanəniz məscidlərimizin saxlanmasına və\nabadlaşdırılmasına kömək edir.\nHər bir töhfə önəmlidir.\nSəxavətinizə görə təşəkkür edirik.',
                    style: textTheme.headlineMedium!.copyWith(color: Colors.white, fontSize: 10),
                  ),
                  JummaElevatedButton(onPressed: (){}, title: 'İanə et', width: size.width * 0.45, height: size.height * 0.04,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
