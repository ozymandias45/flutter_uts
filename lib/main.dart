import 'package:flutter/material.dart';
import 'pages/new-user/firstPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(child: Text("Chat")),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey.shade600,
//         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
//         unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
//         type: BottomNavigationBarType.fixed,
//         items: [
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             label: "Chats",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group_work),
//             label: "Channels",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_box),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }
