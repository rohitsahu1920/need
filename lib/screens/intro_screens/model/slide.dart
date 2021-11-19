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
    title: "Donate Food",
    description:
        "On average women are likely to need between 1,600 and 2,400 calories a day, and men from 2,000 to 3,000.",
  ),
  SlideModel(
    imageUrl: Assets.slideImage2,
    title: "Home Sweet home",
    description:
        "Home is not a place…it’s a feeling.",
  ),
  SlideModel(
    imageUrl: Assets.slideImage3,
    title: "Just Clothing",
    description:
        "Clothing can insulate against cold or hot conditions, and it can provide a hygienic barrier, keeping infectious and toxic materials away from the body.",
  ),
  SlideModel(
    imageUrl: Assets.slideImage4,
    title: "Medicine",
    description:
    "There's nothing more important than our good health - that's our principal capital asset.",
  ),
];
