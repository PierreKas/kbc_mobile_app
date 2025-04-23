// import 'package:flutter/material.dart';
// import 'package:kbc/components/icon.dart';
// import 'package:kbc/components/appbar_text.dart';
// import 'package:kbc/components/text_content.dart';
// import 'package:kbc/components/text_hearder.dart';
// import 'package:kbc/home/animeted_mission.dart';
// import 'package:kbc/models/channel_model.dart';
// import 'package:kbc/pages/anouncement.dart';
// import 'package:kbc/pages/home.dart';
// import 'package:kbc/pages/kingdom_homes.dart';
// import 'package:kbc/pages/offering.dart';
// import 'package:kbc/pages/membership_page.dart';
// import 'package:kbc/pages/teachings.dart';
// import 'package:kbc/services/api_service.dart';
// import 'package:kbc/youtube_channel/h_scr.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int navIndex = 0;
//   late Channel _channel;
//   bool _isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     _initChannel();
//   }

//   final List<Widget> _pages = [
//     const Home(),
//     // const Teachings(),
//     const HomeScreen(),
//     //const Programs(),
//     const MemberShirpForm(),
//     const Anouncements(),
//     const KingdomHomes(),
//     const Offerings(),
//   ];
//   _initChannel() async {
//     // Channel channel = await APIService.instance.fetchChannel(
//     //     //
//     //     channelId: 'UChxrG0UpwUiXPU4FIyu1Ltg'); //UCFvsly4u1JaSGu14etDO9Bg
//     // setState(() {
//     //   _channel = channel;
//     // });
//     try {
//       Channel channel = await APIService.instance.fetchChannel(
//         channelId: 'UChxrG0UpwUiXPU4FIyu1Ltg',
//       );
//       setState(() {
//         _channel = channel;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       // Handle error appropriately
//     }
//   }

//   // PreferredSizeWidget _buildProfileAppBar() {
//   //   return PreferredSize(
//   //     preferredSize: const Size.fromHeight(100.0),
//   //     child: AppBar(
//   //       backgroundColor: Colors.black,
//   //       title: Row(
//   //         children: <Widget>[
//   //           CircleAvatar(
//   //             backgroundColor: Colors.white,
//   //             radius: 20.0,
//   //             backgroundImage: NetworkImage(_channel.profilePictureUrl!),
//   //           ),
//   //           const SizedBox(width: 12.0),
//   //           Expanded(
//   //             child: Column(
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               children: <Widget>[
//   //                 Text(
//   //                   _channel.title!,
//   //                   style: const TextStyle(
//   //                     color: Colors.yellow,
//   //                     fontSize: 18.0,
//   //                     fontWeight: FontWeight.w600,
//   //                   ),
//   //                   overflow: TextOverflow.ellipsis,
//   //                 ),
//   //               ],
//   //             ),
//   //           )
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//   PreferredSizeWidget _buildProfileAppBar() {
//     if (_isLoading) {
//       return PreferredSize(
//         preferredSize: const Size.fromHeight(50.0),
//         child: AppBar(
//           backgroundColor: Colors.black,
//           title: const Center(
//             child: CircularProgressIndicator(
//               color: Colors.yellow,
//             ),
//           ),
//         ),
//       );
//     }

//     return PreferredSize(
//       preferredSize: const Size.fromHeight(60.0),
//       child: AppBar(
//         backgroundColor: Colors.black,
//         title: Row(
//           children: <Widget>[
//             CircleAvatar(
//               backgroundColor: Colors.white,
//               radius: 20.0,
//               backgroundImage: NetworkImage(_channel.profilePictureUrl!),
//             ),
//             const SizedBox(width: 12.0),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     _channel.title!,
//                     style: const TextStyle(
//                       color: Colors.yellow,
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Padding(
//       //     padding: EdgeInsets.only(left: 30),
//       //     child: MyAppBarText(content: 'Kingdom Believers Church'),
//       //   ),
//       //   backgroundColor: Colors.black,
//       // ),
//       appBar: _buildProfileAppBar(),
//       body: _pages[navIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (index) {
//           setState(() {
//             if (index == 0) {
//               //   Navigator.push(context,
//               //       MaterialPageRoute(builder: (context) => const Home()));
//               // } else if (index == 1) {
//               //   Navigator.push(context,
//               //       MaterialPageRoute(builder: (context) => const Teachings()));
//               // } else if (index == 2) {
//               //   Navigator.push(context,
//               //       MaterialPageRoute(builder: (context) => const Programs()));
//               // } else if (index == 3) {
//               //   Navigator.push(
//               //       context,
//               //       MaterialPageRoute(
//               //           builder: (context) => const Anouncements()));
//               // } else if (index == 4) {
//               //   Navigator.push(
//               //       context,
//               //       MaterialPageRoute(
//               //           builder: (context) => const KingdomHomes()));
//               // } else {
//               //   Navigator.push(context,
//               //       MaterialPageRoute(builder: (context) => const Offerings()));
//             }
//             navIndex = index;
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         currentIndex: navIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.grey,
//         selectedFontSize: 12,
//         unselectedFontSize: 10,
//         backgroundColor: Colors.black,
//         items: const [
//           BottomNavigationBarItem(
//               icon: MyIcon(myIcon: Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: MyIcon(myIcon: Icons.menu_book), label: 'Teachings'),
//           // BottomNavigationBarItem(
//           //     icon: MyIcon(myIcon: Icons.checklist_rtl_outlined),
//           //     label: 'Porgrams'),
//           BottomNavigationBarItem(
//               icon: MyIcon(myIcon: Icons.checklist_rtl_outlined),
//               label: 'Membership'),
//           BottomNavigationBarItem(
//               icon: MyIcon(myIcon: Icons.newspaper), label: 'Announcements'),
//           BottomNavigationBarItem(
//               icon: MyIcon(myIcon: Icons.house_siding_sharp),
//               label: 'join a cell'),
//           BottomNavigationBarItem(
//               icon: MyIcon(myIcon: Icons.volunteer_activism),
//               label: 'Offerings'),
//         ],
//       ),
//     );
//   }
// }
