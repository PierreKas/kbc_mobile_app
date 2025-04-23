import 'package:flutter/material.dart';
import 'package:kbc/colors/colors.dart';
import 'package:kbc/components/label.dart';
import 'package:kbc/components/text_content.dart';
import 'package:kbc/components/text_hearder.dart';
import 'package:kbc/home/animeted_mission.dart';
import 'package:kbc/widget/kbc_appbar.dart';
import 'package:kbc/widget/kbc_drawer.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KBCAppBar(title: 'Kingdom Believers Church'),
      drawer: const KBCDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [MyColors.amber.withOpacity(0.15), MyColors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
            child: Column(
              children: [
                _buildContainer(
                    title: 'VISION',
                    content:
                        'To have a delivered heart with the kingdom mindset'),
                const SizedBox(
                  height: 10,
                ),
                const AnimatedMissionContainer(),
                const SizedBox(
                  height: 10,
                ),
                _buildContainer(
                  title: 'THEME OF THE YEAR',
                  content:
                      'Receiving GOD\'s wisdom and discernment by the Holy Spirit',
                  footer: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: MyColors.bordeauxRed,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // child: const MyTextContent(
                    //   content: '2025',
                    // ),
                    child: const Text(
                      '2025',
                      style: TextStyle(
                          color: MyColors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer({
    required String title,
    required String content,
    Widget? footer,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.3),
            blurRadius:
                10, //The more I add this value, the more the shadow increase the size outside the container
            offset: const Offset(
                0, 5), //Reduce the power of shadow on the top of the container
          ),
        ],
      ),
      child: Column(
        children: [
          MyTextHeader(
            content: title,
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 4,
            endIndent: 90,
            indent: 90,
            color: MyColors.amber,
          ),
          MyTextContent(content: content),
          Container(
            child: footer,
          )
        ],
      ),
    );
  }

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
}
