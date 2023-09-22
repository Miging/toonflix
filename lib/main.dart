import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}


// 타이머 예제
// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(
//             color: Color(0xFF232B55),
//           ),
//         ),
//         cardColor: const Color(0xFFF4EDDB),
//         colorScheme: ColorScheme.fromSwatch(
//           backgroundColor: const Color(0xFFE7626C),
//         ),
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

//Life Cycle
// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   // List<int> numbers = [];
//   // void onClicked() {
//   //setState->build재실행.
//   // setState(() {
//   //   numbers.add(numbers.length);
//   // });
//   // }
//   bool showTitle = true;

//   void toggleTitle() {
//     setState(() {
//       showTitle = !showTitle;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         textTheme: const TextTheme(
//           titleLarge: TextStyle(
//             color: Colors.red,
//           ),
//         ),
//       ),
//       home: Scaffold(
//         backgroundColor: const Color(0xFFF4EDDB),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               showTitle ? const MyLargeTitle() : const Text('nothing'),
//               IconButton(
//                   onPressed: toggleTitle,
//                   icon: const Icon(Icons.remove_red_eye)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyLargeTitle extends StatefulWidget {
//   const MyLargeTitle({
//     super.key,
//   });

//   @override
//   State<MyLargeTitle> createState() => _MyLargeTitleState();
// }

// class _MyLargeTitleState extends State<MyLargeTitle> {
//   //상태 초기화. 주 context에서 상태 가져오건,API상태 업데이트 등.
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print('Helloe');
//   }

//   //API 업데이트,이벤트 리스너 구독 취소, form리스너 벗어나기
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     print('dispose');
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('fjsdlkj');
//     return Text(
//       'My Large Title',
//       style: TextStyle(
//         fontSize: 30,
//         color: Theme.of(context).textTheme.titleLarge?.color,
//       ),
//     );
//   }
// }
// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color(0xFF181818),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 80,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Text(
//                           'Hey, Selena',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 28,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         Text(
//                           'Welcome back',
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.6),
//                             fontSize: 18,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 70,
//                 ),
//                 Text(
//                   'Total Balance',
//                   style: TextStyle(
//                     fontSize: 22,
//                     color: Colors.white.withOpacity(0.8),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   '\$5 194 482',
//                   style: TextStyle(
//                       fontSize: 48,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Button(
//                         text: 'Transfer',
//                         bgColor: Color(0xFFF1B33B),
//                         textColor: Colors.black),
//                     Button(
//                         text: 'Request',
//                         bgColor: Color(0xFF1F2123),
//                         textColor: Colors.white)
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 100,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Wallet',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 36,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Text(
//                       'View All',
//                       style: TextStyle(color: Colors.white.withOpacity(0.8)),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const CurrencyCard(
//                   name: 'Euro',
//                   code: 'EUR',
//                   amount: '6 428',
//                   icon: Icons.euro_rounded,
//                   isInverted: false,
//                   order: 0,
//                 ),
//                 const CurrencyCard(
//                   name: 'Bitcoin',
//                   code: 'BTC',
//                   amount: '6 428',
//                   icon: Icons.currency_bitcoin_rounded,
//                   isInverted: true,
//                   order: 1,
//                 ),
//                 const CurrencyCard(
//                   name: 'Dollar',
//                   code: 'USD',
//                   amount: 'amount',
//                   icon: Icons.money_off_csred_rounded,
//                   isInverted: false,
//                   order: 2,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
