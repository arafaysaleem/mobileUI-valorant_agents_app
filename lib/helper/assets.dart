class Assets{
  const Assets();

  static String get titleBg => "assets/backgrounds/cover1.png";

  static String get listingBg => "assets/backgrounds/cover2.png";

  static String get detailsBg => "assets/backgrounds/cover3.png";

  static String avatarAsset(String avatarImage) => "assets/agents/$avatarImage";

  static String abilityIcon(String abilityImage) => "assets/abilities/$abilityImage";
}