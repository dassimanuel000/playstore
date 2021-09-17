import 'package:flutter/material.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';
import 'package:playstore_flutter/utils/PSImages.dart';

List<PSGameModel> getDiscoverList() {
  List<PSGameModel> list = [];

  list.add(PSGameModel(title: 'UC Mini-Download', appSize: 10.0, imgLogo: 'https://picsum.photos/250?image=9', imgMain: '', rating: 4.0, subTitle: 'Public review - From your library'));
  list.add(PSGameModel(
      title: 'InsTagram', appSize: 10.0, imgLogo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/1200px-Instagram_logo_2016.svg.png', imgMain: '', rating: 4.0, subTitle: 'Public review - From your library'));
  list.add(PSGameModel(title: 'Freecharge&Bills,Mutual Funds,upi', appSize: 10.0, imgLogo: 'https://www.windowslatest.com/wp-content/uploads/2016/07/freecharge.png', imgMain: '', rating: 4.0, subTitle: 'Public review - From your library'));
  list.add(PSGameModel(title: 'Hangouts', appSize: 10.0, imgLogo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJINQ79VicBw31VAIwic4P8C-os8yIs_kRng&usqp=CAU', imgMain: '', rating: 4.0, subTitle: 'Public review - From your library'));

  return list;
}

List<PSMyAppsModel> getLibraryList() {
  List<PSMyAppsModel> list = [];
  list.add(PSMyAppsModel(
      appLogo: "https://picsum.photos/250?image=9",
      title: "UC Mini-Download",
      subTitle: "Not installed",
      time: "Used 1 hr.ago",
      appSize: "22 MB",
      upaDteSubtitle: "Update yesterday",
      isUpdate: true,
      information: "Information not provide by developer"));
  list.add(PSMyAppsModel(
      appLogo: "https://www.windowslatest.com/wp-content/uploads/2016/07/freecharge.png",
      title: "Freecharge&Bills,Mutual Funds,upi",
      subTitle: "Not installed",
      time: "Used 1 hr.ago",
      appSize: "22 MB",
      upaDteSubtitle: "Update yesterday",
      information: "We made improvements and squashed bugs so Twitter is even better for you"));
  list.add(PSMyAppsModel(
      appLogo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLOkTi21fKxJXCTEppsrIfrVajClBSSMZyFg&usqp=CAU",
      title: "Goibibo",
      subTitle: "Not installed",
      time: "Used 1 hr.ago",
      appSize: "10 MB",
      upaDteSubtitle: "Update 2 days ago",
      information: "You can now set up OneDriver to unlock with your face,if you device supports it."));
  list.add(PSMyAppsModel(
      appLogo: "https://picsum.photos/250?image=9",
      title: "UC Mini-Download",
      subTitle: "Not installed",
      time: "Used 1 hr.ago",
      appSize: "30 MB",
      upaDteSubtitle: "Update yesterday",
      information: "Thanks for Choosing Chrome! This release includes stability and performance improvements."));
  list.add(PSMyAppsModel(
      appLogo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJINQ79VicBw31VAIwic4P8C-os8yIs_kRng&usqp=CAU",
      title: "Hangouts",
      subTitle: "Not installed",
      time: "Used 1 hr.ago",
      appSize: "40 MB",
      upaDteSubtitle: "Update 3 days ago",
      information: "Information not provide by developer"));
  list.add(PSMyAppsModel(
      appLogo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpMU4t2akPDKYqN87-K_2iGvDON7rh9Kj-6g&usqp=CAU",
      title: "Google Duo",
      subTitle: "Not installed",
      time: "Used 1 hr.ago",
      appSize: "27 MB",
      upaDteSubtitle: "Update 9 day ago ",
      information: "We made improvements and squashed bugs so Twitter is even better for you"));
  return list;
}

List<PSReviews> getReviewList() {
  List<PSReviews> list1 = [];

  list1.add(PSReviews(cirLogo: "N", title: "Nur AniZa Khalid", date: "11/10/20", subTile: "I have the game especially because it is helps you to rack your brain and at the same time have to fun. I rated 4 starts beacuse the ads are annoying."));
  list1.add(PSReviews(cirLogo: "R", title: "Rohit Vijayan", date: "11/14/20", subTile: "What happened to the merge seven game. why is the changed. this is not possible. where is it. I can't see it.. Its replaced with some thing else"));
  list1.add(PSReviews(
      cirLogo: "B",
      title: "Blue Legend",
      date: "11/28/20",
      subTile: "I am a big fan of the many games on here and it dosen't Overheat my phone. The  games are amazing. Kids should really play these  types of games since there are even Puzzle game in it  "));
  return list1;
}

List<PSRadio> getRadioList() {
  List<PSRadio> radioList = [];

  radioList.add(PSRadio(title: 'Sexual Content'));

  radioList.add(PSRadio(title: 'Graphic Violence'));
  radioList.add(PSRadio(title: 'Hateful or abusive content'));
  radioList.add(PSRadio(title: 'Harmful to device or data '));
  radioList.add(PSRadio(title: 'Improper content rating'));
  radioList.add(PSRadio(title: 'Illegal prescription or other drug'));
  radioList.add(PSRadio(title: 'Copycat or impersonation'));
  radioList.add(PSRadio(title: 'Other object'));

  return radioList;
}

List<CategoriesApps> getCategoriesList() {
  List<CategoriesApps> categories = [];

  categories.add(CategoriesApps(name: 'Action', icon: Icons.star));
  categories.add(CategoriesApps(name: 'Adventure', icon: Icons.data_usage_rounded));
  categories.add(CategoriesApps(name: 'Arcade', icon: (Icons.add_comment)));
  categories.add(CategoriesApps(name: 'Board', icon: (Icons.add_circle_outline)));
  categories.add(CategoriesApps(name: 'Card', icon: Icons.credit_card));
  categories.add(CategoriesApps(name: 'Casino', icon: Icons.casino_outlined));
  categories.add(CategoriesApps(name: 'Eduction', icon: Icons.cast));
  categories.add(CategoriesApps(name: 'Music', icon: Icons.music_note_rounded));
  categories.add(CategoriesApps(name: 'Puzzle', icon: Icons.padding));
  categories.add(CategoriesApps(name: 'Racing', icon: Icons.pages));
  categories.add(CategoriesApps(name: 'Role Playing', icon: Icons.local_play_outlined));
  categories.add(CategoriesApps(name: 'Simulation', icon: Icons.circle_notifications));
  categories.add(CategoriesApps(name: 'Sports', icon: Icons.sports));
  categories.add(CategoriesApps(name: 'Strategy', icon: Icons.amp_stories_rounded));
  categories.add(CategoriesApps(name: 'Trivia', icon: Icons.trip_origin));
  categories.add(CategoriesApps(name: 'Word', icon: Icons.work_outline_sharp));
  return categories;
}

List<CategoriesApps> moviesCategoriesApps() {
  List<CategoriesApps> list = [];

  list.add(CategoriesApps(name: 'Action & adventure', icon: Icons.format_paint));
  list.add(CategoriesApps(name: 'Animation', icon: Icons.handyman_rounded));
  list.add(CategoriesApps(name: 'Comedy', icon: Icons.theater_comedy));
  list.add(CategoriesApps(name: 'Documentary', icon: Icons.date_range));
  list.add(CategoriesApps(name: 'Drama', icon: Icons.drafts));
  list.add(CategoriesApps(name: 'Horror', icon: Icons.swap_horizontal_circle_rounded));
  list.add(CategoriesApps(name: 'Indian Cinema', icon: Icons.chat_outlined));
  list.add(CategoriesApps(name: 'Mystery & Suspense', icon: Icons.saved_search));
  list.add(CategoriesApps(name: 'Sci-fi & fantasy', icon: Icons.wysiwyg_outlined));

  return list;
}

List<CategoriesApps> getCategoriesListApp() {
  List<CategoriesApps> categoriesapps = [];

  categoriesapps.add(CategoriesApps(name: 'Art & Design', icon: Icons.design_services));
  categoriesapps.add(CategoriesApps(name: 'Augmented reality', icon: Icons.data_usage_rounded));
  categoriesapps.add(CategoriesApps(name: 'Auto & Vehicles', icon: (Icons.date_range)));
  categoriesapps.add(CategoriesApps(name: 'Beauty', icon: (Icons.add_circle_outline)));
  categoriesapps.add(CategoriesApps(name: 'Books & Reference', icon: Icons.credit_card));
  categoriesapps.add(CategoriesApps(name: 'Beauty', icon: Icons.casino_outlined));
  categoriesapps.add(CategoriesApps(name: 'Books & Reference', icon: Icons.cast));
  categoriesapps.add(CategoriesApps(name: 'Business', icon: Icons.business));
  categoriesapps.add(CategoriesApps(name: 'Comics', icon: Icons.padding));
  categoriesapps.add(CategoriesApps(name: 'Dating', icon: Icons.pages));
  categoriesapps.add(CategoriesApps(name: 'Eduction', icon: Icons.local_play_outlined));
  categoriesapps.add(CategoriesApps(name: 'Events', icon: Icons.circle_notifications));
  categoriesapps.add(CategoriesApps(name: 'Finance', icon: Icons.sports));
  categoriesapps.add(CategoriesApps(name: 'Food & Drink', icon: Icons.amp_stories_rounded));
  categoriesapps.add(CategoriesApps(name: 'Sports', icon: Icons.trip_origin));
  categoriesapps.add(CategoriesApps(name: 'Games', icon: Icons.work_outline_sharp));

  return categoriesapps;
}

List<ReviewModel> getReviewList1() {
  List<ReviewModel> reviewList = [];
  reviewList.add(ReviewModel(img: 'images/cloneApp/playStore/ps_playstore.png', name: 'Align Jacob', date: '21/11/2020', review: Review, rating: 2.0));
  reviewList.add(ReviewModel(img: 'images/cloneApp/playStore/ps_playstore.png', name: 'John Oliver', date: '11/10/2020', review: review1, rating: 4.0));
  reviewList.add(ReviewModel(img: 'images/cloneApp/playStore/ps_playstore.png', name: 'Thomas Harry', date: '15/02/2020', review: Review, rating: 1.0));
  reviewList.add(ReviewModel(img: 'images/cloneApp/playStore/ps_playstore.png', name: 'James Charlie', date: '25/08/2020', review: Review, rating: 5.0));
  reviewList.add(ReviewModel(img: 'images/cloneApp/playStore/ps_playstore.png', name: 'Joseph James', date: '16/06/2020', review: review1, rating: 2.0));
  return reviewList;
}

List<RattingModel> getRatingList() {
  List<RattingModel> ratingList = [];
  ratingList.add(RattingModel(typeRating: 'ALL'));
  ratingList.add(RattingModel(typeRating: 'POSITIVE'));
  ratingList.add(RattingModel(typeRating: 'CRITICAL'));
  ratingList.add(RattingModel(typeRating: '5', star: Icons.star));
  ratingList.add(RattingModel(typeRating: '4', star: Icons.star));
  ratingList.add(RattingModel(typeRating: '3', star: Icons.star));
  ratingList.add(RattingModel(typeRating: '2', star: Icons.star));
  ratingList.add(RattingModel(typeRating: '1', star: Icons.star));

  return ratingList;
}

List<GameModelList> getGameListGame() {
  List<GameModelList> gameList = [];
  gameList.add(GameModelList(img: PS_GameImg1, videoImg: 'assets/images/videoIcon.gif'));
  gameList.add(GameModelList(img: PS_GameImg2));
  gameList.add(GameModelList(img: PS_GameImg3));
  gameList.add(GameModelList(img: PS_GameImg4));
  gameList.add(GameModelList(img: PS_GameImg5));
  gameList.add(GameModelList(img: PS_GameImg6));
  gameList.add(GameModelList(img: PS_GameImg7));
  gameList.add(GameModelList(img: PS_GameImg8));

  return gameList;
}

List<GameModelList> getGameListGame1() {
  List<GameModelList> gameList1 = [];
  gameList1.add(GameModelList(img: PS_GameImg1));
  gameList1.add(GameModelList(img: PS_GameImg2));
  gameList1.add(GameModelList(img: PS_GameImg3));
  gameList1.add(GameModelList(img: PS_GameImg4));
  gameList1.add(GameModelList(img: PS_GameImg5));
  gameList1.add(GameModelList(img: PS_GameImg6));
  gameList1.add(GameModelList(img: PS_GameImg7));
  gameList1.add(GameModelList(img: PS_GameImg8));

  return gameList1;
}

List<GameModelList> getGameListGame2() {
  List<GameModelList> gameList2 = [];
  gameList2.add(GameModelList(img: PS_GameImg1));
  gameList2.add(GameModelList(img: PS_GameImg2));
  gameList2.add(GameModelList(img: PS_GameImg3));
  gameList2.add(GameModelList(img: PS_GameImg4));
  gameList2.add(GameModelList(img: PS_GameImg5));
  gameList2.add(GameModelList(img: PS_GameImg6));
  gameList2.add(GameModelList(img: PS_GameImg7));
  gameList2.add(GameModelList(img: PS_GameImg8));

  return gameList2;
}

List<GameModelList> getGameListGame3() {
  List<GameModelList> gameList3 = [];
  gameList3.add(GameModelList(img: PS_GameImg1));
  gameList3.add(GameModelList(img: PS_GameImg2));
  gameList3.add(GameModelList(img: PS_GameImg3));
  gameList3.add(GameModelList(img: PS_GameImg4));
  gameList3.add(GameModelList(img: PS_GameImg5));
  gameList3.add(GameModelList(img: PS_GameImg6));
  gameList3.add(GameModelList(img: PS_GameImg7));
  gameList3.add(GameModelList(img: PS_GameImg8));
  return gameList3;
}
