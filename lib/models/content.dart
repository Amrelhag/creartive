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

    Content("illustration",
        "  A striking painting of a woman surrounded by red hands, symbolizing control, oppression, or inner turmoil with deep emotional impact.     "
        , AssetsManager.redhands, "5,000 LE"),



    Content("illustration",
        "  A striking painting of a woman surrounded by red hands, symbolizing control, oppression, or inner turmoil with deep emotional impact.     "
        , AssetsManager.redhands, "5,000 LE"),
    Content("illustration",
        "  A striking painting of a woman surrounded by red hands, symbolizing control, oppression, or inner turmoil with deep emotional impact.     "
        , AssetsManager.redhands, "5,000 LE"),
    Content("illustration",
        "  A striking painting of a woman surrounded by red hands, symbolizing control, oppression, or inner turmoil with deep emotional impact.     "
        , AssetsManager.redhands, "5,000 LE"),
    Content("illustration",
        "  A striking painting of a woman surrounded by red hands, symbolizing control, oppression, or inner turmoil with deep emotional impact.     "
        , AssetsManager.redhands, "5,000 LE"),


  ];


}

