import 'dart:io';

import 'package:creartive/core/reusable_component/AssetsManager.dart';

class Content{

  dynamic image;
  String title;
  String description;
  String price;

  Content(this.title, this.description,
   this.image, this.price);

  static List<Content> contents=[

  ];
}

class FixedList{

  static List<Content> fixedContent=[
    Content("illustration", " A bold geometric dog illustration"
        " with striking black, white, and red shapes,"
        " exuding a modern, artistic charm.   ", AssetsManager.Cat_woman, "4,000 LE"),

    Content("illustration",
        "A minimalist lighthouse illustration with a glowing beacon, standing tall on rocky shores, surrounded by seagulls and calm waters.  "
        , AssetsManager.lighthouse, "2,000 LE"),

    Content("illustration",
        " A bold geometric dog illustration with striking black, white, and red shapes, exuding a modern, artistic charm.    "
        , AssetsManager.dog, "4,000 LE"),

    Content("paint",
        "  A striking painting of a woman surrounded by red hands, symbolizing control, oppression, or inner turmoil with deep emotional impact.     "
        , AssetsManager.redhands, "5,000 LE"),


//3D

    Content("3D", "A detailed 3D teenage girl character with a beanie, hoodie, skirt, ripped leggings, and a skateboard. Ideal for games, animation, or collectibles.",
        AssetsManager.Dgirl, "9000"),
    Content("3D", "A stylized 3D boy character with messy hair, a cap, a hoodie, cropped pants, and chunky sneakers. He carries a backpack with playful details and has a confident, cheerful expression. Ideal for games, animation, or collectibles.",
    AssetsManager.Dboy, "8500"),
    Content("3D", "A stylized 3D fantasy character with a glowing skull-like face, fiery hair, and a mystical staff. Wrapped in a cloak with intricate details, standing on a dynamic base. Perfect for games, animation, or collectibles.",
    AssetsManager.Dchar, "12000"),
    Content("3D", "A highly detailed 3D warrior character with intricate armor, flowing robes, and a dragon-like shoulder piece. Designed for collectibles, games, or animation.",
   AssetsManager.Dman , "13000"),
    Content("3D", "This appears to be a highly detailed 3D character model inspired by anime, with a unique outfit design and expressive features. If you need information on pricing for similar 3D character models, I can help with estimates based on static or rigged versions.",
        AssetsManager.Dluffy, "15000"),
    Content("3D", "A stylized 3D boy character with an urban streetwear look, featuring a colorful hoodie, shorts, and trendy sneakers. Designed for animation, games, or collectibles.",
        AssetsManager.Dboyb, "7000"),
    Content("3D", "This is a highly stylized 3D character with exaggerated facial expressions and intricate clothing details. Are you looking for feedback on the design, information on modeling costs, or assistance with integrating such characters into a project?",
        AssetsManager.DWman, "9000"),

  ];


}

