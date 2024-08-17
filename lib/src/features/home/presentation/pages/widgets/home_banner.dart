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
            height: MediaQuery.of(context).size.height * 0.16,
            decoration: const BoxDecoration(
              color: Color(0xFF95C8FF),
              image: DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage(AppImages.banner),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Support our mosques',
                  style: textTheme.headlineLarge!.copyWith(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 8,),
                Text(
                  'Your donation helps maintain and\nimprove our community mosques.\nEvery contribution counts.\nThank you for your generosity.',
                  style: textTheme.headlineLarge!.copyWith(color: Colors.white, fontSize: 10),
                ),
                const SizedBox(height: 8,),
                JummaElevatedButton(onPressed: (){}, title: 'İanə et', width: size.width * 0.45, height: size.height * 0.03,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
