// import 'package:artroad/src/model/condetail.dart';
// import 'package:artroad/src/provider/condetail_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ConcertDetailPage extends StatelessWidget {
  
//   late ConcertDetailProvider _concertDetailProvider;

//   ConcertDetailPage({super.key});

//   Widget _makeConcertDetailOne(ConcertDetail concertDetail) {
//     return Row(
//       children: [
//         Expanded(
//             child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 concertDetail.mt20id.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
              
//                Text(
//                 concertDetail.prfnm.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
// Text(
//                 concertDetail.poster.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               Text(
//                 concertDetail.prfpdfrom.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               Text(
//                 concertDetail.prfpdto.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               Text(
//                 concertDetail.prfruntime.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               Text(
//                 concertDetail.prfage.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               Text(
//                 concertDetail.genrenm.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//                Text(
//                 concertDetail.fcltynm.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               Text(
//                 concertDetail.styurls.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//             ],
//           ),
//         ))
//       ],
//     );
//   }

//   Widget _makeListView(List<ConcertDetail> concerts) {
//     return ListView.separated(
//       itemCount: concerts.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//             height: 300, 
//             color: Colors.white, 
//             child: _makeConcertDetailOne(concerts[index]));
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return const Divider();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     _concertDetailProvider = Provider.of<ConcertDetailProvider>(context, listen: false);
//     _concertDetailProvider.loadConcertDetails(); 

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Concert Detail Page'),
//       ),
//       body: Consumer<ConcertDetailProvider>(builder: (context, provider, wideget) {
//         if (provider.concertDetails.isNotEmpty) {
//           return _makeListView(provider.concertDetails);
//         }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       )
//     );
//   }
// }