import 'package:flutter/material.dart';

import '../../../../core/assets/assets/app_images.dart';
import '../../../../core/common/widgets/elevated_button.dart';

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
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.banner),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.16,
            color: Colors.black.withOpacity(0.3),
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
                  'Your donation helps maintain and improve our community mosques. Every contribution counts. Thank you for your generosity.',
                  style: textTheme.headlineLarge!.copyWith(color: Colors.white, fontSize: 10),
                ),
                const SizedBox(height: 16,),
                JummaElevatedButton(onPressed: (){}, title: 'İanə et', width: size.height * 0.115, height: size.height * 0.026,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
