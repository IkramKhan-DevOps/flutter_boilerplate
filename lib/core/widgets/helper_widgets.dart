import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/image_constants.dart';

class DividerWidget extends StatelessWidget {
  final double? margin;
  final Color? color;

  const DividerWidget({super.key, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.symmetric(vertical: margin ?? 0.5),
      height: 0.5,
      width: double.infinity,
      color: color ?? colors.primary.withOpacity(1),
    );
  }
}

class AppScreenPlaceholder extends StatelessWidget {
  const AppScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppScreenUnderDevelopment(
          size: 200,
        ),
      ),
    );
  }
}


class AppNoDataFoundWidget extends StatelessWidget {
  final String? heading;
  final String? message;
  final double? size;

  const AppNoDataFoundWidget(
      {super.key, this.heading, this.message, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              LottieConstant.notFoundSearch,
              height: size ?? 200,
            ),
            const SizedBox(height: 20),
            Text(
              heading ?? 'No data found',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            message != null
                ? Text(
                    message ?? 'No data found',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class AppScreenUnderDevelopment extends StatelessWidget {
  final String? heading;
  final String? message;
  final double? size;

  const AppScreenUnderDevelopment(
      {super.key, this.heading, this.message, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              LottieConstant.construction,
              height: size ?? 200,
            ),
            const SizedBox(height: 20),
            Text(
              heading ?? 'Under Constructions',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              message ??
                  'This screen is under development. Please check back later after some time.',
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AppErrorWidget extends StatelessWidget {
  final String? heading;
  final String? message;
  final double? size;

  const AppErrorWidget({super.key, this.heading, this.message, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              LottieConstant.cancel,
              height: size ?? 200,
            ),
            const SizedBox(height: 10),
            Text(
              heading ?? 'Something went wrong!',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            message != null
                ? Text(
                    message ?? 'Please contact support',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class AppProgressWidget extends StatelessWidget {
  final Color? color;
  final String? message;
  final double? size;

  const AppProgressWidget({super.key, this.color, this.message, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.loading,
              height: size ?? 100,
              width: size ?? 100,
            ),
            Text(
              message ?? 'Loading...',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const ProfileImageWidget({super.key, this.imageUrl, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.orange,
          width: 1,
        ),
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset('assets/images/user.png').image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
