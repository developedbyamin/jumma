import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/features/profile/widgets/name_and_email.dart';
import 'package:jumma/src/features/profile/widgets/profile_button.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import '../../../home/presentation/pages/notification.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const NotificationPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            icon: SvgPicture.asset(AppVectors.notification),
          ),
        ],
      ),
      body:  const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            NameAndEmail(),
            SizedBox(height: 12,),
            ProfileButton(text: 'All orders', svg: AppVectors.allOrders),
            ProfileButton(text: 'Favorites', svg: AppVectors.favorites),
            ProfileButton(text: 'Mosque', svg: AppVectors.mescid),
            ProfileButton(text: 'Languages', svg: AppVectors.languages),
            ProfileButton(text: 'Help & FAQ', svg: AppVectors.helpFaq),
            ProfileButton(text: 'Change Password', svg: AppVectors.changePassword),
            ProfileButton(text: 'Contact Us', svg: AppVectors.contactUs),
            ProfileButton(text: 'Log out', svg: AppVectors.logOut,borderColor: AppColors.logOut,textColor: AppColors.logOut,),
          ],
        ),
      ),
    );
  }
}
