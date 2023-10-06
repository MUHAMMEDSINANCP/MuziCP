import 'package:get/get.dart';

class AllSongsViewModel extends GetxController {
  final allList = [
    {
      "id": "brqxXg-c",
      "name": "Kun Faya Kun",
      "type": "",
      "album": "Rockstar",
      "year": "2011",
      "releaseDate": null,
      "duration": "473",
      "label": "",
      "artists": "A.R. Rahman, Javed Ali, Mohit Chauhan",
      "artistsId": "456269, 455926, 455124",
      "featuredArtists": "",
      "featuredArtistsId": "",
      "explicitContent": 0,
      "playCount": "33047161",
      "language": "hindi",
      "hasLyrics": "true",
      "url": "https://www.jiosaavn.com/song/kun-faaya-kun/ExsKdAdmYGU",
      "copyright": "©  2011 ",
      "image":
          "https://c.saavncdn.com/408/Rockstar-Hindi-2011-20221212023139-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/274/aee250c500588f117ae5343688e12b42_160.mp4"
    },
    {
      "id": "-Rb5lPKJ",
      "name": "Kun Faya Kun DJ Version",
      "type": "",
      "album": "Kun Faya Kun",
      "year": "2019",
      "releaseDate": null,
      "duration": "284",
      "label": "PT Artha Musik Produksi",
      "artists": "7 Bintang",
      "artistsId": "3084476",
      "featuredArtists": "",
      "featuredArtistsId": "",
      "explicitContent": 0,
      "playCount": "15804",
      "language": "indonesian",
      "hasLyrics": "false",
      "url": "https://www.jiosaavn.com/song/kun-faya-kun/XToJBBhgfHk",
      "copyright": "(P) 2019 Artha Music Production",
      "image":
          "https://c.saavncdn.com/107/Kun-Faya-Kun-Indonesian-2019-20191214142413-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/107/6b6a254924bc31176e65ffd0d71a17e5_160.mp4"
    },
    {
      "id": "l56idbSQ",
      "name": "Kun Faya Kun Slowed Reverb",
      "type": "",
      "album": "Kun Faya Kun",
      "year": "2022",
      "releaseDate": null,
      "duration": "195",
      "label": "Hunter Prince Khalid",
      "artists": "Hunter Prince Khalid",
      "artistsId": "10808504",
      "featuredArtists": "",
      "featuredArtistsId": "",
      "explicitContent": 0,
      "playCount": "689",
      "language": "unknown",
      "hasLyrics": "false",
      "url": "https://www.jiosaavn.com/song/kun-faya-kun/HF1dWBBSZGI",
      "copyright": "℗ 2022 Hunter Prince Khalid",
      "image":
          "https://c.saavncdn.com/374/Kun-Faya-Kun-Unknown-2022-20220322144653-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/374/6ef38cb844872013aecf5049a164a5de_160.mp4"
    },
    {
      "id": "EquVoUt1",
      "name": "Kun Faya Kun",
      "type": "",
      "album": "Islamic Nasheed",
      "year": "2023",
      "releaseDate": null,
      "duration": "321",
      "label": "Nasheed Islamic Production",
      "artists": "Mahiya Zafar",
      "artistsId": "17249298",
      "featuredArtists": "",
      "featuredArtistsId": "",
      "explicitContent": 0,
      "playCount": "67",
      "language": "urdu",
      "hasLyrics": "false",
      "url": "https://www.jiosaavn.com/song/kun-faya-kun/NRkeZxtlQwI",
      "copyright": "© 2023 Nasheed Islamic Production",
      "image":
          "https://c.saavncdn.com/673/Kun-Faya-Kun-Urdu-2023-20230823150531-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/673/27d8adda24ea72a930f8670a3182fcd3_160.mp4"
    },
    {
      "id": "FJx1Tj5w",
      "name": "Non Stop Music",
      "type": "",
      "album": "Kun Faya Kun",
      "year": "2021",
      "releaseDate": null,
      "duration": "94",
      "label": "Fita Cassete",
      "artists": "JOELSON O REI DO SOM AUTOMOTIVO",
      "artistsId": "8699736",
      "featuredArtists": "",
      "featuredArtistsId": "",
      "explicitContent": 0,
      "playCount": "295",
      "language": "unknown",
      "hasLyrics": "false",
      "url": "https://www.jiosaavn.com/song/kun-faya-kun/NiITACBaAkQ",
      "copyright": "℗ 2021 Fita Cassete",
      "image":
          "https://c.saavncdn.com/046/Kun-Faya-Kun-Unknown-2021-20210810215429-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/046/258526db3c63551096e773fe54f2acfc_160.mp4"
    },
    {
      "id": "_Go9q0V3",
      "name":
          "Be and It will Be. Nasheed",
      "type": "",
      "album": "For the Pleasure of Allah",
      "year": "2010",
      "releaseDate": null,
      "duration": "279",
      "label": "Green Dome Edu-Tainment",
      "artists": "Hussein Kalla",
      "artistsId": "2898666",
      "featuredArtists": "",
      "featuredArtistsId": "",
      "explicitContent": 0,
      "playCount": "728",
      "language": "english",
      "hasLyrics": "false",
      "url":
          "https://www.jiosaavn.com/song/kun-fa-ya-kun-be-and-it-will-be-feat.-al-ghazali-college-choir/Ly8ECAUAYQA",
      "copyright": "© 2010 Hussein Kalla",
      "image":
          "https://c.saavncdn.com/491/For-the-Pleasure-of-Allah-English-2010-20180227073427-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/491/a7cd460a340b5f103b639dd14e628e76_160.mp4"
    },
    {
      "id": "ALPzy3Lp",
      "name": "Maula Mera",
      "type": "",
      "album": "Maula mera , Kun Faya Kun",
      "year": "2021",
      "releaseDate": null,
      "duration": "293",
      "label": "Aqsa Abdul Haq",
      "artists": "Aqsa Abdul Haq",
      "artistsId": "2020208",
      "featuredArtists": "",
      "featuredArtistsId": "",
      "explicitContent": 0,
      "playCount": "147",
      "language": "urdu",
      "hasLyrics": "false",
      "url": "https://www.jiosaavn.com/song/kun-faya-kun/MSQ7Sw0De0M",
      "copyright": "© 2021 Aqsa Abdul Haq",
      "image":
          "https://c.saavncdn.com/390/Kun-Faya-Kun-Urdu-2021-20220628163038-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/390/23a381d63116474175085d9d015c78eb_160.mp4"
    },
    {
      "id": "csaEsVWV",
      "name": "Rockstar. KFK",
      "type": "",
      "album": "Rockstar",
      "year": "2011",
      "releaseDate": null,
      "duration": "473",
      "label": "",
      "artists": "A.R. Rahman, Javed Ali, Mohit Chauhan",
      "artistsId": "456269, 455926, 455124",
      "featuredArtists": "",
      "featuredArtistsId": "",
      "explicitContent": 0,
      "playCount": "33047161",
      "language": "hindi",
      "hasLyrics": "true",
      "url": "https://www.jiosaavn.com/song/kun-faaya-kun/ExsKdAdmYGU",
      "copyright": "©  2011 ",
      "image":
          "https://c.saavncdn.com/408/Rockstar-Hindi-2011-20221212023139-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/274/aee250c500588f117ae5343688e12b42_160.mp4"
    },
  ].obs;
}
