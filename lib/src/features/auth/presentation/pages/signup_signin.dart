import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/features/auth/presentation/pages/signin.dart';
import 'package:jumma/src/features/auth/presentation/pages/signup.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import '../../../../core/common/widgets/elevated_button.dart';
import '../../../../core/common/widgets/icon_button.dart';
import '../../../../core/common/widgets/outlined_button.dart';

class SignUpSignInPage extends StatelessWidget {
  const SignUpSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Jumma',
            style: textTheme.headlineMedium,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  height: 274.5,
                  AppVectors.logo,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Salam!',
                style: textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Namaz vaxtları, xatırlatmalar və halal məhsullar bir yerdə.',
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JummaElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const SignInPage(),
                        ),
                      );
                    },
                    title: 'Daxil ol',
                  ),
                  JummaOutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const SignUpPage(),
                        ),
                      );
                    },
                    title: 'Qeydiyyatdan keç',
                  )
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Divider(
                      color: Color(0xFFDFDFDF),
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'və ya ilə qeydiyyatdan keçin',
                    style: textTheme.bodySmall,
                  ),
                  const Expanded(
                    child: Divider(
                      color: Color(0xFFDFDFDF),
                      indent: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JummaIconButton(
                    onPressed: () {},
                    iconPath: AppVectors.google,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  JummaIconButton(
                    onPressed: () {},
                    iconPath: AppVectors.facebook,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  JummaIconButton(
                    onPressed: () {},
                    iconPath: AppVectors.twitter,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
