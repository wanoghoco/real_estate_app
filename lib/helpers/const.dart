class AppConstant {
  static String mapBoxApiKey =
      'pk.eyJ1Ijoid2Fub2dobyIsImEiOiJjbTd2dDJhcDYwMnRqMmlxeDF3ZjE5dHN4In0.QWBZ_asJIRGKUiPHjJ0syg';

  static String get getMapStyleRoute =>
      "https://api.mapbox.com/styles/v1/wanogho/cm7w5xyj800ay01r38r3a2wph/tiles/256/{z}/{x}/{y}@2x?access_token=${AppConstant.mapBoxApiKey}";
}
