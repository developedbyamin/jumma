class SurahsModel {
  final int id;
  final String ad;
  final int say;

  const SurahsModel({required this.id, required this.ad,required this.say});

//   factory SurahsModel.fromJson(Map<String, dynamic> json) {
//     return SurahsModel(
//       id: json['id'],
//       ad: json['ad'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'ad': ad,
//     };
//   }
 //}

static const List<SurahsModel> surahsModelList = [
  SurahsModel(id: 1, ad: "Fatihə surəsi (Kitabı açan surəsi)",say: 7),
  SurahsModel(id: 2, ad: "Bəqərə surəsi (İnəklər surəsi)",say: 293),
  SurahsModel(id: 3, ad: "Ali-İmran surəsi (İmran ailəsi surəsi)",say: 493),
  SurahsModel(id: 4, ad: "Nisa surəsi (Qadınlar surəsi)",say: 669),
  SurahsModel(id: 5, ad: "Maidə surəsi (Süfrə surəsi)",say: 789),
  SurahsModel(id: 6, ad: "Ənam surəsi (Davar surəsi)",say: 914),
  SurahsModel(id: 7, ad: "Əraf surəsi (Sədd surəsi)",say:1120),
  SurahsModel(id: 8, ad: "Ənfal surəsi (Qənimət surəsi)",say:1195),
  SurahsModel(id: 9, ad: "Tövbə surəsi (Tövbə surəsi)",say:1324),
  SurahsModel(id: 10, ad: "Yunus surəsi (Yunus peyğəmbər surəsi)",say:1433),
  SurahsModel(id: 11, ad: "Hud surəsi (Hud peyğəmbər surəsi)",say:1556),
  SurahsModel(id: 12, ad: "Yusif surəsi (Yusif peyğəmbər surəsi)",say:1667),
  SurahsModel(id: 13, ad: "Rəd surəsi (Göy gurultusu surəsi)",say:1710),
  SurahsModel(id: 14, ad: "İbrahim surəsi (İbrahim peyğəmbər surəsi)",say:1762),
  SurahsModel(id: 15, ad: "Hicr surəsi (Daşlı sahə surəsi)",say:1861),
  SurahsModel(id: 16, ad: "Nəhl surəsi (Bal arısı surəsi)",say:1989),
  SurahsModel(
      id: 17,
      ad: "İsra surəsi (Gecə vaxtı seyr) və ya Bəni-İsrail (İsrail oğulları surəsi)",say:2100),
  SurahsModel(id: 18, ad: "Kəhf surəsi (Mağara surəsi)",say:2210),
  SurahsModel(id: 19, ad: "Məryəm surəsi (Məryəm surəsi)",say:2308),
  SurahsModel(id: 20, ad: "Taha surəsi (Taha surəsi)",say:2443),
  SurahsModel(id: 21, ad: "Ənbiya surəsi (Peyğəmbərlər surəsi)",say:2555),
  SurahsModel(id: 22, ad: "Həcc surəsi (Həcc surəsi)",say:2633),
  SurahsModel(id: 23, ad: "Muminun surəsi (Möminlər surəsi)",say:2751),
  SurahsModel(id: 24, ad: "Nur surəsi (Nur surəsi)",say:2815),
  SurahsModel(id: 25, ad: "Furqan surəsi (Fəqləndirmə surəsi)",say:2892),
  SurahsModel(id: 26, ad: "Şuəra surəsi (Şairlər surəsi)",say:3119),
  SurahsModel(id: 27, ad: "Nəml surəsi (Qarışqalar surəsi)",say:3212),
  SurahsModel(id: 28, ad: "Qəsəs surəsi (Hekayət surəsi)",say:3300),
  SurahsModel(id: 29, ad: "Ənkəbut surəsi (Hörümçək surəsi)",say:3369),
  SurahsModel(id: 30, ad: "Rum surəsi (Rumlular surəsi)",say:3469),
  SurahsModel(id: 31, ad: "Loğman surəsi (Loğman peyğəmbər surəsi)",say:3503),
  SurahsModel(id: 32, ad: "Səcdə surəsi (Səcdə surəsi)",say:3533),
  SurahsModel(id: 33, ad: "Əhzab surəsi (Dəstələr surəsi)",say:3606),
  SurahsModel(id: 34, ad: "Səba surəsi (Səba surəsi)",say:3660),
  SurahsModel(id: 35, ad: "Fatir surəsi (Yaradan surəsi)",say:3705),
  SurahsModel(id: 36, ad: "Yasin surəsi (Yasin surəsi)",say:3788),
  SurahsModel(id: 37, ad: "Saffat surəsi (Səf-Səf duranlar surəsi)",say:3970),
  SurahsModel(id: 38, ad: "Sad surəsi (Sad surəsi)",say:4058),
  SurahsModel(id: 39, ad: "Zumər surəsi (Zümrələr surəsi)",say:4133),
  SurahsModel(id: 40, ad: "Ğafir surəsi (Mömin surəsi)",say:4218),
  SurahsModel(id: 41, ad: "Fussilət surəsi (Müfəssəl izah edilmiş surəsi)",say:4272),
  SurahsModel(id: 42, ad: "Şura surəsi (Şura surəsi)",say:4325),
  SurahsModel(id: 43, ad: "Zuxruf surəsi (Qızıl bəzəklər surəsi)",say:4414),
  SurahsModel(id: 44, ad: "Duxan surəsi (Duman surəsi)",say:4473),
  SurahsModel(id: 45, ad: "Casiyə surəsi (Diz çökmüş camaat surəsi)",say:4510),
  SurahsModel(id: 46, ad: "Əhqaf surəsi (Qumsal təpələr surəsi)",say:4545),
  SurahsModel(id: 47, ad: "Muhəmməd surəsi (Məhəmməd peyğəmbər surəsi)",say:4583),
  SurahsModel(id: 48, ad: "Fəth surəsi (Fəth surəsi)",say:4612),
  SurahsModel(id: 49, ad: "Hucurat surəsi (Otaqlar surəsi)",say:4630),
  SurahsModel(id: 50, ad: "Qaf surəsi (Qaf surəsi)",say:4675),
  SurahsModel(id: 51, ad: "Zariyat surəsi (Sovurub dağıdan küləklər surəsi)",say:4735),
  SurahsModel(id: 52, ad: "Tur surəsi (Dağ surəsi)",say:4784),
  SurahsModel(id: 53, ad: "Nəcm surəsi (Ulduz surəsi)",say:4846),
  SurahsModel(id: 54, ad: "Qəmər surəsi (Ay surəsi)",say:4901),
  SurahsModel(id: 55, ad: "Rəhman surəsi (Rəhmli olan Allah surəsi)",say:4979),
  SurahsModel(id: 56, ad: "Vaqiə surəsi (Vaqiə surəsi)",say:5075),
  SurahsModel(id: 57, ad: "Hədid surəsi (Dəmir surəsi)",say:5104),
  SurahsModel(id: 58, ad: "Mucadələ surəsi (Mücadilə surəsi)",say:5126),
  SurahsModel(id: 59, ad: "Həşr surəsi (Həşr surəsi)",say:5150),
  SurahsModel(id: 60, ad: "Mumtəhənə surəsi (Mumtəhənə surəsi)",say:5163),
  SurahsModel(id: 61, ad: "Saff surəsi (Saff surəsi)",say:5177),
  SurahsModel(id: 62, ad: "Cumuə surəsi (Cumuə surəsi)",say:5188),
  SurahsModel(id: 63, ad: "Munafiqun surəsi (Munafiqun surəsi)",say:5199),
  SurahsModel(id: 64, ad: "Təğabun surəsi (Təğabun surəsi)",say:5217),
  SurahsModel(id: 65, ad: "Talaq surəsi (Talaq surəsi)",say:5229),
  SurahsModel(id: 66, ad: "Təhrim surəsi (Təhrim surəsi)",say:5241),
  SurahsModel(id: 67, ad: "Mulk surəsi (Mulk surəsi)",say:5271),
  SurahsModel(id: 68, ad: "Qaləm surəsi (Qaləm surəsi)",say:5323),
  SurahsModel(id: 69, ad: "Haqqə surəsi (Haqqə surəsi)",say:5375),
  SurahsModel(id: 70, ad: "Məaric surəsi (Məaric surəsi)",say:5419),
  SurahsModel(id: 71, ad: "Nuh surəsi (Nuh peyğəmbər surəsi)",say:5447),
  SurahsModel(id: 72, ad: "Cinn surəsi (Cinn surəsi)",say:5475),
  SurahsModel(id: 73, ad: "Muzzəmmil surəsi (Muzzəmmil surəsi)",say:5495),
  SurahsModel(id: 74, ad: "Muddəssir surəsi (Muddəssir surəsi)",say:5551),
  SurahsModel(id: 75, ad: "Qiyamə surəsi (Qiyamə surəsi)",say:5591),
  SurahsModel(id: 76, ad: "İnsan surəsi (İnsan surəsi)",say:5622),
  SurahsModel(id: 77, ad: "Mursəlat surəsi (Mursəlat surəsi)",say:5672),
  SurahsModel(id: 78, ad: "Nəbə surəsi (Nəbə surəsi)",say:5712),
  SurahsModel(id: 79, ad: "Naziat surəsi (Can alan mələklər surəsi)",say:5758),
  SurahsModel(id: 80, ad: "Əbəsə surəsi (Qaşqabağını tökdü surəsi)",say:5800),
  SurahsModel(id: 81, ad: "Təkvir surəsi (Bükülmə surəsi)",say:5829),
  SurahsModel(id: 82, ad: "İnfitar surəsi (Yarılma surəsi)",say:5848),
  SurahsModel(
      id: 83, ad: "Mutaffifin surəsi (Ölçüdə və çəkidə aldadanlar surəsi)",say:5884),
  SurahsModel(id: 84, ad: "İnşiqaq surəsi (Yarılma surəsi)",say:5909),
  SurahsModel(id: 85, ad: "Büruc surəsi (Bürclər surəsi)",say:5931),
  SurahsModel(id: 86, ad: "Tariq surəsi (Gecə gələn surəsi)",say:5948),
  SurahsModel(id: 87, ad: "Əla surəsi (Uca olan Allah surəsi)",say:5967),
  SurahsModel(id: 88, ad: "Ğaşiyə surəsi (Bürüyən surəsi)",say:5993),
  SurahsModel(id: 89, ad: "Fəcr surəsi (Dan yeri surəsi)",say:6023),
  SurahsModel(id: 90, ad: "Bələd surəsi (Şəhər surəsi)",say:6043),
  SurahsModel(id: 91, ad: "Şəms surəsi (Günəş surəsi)",say:6058),
  SurahsModel(id: 92, ad: "Leyl surəsi (Gecə surəsi)",say:6079),
  SurahsModel(id: 93, ad: "Duha surəsi (Sübh surəsi)",say:6090),
  SurahsModel(id: 94, ad: "İnşirah surəsi (Açılma surəsi)",say:6098),
  SurahsModel(id: 95, ad: "Tin surəsi (Əncir surəsi)",say:6106),
  SurahsModel(id: 96, ad: "Ələq surəsi (Laxta qan surəsi)",say:6125),
  SurahsModel(id: 97, ad: "Qədr surəsi (Qədr gecəsi surəsi)",say:6130),
  SurahsModel(id: 98, ad: "Bəyyinə surəsi (Aydın dəlil surəsi)",say:6138),
  SurahsModel(id: 99, ad: "Zəlzələ surəsi (Zəlzələ surəsi)",say:6146),
  SurahsModel(id: 100, ad: "Adiyat surəsi (Qaçan atlar surəsi)",say:6157),
  SurahsModel(id: 101, ad: "Qariə surəsi (Qariə surəsi)",say:6178),
  SurahsModel(id: 102, ad: "Təkasur surəsi (Çoxluq surəsi)",say:6176),
  SurahsModel(id: 103, ad: "Əsr surəsi (Əsr surəsi)",say:6179),
  SurahsModel(id: 104, ad: "Huməzə surəsi (Qeybət edənlər surəsi)",say:6188),
  SurahsModel(id: 105, ad: "Fil surəsi (Fil surəsi)",say:6193),
  SurahsModel(id: 106, ad: "Qureyş surəsi (Qureyş surəsi)",say:6197),
  SurahsModel(id: 107, ad: "Maun surəsi (Yardım surəsi)",say:6204),
  SurahsModel(id: 108, ad: "Kövsər surəsi (Kövsər surəsi)",say:6207),
  SurahsModel(id: 109, ad: "Kafirun surəsi (Kafirun surəsi)",say:6213),
  SurahsModel(id: 110, ad: "Nəsr surəsi (Kömək surəsi)",say:6216),
  SurahsModel(id: 111, ad: "Məsəd surəsi (Əbu Ləhəb surəsi)",say:6221),
  SurahsModel(id: 112, ad: "İxlas surəsi (Təmizlik surəsi)",say:6225),
  SurahsModel(id: 113, ad: "Fələq surəsi (Dan yerinin ağarması surəsi)",say:6230),
  SurahsModel(id: 114, ad: "Nas surəsi (İnsanlar surəsi)",say:6236)
];
}