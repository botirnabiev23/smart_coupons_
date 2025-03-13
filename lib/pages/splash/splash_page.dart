import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_coupons/pages/into/intro_page.dart';
import 'package:smart_coupons/theme/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
    ).then(
      (value) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => IntroPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: SvgPicture.asset('assets/images/union.svg'),
            ),
            const Gap(48),
            Text(
              'Discount Hub',
              style: GoogleFonts.pixelifySans(
                fontSize: 64,
                fontWeight: FontWeight.w600,
                height: 0.92,
                letterSpacing: 0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            Text(
              'Smart Coupons',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                // ignore: use_full_hex_values_for_flutter_colors
                color: Color(0xffffffff).withOpacity(0.8),
              ),
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
