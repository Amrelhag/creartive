import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  static const String routeName="events";
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> events = [
      {
        "date": "14\nFeb", 
        "image": "assets/images/event1.png",
        "title": "Art Exhibition",
        "location": "Exhibition Hall",
        "description": "A special evening gathering with striking purple ambient lighting highlighting a central art piece. The spacious venue becomes truly immersive for this Valentine's Day special event, combining art appreciation with social networking."
      },
      {
        "date": "23\nMar", 
        "image": "assets/images/event2.png",
        "title": "Art Exhibition Opening",
        "location": "Art Gallery",
        "description": "An elegant art exhibition opening featuring contemporary works. Attendees are engaging with the artwork and socializing in an intimate space, attracting both art enthusiasts and cultural explorers looking to discover new artistic talent."
      },
      {
        "date": "1\nAPR", 
        "image": "assets/images/event3.png",
        "title": "Modern Art Exhibition",
        "location": "Modern Art Gallery",
        "description": "A vibrant exhibition featuring colorful contemporary artwork displayed in a spacious gallery. Attracts art lovers seeking innovative visual expressions."
      },
      {
        "date": "15\nMay", 
        "image": "assets/images/event4.png",
        "title": "Contemporary Art Showcase",
        "location": "Contemporary Gallery Space",
        "description": "An intimate art showcase featuring bright, expressive paintings in a minimalist gallery with generous floor space and natural lighting. Ideal for those interested in emerging artists and contemporary visual styles."
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE8ECF4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF210C54), size: 30),
          onPressed: () {Navigator.pop(context);},
        ),
        title: const Text(
          "Upcoming Events",
          style: TextStyle(
            color: Color(0xFF210C54),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(eventDetails: events[index]),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, spreadRadius: 2),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      events[index]["image"]!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[300],
                          child: const Center(child: Text("Image not found")),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        events[index]["date"]!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EventDetailsScreen extends StatelessWidget {
  final Map<String, String> eventDetails;
  
  const EventDetailsScreen({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECF4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF210C54), size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Upcoming Events",
          style: TextStyle(
            color: Color(0xFF210C54),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  eventDetails["image"]!,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.grey[300],
                      child: const Center(child: Text("Image not found")),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      eventDetails["date"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date: ${eventDetails["date"]!.replaceAll('\n', ' ')}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Location: ${eventDetails["location"]!}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                eventDetails["title"]!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF210C54),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Description:",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF210C54),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                eventDetails["description"]!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}