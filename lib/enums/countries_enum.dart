import 'package:flutter/foundation.dart';

enum Countries {
  RUSSIA, SOUTH_KOREA, BRAZIL, SWEDEN, USA, UK, CHINA,
  MOROCCO, MEXICO, GERMANY, AUSTRALIA, JAPAN, GHANA
}

extension CountryEx on Countries{
  String get inString => describeEnum(this).replaceAll("_", " ");
}