import 'package:artroad/src/ui/facdetail_page.dart';
import 'package:flutter/material.dart';
import 'package:artroad/src/ui/concert_page.dart';
import 'package:artroad/src/ui/facility_page.dart';
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
                  MaterialPageRoute(builder: (context) => ConcertPage()),
                );
              },
              child: const Text('Concert'),
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
                  MaterialPageRoute(builder: (context) => ConcertDetailPage()),
                );
              },
              child: const Text('Concert Detail'),
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