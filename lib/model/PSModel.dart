import 'package:flutter/material.dart';

class PSGameModel {
  String? imgMain;
  String? imgLogo;
  String? title;
  String? subTitle;
  String? subTitle1;
  double? rating;
  double? appSize;
  String? event;
  Icon? icon;
  String? ends;
  bool? install;
  List<String>? imagesData;

  PSGameModel({this.imagesData, this.imgMain, this.imgLogo, this.title, this.subTitle, this.rating, this.appSize, this.subTitle1, this.event, this.ends, this.icon, this.install});
}

class PSMyAppsModel {
  String? appLogo;
  String? title;
  String? size;
  String? subTitle;
  String? time;
  bool isUpdate;
  String? appSize;
  String? upaDteSubtitle;
  bool isExpanded;
  String? information;
  bool install;

  PSMyAppsModel({this.appLogo, this.title, this.size, this.subTitle, this.time, this.isUpdate = false, this.appSize, this.upaDteSubtitle, this.isExpanded = false, this.information, this.install = false});
}

class PSReviews {
  String? cirLogo;
  String? title;
  String? subTile;
  String? date;

  PSReviews({this.cirLogo, this.title, this.subTile, this.date});
}

class PSRadio {
  String? title;
  bool isSelected;

  PSRadio({this.title, this.isSelected = false});
}

class Categories {
  String? name;
  IconData? icon;
  bool isExpanded;

  Categories({this.name, this.icon, this.isExpanded = false});
}

class CategoriesApps {
  String? name;
  IconData? icon;

  CategoriesApps({this.name, this.icon});
}

class GenresList {
  String? name;
  IconData? icon;

  GenresList({this.name, this.icon});
}

class ReviewModel {
  String? img;
  String? name;
  String? date;
  String? review;
  double? rating;

  ReviewModel({this.img, this.name, this.date, this.rating, this.review});
}

class RattingModel {
  String? typeRating;
  IconData? star;

  RattingModel({
    this.typeRating,
    this.star,
  });
}

class GameModelList {
  String? img;
  String? videoImg;

  GameModelList({this.img, this.videoImg});
}
