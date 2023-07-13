import '../models/category.dart';
import '../models/meals.dart';

const availableCategories = {
  Category(id: "c1", title: "Mezeler", image: "assets/category/mezeler.jpg"),
  Category(
      id: "c2", title: "Salatalar", image: "assets/category/salatalar.jpg"),
  Category(
      id: "c3", title: "Sakatatlar", image: "assets/category/sakatatlar.jpg"),
  Category(
      id: "c4",
      title: "Ara Sıcaklar",
      image: "assets/category/arasicaklar.jpg"),
  Category(
      id: "c5",
      title: "Ana Yemekler",
      image: "assets/category/anayemekler.jpg"),
  Category(id: "c6", title: "Tatlılar", image: "assets/category/tatlilar.jpg"),
  Category(id: "c7", title: "Meyveler", image: "assets/category/meyveler.jpg"),
  Category(
      id: "c8",
      title: "Alkolsüz İçecekler",
      image: "assets/category/alkolsuzicecekler.jpg"),
  Category(
      id: "c9",
      title: "Alkolllü İçkiler",
      image: "assets/category/alkolluicecekler.jpg"),
};

const dummyMeals = [
  Meal(
      id: "m1",
      categories: ["c1"],
      title: "Humus",
      image: "assets/category/mezeler.jpg",
      duration: 10,
      affordability: Affordability.affordable),
  Meal(
      id: "m2",
      categories: ["c1"],
      title: "Şakşuka",
      image: "assets/category/mezeler.jpg",
      duration: 10,
      affordability: Affordability.affordable),
  Meal(
      id: "m3",
      categories: ["c2"],
      title: "Çoban Salatası",
      image: "assets/category/salatalar.jpg",
      duration: 10,
      affordability: Affordability.affordable),
  Meal(
      id: "m4",
      categories: ["c2"],
      title: "Rus Salatası",
      image: "assets/category/salatalar.jpg",
      duration: 10,
      affordability: Affordability.affordable),
  Meal(
      id: "m5",
      categories: ["c3"],
      title: "Kokoreç",
      image: "assets/category/sakatatlar.jpg",
      duration: 15,
      affordability: Affordability.pricey),
  Meal(
      id: "m6",
      categories: ["c3"],
      title: "Ciğer Tava",
      image: "assets/category/sakatatlar.jpg",
      duration: 15,
      affordability: Affordability.pricey),
  Meal(
      id: "m7",
      categories: ["c4"],
      title: "Karides Tava",
      image: "assets/category/arasicaklar.jpg",
      duration: 20,
      affordability: Affordability.pricey),
  Meal(
      id: "m8",
      categories: ["c4"],
      title: "Mücver",
      image: "assets/category/arasicaklar.jpg",
      duration: 20,
      affordability: Affordability.pricey),
  Meal(
      id: "m9",
      categories: ["c5"],
      title: "Kuzu Şiş",
      image: "assets/category/anayemekler.jpg",
      duration: 30,
      affordability: Affordability.luxurious),
  Meal(
      id: "m10",
      categories: ["c5"],
      title: "Adana Kebap",
      image: "assets/category/anayemekler.jpg",
      duration: 35,
      affordability: Affordability.luxurious),
  Meal(
      id: "m11",
      categories: ["c6"],
      title: "Şekerpare",
      image: "assets/category/tatlilar.jpg",
      duration: 20,
      affordability: Affordability.pricey),
  Meal(
      id: "m12",
      categories: ["c6"],
      title: "Lokma",
      image: "assets/category/tatlilar.jpg",
      duration: 5,
      affordability: Affordability.affordable),
  Meal(
      id: "m13",
      categories: ["c7"],
      title: "Meyve Tabağı",
      image: "assets/category/meyveler.jpg",
      duration: 10,
      affordability: Affordability.pricey),
  Meal(
      id: "m14",
      categories: ["c7"],
      title: "Lüks Meyve Tabağı",
      image: "assets/category/meyveler.jpg",
      duration: 10,
      affordability: Affordability.luxurious),
  Meal(
      id: "m15",
      categories: ["c8"],
      title: "Coca Cola",
      image: "assets/category/alkolsuzicecekler.jpg",
      duration: 1,
      affordability: Affordability.affordable),
  Meal(
      id: "m16",
      categories: ["c8"],
      title: "Fanta",
      image: "assets/category/alkolsuzicecekler.jpg",
      duration: 1,
      affordability: Affordability.affordable),
  Meal(
      id: "m17",
      categories: ["c9"],
      title: "Tuborg Gold",
      image: "assets/category/alkolluicecekler.jpg",
      duration: 1,
      affordability: Affordability.pricey),
  Meal(
      id: "m18",
      categories: ["c9"],
      title: "Beylerbeyi Göbek Rakı",
      image: "assets/category/alkolluicecekler.jpg",
      duration: 1,
      affordability: Affordability.luxurious),
];
