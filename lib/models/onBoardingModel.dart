import 'package:creartive/core/reusable_component/AssetsManager.dart';

class OnBoardingModel{

  String image;
  String title;
  String content;

  OnBoardingModel({required this.image,required this.title,required this.content});


  static List<OnBoardingModel> onBoardingList=[
    OnBoardingModel(image: AssetsManager.onboarding1,
        title: "Welcome to \n CreARTive",
        content: "Connect, showcase, and monetize your artistic journey in one vibrant community where creative portfolios meet eager clients."),
    OnBoardingModel(image: AssetsManager.onboarding2,
      title: "A Creative Space to \n Buy & Sell Art",
        content: "Seamlessly buy stunning artwork or sell your creative masterpieces in a dedicated marketplace built for artists, by artists."),
    OnBoardingModel(image: AssetsManager.onboarding3,
        title: "Grow with a \n Community of Creators!",
        content: "Chat directly with talented artists to commission unique, personalized creations tailored exactly to your vision."),
  ];

}