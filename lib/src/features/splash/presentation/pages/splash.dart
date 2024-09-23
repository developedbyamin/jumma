import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/assets/assets/app_vectors.dart';
import 'package:jumma/src/core/common/bottom_navigation_bar/pages/root.dart';
import 'package:jumma/src/core/config/theme/app_colors.dart';
import 'package:jumma/src/core/interceptors/app_interceptor.dart';
import 'package:jumma/src/features/auth/data/sources/local/token_store.dart';
import 'package:jumma/src/features/auth/domain/entities/auth_tokens.dart';
import 'package:jumma/src/features/auth/presentation/pages/signup_signin.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AppInterceptor _interceptor = AppInterceptor();

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    AuthTokens? tokens = await TokenStore.getTokens();

    if (tokens?.accessToken != null) {
      bool isTokenExpired = await _isTokenExpired(tokens!.accessToken);

      if (isTokenExpired) {
        String? newAccessToken = await _interceptor.refreshAccessToken(tokens.refreshToken);
        if (newAccessToken != null) {
          _navigateToHome();
        } else {
          _navigateToSignUpSignIn();
        }
      } else {
        _navigateToHome();
      }
    } else {
      _navigateToSignUpSignIn();
    }
  }

  Future<bool> _isTokenExpired(String accessToken) async {
    try {
      bool isExpired = JwtDecoder.isExpired(accessToken);
      return isExpired;
    } catch (e) {
      debugPrint('Error decoding token: $e');
      return true;
    }
  }

  void _navigateToHome() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const Root(),
        ),
      );
    }
  }

  void _navigateToSignUpSignIn() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const SignUpSignInPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(
          AppVectors.logo,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
