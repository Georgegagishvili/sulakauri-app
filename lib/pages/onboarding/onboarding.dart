import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/pages/auth/sign_up/sign_up.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/util/route_animations.dart';
import 'package:sulakauri/widgets/buttons/orange_button.dart';

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(flex: 12),
              Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  'Skip',
                  textAlign: TextAlign.left,
                  style: AppTheme.sixteen.copyWith(
                    color: AppTheme.nickel,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(flex: 58),
              Flexible(
                flex: 296,
                child: SvgPicture.asset(
                  'assets/svg/onboarding.svg',
                ),
              ),
              const Spacer(flex: 67),
              const Text(
                'Have you read today?',
                textAlign: TextAlign.center,
                style: AppTheme.twentyEight,
              ),
              const Spacer(flex: 15),
              Text(
                'Read every day. The benefits are'
                '\nwell charted.',
                textAlign: TextAlign.center,
                style: AppTheme.eighteen.copyWith(
                  color: AppTheme.nickel,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(flex: 38),
              const CircleAvatar(
                radius: 6,
                backgroundColor: AppTheme.orange,
              ),
              const Spacer(flex: 59),
              Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: OrangeButton(
                  label: 'Next',
                  onClick: () => Navigator.of(context).push(
                    HybridRouteAnimations(
                      const SignUpPage(),
                      SharedAxisTransitionType.horizontal,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 69),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}
