import '../theme.dart';
import '../util/theme_constants.dart';

final coreIconTheme = CoreIconSizeTheme(
  values: <CoreIconSizeType, double>{
    CoreIconSizeType.none: CoreIconSize().none,
    CoreIconSizeType.small: CoreIconSize().small,
    CoreIconSizeType.medium: CoreIconSize().medium,
  },
);
