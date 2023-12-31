import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonMedel>> webtoons = ApiService.getTodaysToons();

  ////stateful 일경우 처
  // List<WebtoonMedel> webtoons = [];
  // bool isLoading = true;
  // void waitForWebToons() async {
  //   webtoons = await ApiService.getTodaysToons();
  //   isLoading = false;
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   waitForWebToons();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonMedel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        print(index);
        var webtoon = snapshot.data![index];
        return Column(
          children: [Image.network(webtoon.thumb), Text(webtoon.title)],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}

//타이머예제
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   static const twentyFiveMinutes = 1500;
//   int totalSeconds = twentyFiveMinutes;
//   late Timer timer;
//   int totalPomodoros = 0;
//   bool isRunning = false;

//   void onTick(Timer timer) {
//     if (totalSeconds == 0) {
//       setState(() {
//         totalPomodoros += 1;
//         isRunning = false;
//         totalSeconds = twentyFiveMinutes;
//       });
//       timer.cancel();
//     } else {
//       setState(() {
//         totalSeconds -= 1;
//       });
//     }
//   }

//   void onStartPressed() {
//     timer = Timer.periodic(
//         const Duration(
//           seconds: 1,
//         ),
//         onTick);
//     setState(() {
//       isRunning = true;
//     });
//   }

//   void onPausePressed() {
//     timer.cancel();
//     setState(() {
//       isRunning = false;
//     });
//   }

//   void onResetPressed() {
//     if (isRunning) {
//       onPausePressed();
//     }
//     totalSeconds = twentyFiveMinutes;
//   }

//   String format(int seconds) {
//     var duration = Duration(seconds: seconds);
//     return duration.toString().split(".").first.substring(2, 7);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Column(
//         children: [
//           //유연한 UI
//           Flexible(
//             flex: 1,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               child: Text(
//                 format(totalSeconds),
//                 style: TextStyle(
//                     color: Theme.of(context).cardColor,
//                     fontSize: 89,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 3,
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     iconSize: 120,
//                     color: Theme.of(context).cardColor,
//                     onPressed: isRunning ? onPausePressed : onStartPressed,
//                     icon: Icon(
//                       isRunning
//                           ? Icons.pause_circle_outline
//                           : Icons.play_circle_outline,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: onResetPressed,
//                     iconSize: 48,
//                     icon: const Icon(Icons.restart_alt_outlined),
//                     color: Theme.of(context).cardColor,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).cardColor,
//                         borderRadius: BorderRadius.circular(50)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Pomodoros',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context)
//                                   .textTheme
//                                   .displayLarge!
//                                   .color),
//                         ),
//                         Text(
//                           '$totalPomodoros',
//                           style: TextStyle(
//                               fontSize: 58,
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context)
//                                   .textTheme
//                                   .displayLarge!
//                                   .color),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
