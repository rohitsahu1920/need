import 'package:need_flutter_app/utils/assets.dart';

class SlideModel {
  final String imageUrl;
  final String title;
  final String description;

  SlideModel({required this.imageUrl, required this.title, required this.description});
}

final slideList = [
  SlideModel(
    imageUrl: Assets.slideImage1,
    title: "Assign & Track Task Status",
    description:
        "Every process and every action occurs in the palm of your hand.",
  ),
  SlideModel(
    imageUrl: Assets.slideImage2,
    title: "Track Location & Duration",
    description:
        "Every process and every action occurs in the palm of your hand.",
  ),
  SlideModel(
    imageUrl: Assets.slideImage3,
    title: "Video Calling & Text Chat",
    description:
        "Every process and every action occurs in the palm of your hand.",
  ),
  SlideModel(
    imageUrl: Assets.slideImage4,
    title: "Manage & Assign task easily",
    description:
        "Every process and every action occurs in the palm of your hand.",
  ),
];
