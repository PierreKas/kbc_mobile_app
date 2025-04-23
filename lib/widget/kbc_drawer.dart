import 'package:flutter/material.dart';
import 'package:kbc/colors/colors.dart';
import 'package:kbc/components/label.dart';
import 'package:kbc/components/text_hearder.dart';
import 'package:kbc/home/home_page.dart';
import 'package:kbc/pages/discipleship_classes.dart';
import 'package:kbc/pages/login.dart';
import 'package:kbc/pages/membership/member_details.dart';

class KBCDrawer extends StatelessWidget {
  const KBCDrawer({super.key});

  Widget _buildListTitle({
    required String title,
    required Widget icon,
    required void Function()? onTap,
  }) {
    return ListTile(
      title: TextFieldLabel(labelContent: title),
      leading: icon,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.white,
      child: ListView(
        children: [
          SizedBox(
            height: 160,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [MyColors.white.withOpacity(0.15), MyColors.amber],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(color: MyColors.white, width: 8),
                    ),
                    child: Image.asset(
                      height: 52,
                      width: 52,
                      'assets/kbc_logo.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const MyTextHeader(content: 'Kingdom Believers Church'),
                ],
              ),
            ),
          ),
          _buildListTitle(
            title: 'About us',
            icon: const Icon(
              Icons.menu_book_rounded,
              color: MyColors.amber,
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePages()));
            },
          ),
          const Divider(
            color: Colors.amber,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),
          _buildListTitle(
            title: 'Membership details',
            icon: const Icon(
              Icons.menu_book_rounded,
              color: MyColors.amber,
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MemberDetails()));
            },
          ),
          const Divider(
            color: Colors.amber,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),
          _buildListTitle(
            title: 'Discipleship classes',
            icon: const Icon(
              Icons.menu_book_rounded,
              color: MyColors.amber,
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DiscipleshipClasses()));
            },
          ),
          // const Divider(
          //   color: Colors.amber,
          //   height: 20,
          //   indent: 20,
          //   endIndent: 20,
          // ),
          // _buildListTitle(
          //   title: 'Kingdom Homes',
          //   icon: const Icon(
          //     Icons.menu_book_rounded,
          //     color: MyColors.amber,
          //   ),
          //   onTap: () {
          //     Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => const LoginPage()));
          //   },
          // ),
          const Divider(
            color: Colors.amber,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),
          _buildListTitle(
            title: 'Logout',
            icon: const Icon(
              Icons.logout,
              color: MyColors.bordeauxRed,
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
          //  const Divider(
          //   color: Colors.amber,
          //   height: 20,
          //   indent: 20,
          //   endIndent: 20,
          // ),
          // _buildListTitle(
          //   title: 'Offerings',
          //   icon: const Icon(
          //     Icons.volunteer_activism,
          //     color: MyColors.amber,
          //   ),
          //   onTap: () {},
          // ),
          // const Divider(
          //   color: Colors.amber,
          //   height: 20,
          //   indent: 20,
          //   endIndent: 20,
          // ),
          // _buildListTitle(
          //   title: 'Announcements',
          //   icon: const Icon(
          //     Icons.newspaper,
          //     color: MyColors.amber,
          //   ),
          //   onTap: () {},
          // ),
          // const Divider(
          //   color: Colors.amber,
          //   height: 20,
          //   indent: 20,
          //   endIndent: 20,
          // ),
          // _buildListTitle(
          //   title: 'Teachings',
          //   icon: const Icon(
          //     Icons.video_collection,
          //     color: MyColors.amber,
          //   ),
          //   onTap: () {},
          // ),
          // const Divider(
          //   color: Colors.amber,
          //   height: 20,
          //   indent: 20,
          //   endIndent: 20,
          // ),
          // _buildListTitle(
          //   title: 'Church commisions',
          //   icon: const Icon(
          //     Icons.menu_book_rounded,
          //     color: MyColors.amber,
          //   ),
          //   onTap: () {},
          // ),
          // const Divider(
          //   color: Colors.amber,
          //   height: 20,
          //   indent: 20,
          //   endIndent: 20,
          // ),
          // _buildListTitle(
          //   title: 'Contact us',
          //   icon: const Icon(
          //     Icons.menu_book_rounded,
          //     color: MyColors.amber,
          //   ),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
