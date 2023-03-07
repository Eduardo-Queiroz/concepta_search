import 'package:concepta/app/components/custom/core_wrapper_concepta.dart';
import 'package:concepta/app/components/layout/core_container.dart';
import 'package:concepta/infra/util/animation_constants.dart';
import 'package:concepta/theme/theme.dart';
import 'package:flutter/material.dart';

import '../components/back_input.dart';
import '../components/details_banner.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoreWrapperConcepta(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const CoreContainer(
                  alignment: Alignment.topLeft,
                  margin: CoreSpacing(
                    bottom: CoreSpacingType.spacing300,
                    left: CoreSpacingType.spacing700,
                  ),
                  child: ButtonBackComponent(),
                ),
                AnimatedSize(
                  duration: CoreDelay().easy,
                  child: const CoreContainer(
                    alignment: Alignment.topCenter,
                    margin: CoreSpacing(horizontal: CoreSpacingType.spacing700),
                    child: DetailBannerComponent(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
