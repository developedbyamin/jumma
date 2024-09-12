import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumma/src/core/extensions/jwt_extension.dart';
import '../../../../core/extensions/pager.dart';
import '../../../auth/data/sources/local/token_store.dart';
import 'all_orders.dart';
import 'contact_us.dart';
import 'help_faq.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/extensions/navigation_extension.dart';
import 'widgets/name_and_email.dart';
import 'widgets/profile_button.dart';
import '../../../../core/assets/assets/app_vectors.dart';
import '../../../home/presentation/pages/notification.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name;
  String? surname;
  String? email;
  String? gender;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadUserProfile());
  }

  Future<void> _loadUserProfile() async {
    final token = await TokenStore.getTokens();
    final accessToken = token!.accessToken;

    setState(() {
      name = accessToken.getName();
      surname = accessToken.getSurname();
      email = accessToken.getUserEmail();
      gender = accessToken.getGender();
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            NameAndEmail(
              name: '$name $surname',
              email: email ?? '',
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
            gender == 'Female'?
              const SizedBox.shrink():
              ProfileButton(
                text: 'Mosque',
                svg: AppVectors.mescid,
                onTap: () {
                  context.to(Pager.selectMosque);
                },
              ),
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
