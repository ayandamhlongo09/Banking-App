import 'dart:async';
import 'package:banking_app/constants/app_colors.dart';
import 'package:banking_app/constants/app_icons.dart';
import 'package:banking_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:avatar_glow/avatar_glow.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController scaleController;
  Animation<double> scaleAnimation;
  bool isAnimating = false;

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, () {
      setState(() {
        isAnimating = true;
      });

      scaleController.forward();
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();

    scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.login);
               
              }
            },
          );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 15).animate(scaleController);
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: AppColors.light,
        width: width,
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Center(
                  child: AvatarGlow(
                    glowColor: AppColors.primary,
                    endRadius: 180,
                    duration: Duration(milliseconds: 1000),
                    repeat: true,
                    showTwoGlows: true,
                    curve: Curves.easeOutQuad,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: isAnimating
                          ? AnimatedBuilder(
                              animation: scaleAnimation,
                              builder: (c, child) => Transform.scale(
                                scale: scaleAnimation.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            )
                          : Icon(
                              AppIcons.logo,
                              color: AppColors.light,
                              size: 40,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                isAnimating
                    ? Container()
                    : Text(
                        GlobalConfiguration().getValue<String>('appTitle'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
