import 'package:artroad/presentation/services/firebase_firestore_services.dart';
import 'package:artroad/src/model/profile_concert.dart';
import 'package:artroad/src/provider/user_provider.dart';
import 'package:artroad/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_items_tile.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    String userId = userProvider.firebaseUserId!;
    
    final FirebaseStoreService firebaseStoreService = FirebaseStoreService();
    Future<List<ProfileConcert>> likedConcertListFuture = firebaseStoreService.getUserMypageConcert(userId);

     return FutureBuilder<List<ProfileConcert>>(
      future: likedConcertListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<ProfileConcert> likedConcertList = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  const CustomHeader(
                    name: '관심공연 목록',
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                        itemCount: likedConcertList.length,
                        itemBuilder: (context, index) {
                          return FavoriteItemsTile(likedConcertList[index]);
                      },
                    )
                  ],
                ),
              );
          } else {
            throw Exception('Widget cannot be null');
          }
        } else {
          return (
            const Center(
              child: SizedBox( width: 30, height: 30, child: CircularProgressIndicator()))
          );
          }
      }
     );
  }
}