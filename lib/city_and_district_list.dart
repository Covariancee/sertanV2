List<String> cities = [
  'No city choosen',
  'İstanbul',
  'Ankara',
  'İzmir',
  'Bursa',
  'Adana',
];

//select verilerini bu jsondan çekicez
final citiesJson = {
  "0": "Istanbul",
  "1": "Ankara",
  "2": "Izmir",
  "3": "Bursa",
  "4": "Antalya",
  "5": "Adana",
  "6": "Konya",
  "7": "Gaziantep",
  "8": "Mersin",
  "9": "Diyarbakir"
};


Map<String, List<String>> districts = {
  'İstanbul': ['No district choosen', 'Beşiktaş', 'Kadıköy', 'Şişli', 'Kartal'],
  'Ankara': [
    'No district choosen',
    'Çankaya',
    'Keçiören',
    'Yenimahalle',
    'Etimesgut'
  ],
  'İzmir': ['No district choosen', 'Bornova', 'Karşıyaka', 'Konak', 'Buca'],
  'Bursa': ['No district choosen', 'Osmangazi', 'Nilüfer', 'Yıldırım', 'Gürsu'],
  'Adana': ['No district choosen', 'Seyhan', 'Yüreğir', 'Çukurova', 'Sarıçam'],
};
