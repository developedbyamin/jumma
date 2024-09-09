import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumma/src/core/extensions/jwt_extension.dart';
import '../../../../core/extensions/pager.dart';
import 'all_orders.dart';
import 'contact_us.dart';
import 'help_faq.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/extensions/navigation_extension.dart';
import 'widgets/name_and_email.dart';
import 'widgets/profile_button.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import '../../../home/presentation/pages/notification.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjYwNzI5NThhLThmZjItNGMyMC1hMzQzLTZhYjM1ZDM3ZGUyYyIsImp0aSI6IjEyODdlZjAwLTQ2MzktNDdlMy05MDBiLWJhODNjYjYwNzEwZiIsImVtYWlsIjoiZXNleWZ1bGxheWV2NTFAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiU3VwZXJBZG1pbiIsImV4cCI6MTcyNTg3MDk3NywiaXNzIjoiaHR0cHM6Ly9qdW1tYS5zdmRldi5tZSIsImF1ZCI6Imh0dHBzOi8vanVtbWEuc3ZkZXYubWUifQ.0ou3PuaRqK_IKS23ukAUTqE85_cIsg3BxqaOISSQ5TE';
    final textTheme = Theme.of(context).textTheme;
    final String email = token.getUserEmail();
    //final String name = token.getUserName();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            NameAndEmail(
              name: 'Ruslan Salmanov',
              email: email,
              onTap: () {
                context.to(Pager.editProfile);
              },
            ),
            const SizedBox(
              height: 12,
            ),
            ProfileButton(
              text: 'All orders',
              svg: AppVectors.allOrders,
              onTap: () {
                context.to(const AllOrders());
              },
            ),
            const ProfileButton(text: 'Favorites', svg: AppVectors.favorites),
            const ProfileButton(text: 'Mosque', svg: AppVectors.mescid),
            const ProfileButton(text: 'Languages', svg: AppVectors.languages),
            ProfileButton(
              text: 'Help & FAQ',
              svg: AppVectors.helpFaq,
              onTap: () {
                context.to(const HelpFaq());
              },
            ),
            ProfileButton(
              text: 'Change Password',
              svg: AppVectors.changePassword,
              onTap: () {
                context.to(Pager.changePassword);
              },
            ),
            ProfileButton(
              text: 'Contact Us',
              svg: AppVectors.contactUs,
              onTap: () {
                context.to(const ContactUs());
              },
            ),
            const ProfileButton(
              text: 'Log out',
              svg: AppVectors.logOut,
              borderColor: AppColors.logOut,
              textColor: AppColors.logOut,
            ),
          ],
        ),
      ),
    );
  }
}
