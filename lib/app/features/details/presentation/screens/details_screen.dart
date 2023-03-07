import 'package:concepta/app/components/custom/core_wrapper_concepta.dart';
import 'package:concepta/app/components/layout/core_container.dart';
import 'package:concepta/theme/theme.dart';
import 'package:flutter/material.dart';

import '../components/back_input.dart';
import '../components/details_banner.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CoreWrapperConcepta(
        children: [
          CoreContainer(
            alignment: Alignment.topLeft,
            margin: CoreSpacing(
              bottom: CoreSpacingType.spacing300,
              left: CoreSpacingType.spacing700,
            ),
            child: ButtonBackComponent(),
          ),
          CoreContainer(
            alignment: Alignment.topCenter,
            margin: CoreSpacing(horizontal: CoreSpacingType.spacing800),
            child: DetailBannerComponent(),
          ),
        ],
      ),
    );
  }
}
