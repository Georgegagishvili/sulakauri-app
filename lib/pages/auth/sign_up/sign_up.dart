import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/pages/landing/landing.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/util/route_animations.dart';
import 'package:sulakauri/widgets/buttons/orange_button.dart';
import 'package:sulakauri/widgets/textfields/icon_textfield.dart';

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 110,
          ),
          children: [
            Align(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: AppTheme.cyan.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    'assets/svg/logo.svg',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 31),
            const Text(
              'Create New Account',
              style: AppTheme.twentyFour,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'Register new Sulakauri account',
              textAlign: TextAlign.center,
              style: AppTheme.fourteen.copyWith(
                color: AppTheme.silver,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 53),
            IconTextField(
              controller: _nameController,
              hint: 'Email or Phone number',
              svgPath: 'svgPath',
            ),
            const SizedBox(height: 20),
            IconTextField(
              controller: _passwordController,
              hint: 'Password',
              svgPath: 'svgPath',
            ),
            const SizedBox(height: 20),
            IconTextField(
              controller: _repeatPasswordController,
              hint: 'Confirm Password',
              svgPath: 'svgPath',
            ),
            const SizedBox(height: 36),
            OrangeButton(
              label: 'Sign Up',
              onClick: () => Navigator.of(context).push(
                SharedAxisRouteAnimations(
                  const LandingPage(),
                  SharedAxisTransitionType.horizontal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
