import 'package:artroad/src/ui/calendar/concert_page.dart';
import 'package:artroad/src/ui/facdetail_page.dart';
import 'package:flutter/material.dart';
import 'package:artroad/src/ui/search/concert_page.dart';
import 'package:artroad/src/ui/search/facility_page.dart';
import 'package:artroad/src/ui/condetail_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConcertSearchPage()),
                );
              },
              child: const Text('Concert search'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConcertCalendarPage()),
                );
              },
              child: const Text('Concert Calendar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FacilityPage()),
                );
              },
              child: const Text('Facility'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FacilityDetailPage()),
                );
              },
              child: const Text('Facility Detail'),
            ),
          ],
        ),
      ),
    );
  }
}