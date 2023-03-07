import '../theme.dart';
import '../util/theme_constants.dart';

final coreBorderTheme = CoreBorderTheme(
  values: <CoreBorderType, CoreBorderThemeData>{
    CoreBorderType.none: CoreBorderThemeData(
      width: CoreBorderWidth().none,
      radius: CoreBorderRadius().none,
    ),
    CoreBorderType.easy: CoreBorderThemeData(
      width: CoreBorderWidth().thin,
      radius: CoreBorderRadius().small,
    ),
    CoreBorderType.curve: CoreBorderThemeData(
      width: CoreBorderWidth().thin,
      radius: CoreBorderRadius().medium,
    ),
    CoreBorderType.circular: CoreBorderThemeData(
      width: CoreBorderWidth().small,
      radius: CoreBorderRadius().circular,
    ),
  },
);
