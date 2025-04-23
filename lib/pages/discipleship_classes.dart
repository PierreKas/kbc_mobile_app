import 'package:flutter/material.dart';
import 'package:kbc/colors/colors.dart';
import 'package:kbc/components/buttons.dart';
import 'package:kbc/widget/kbc_appbar.dart';
import 'package:kbc/widget/kbc_drawer.dart';

class DiscipleshipClasses extends StatelessWidget {
  const DiscipleshipClasses({super.key});

  Widget _classesDetails(
    String level,
    String classTitle,
    String classUpdate,
    bool isRegistrationOpened,
  ) {
    return SizedBox(
      height: 400,
      width: 600,
      child: Container(
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
              offset: const Offset(0,
                  5), //Reduce the power of shadow on the top of the container
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  level,
                  style: const TextStyle(
                    color: MyColors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      thickness: 4,
                      endIndent: 90,
                      indent: 90,
                      color: MyColors.amber,
                    ),
                    Text(
                      classTitle, // 'Les affermissement de base des disciples',
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      classUpdate,
                      style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: MyColors.black,
                          fontWeight: FontWeight.w800),
                    ),
                    isRegistrationOpened
                        ? MyButtons(onPressed: () {}, text: 'Register')
                        : const Text(
                            'Registration is not opened for this class, please wait for a new opportunity',
                            style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KBCAppBar(title: 'Dicipleship Classes'),
      drawer: const KBCDrawer(),
      // AppBar(
      //   backgroundColor: MyColors.black,
      //   title: Row(
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: Image.asset(
      //           height: 30,
      //           width: 30,
      //           'assets/kbc_logo.jpeg',
      //         ),
      //       ),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       const MyAppBarText(content: 'Dicipleship Classes'),
      //     ],
      //   ),
      // ),
      // backgroundColor: MyColors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [MyColors.amber.withOpacity(0.15), MyColors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
              top: true,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    _classesDetails(
                      'Class 1',
                      'Les affermissements de base',
                      'currently studying lesson 13',
                      false,
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 20,
                      //thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _classesDetails(
                      'Class 2',
                      'Les affermissements approfondis pour les disciples',
                      'currently studying lesson 10',
                      false,
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 20,
                      //thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _classesDetails(
                      'Class 3',
                      'Part 1: Intimité avec le Sanit-Esprit\n Part 2: Consécration',
                      'currently studying lesson 2 (part 2)',
                      true,
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 20,
                      //thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _classesDetails(
                      'Class 4',
                      'Part 1: Intercession\n Part 2: Dieu parle comment l\'écouter',
                      'The class will start next week',
                      true,
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 20,
                      //thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _classesDetails(
                      'Class 5',
                      'Evangelisation',
                      'Next weekend will be the crusade',
                      false,
                    ),
                    const Divider(
                      color: MyColors.white,
                      height: 20,
                      //thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _classesDetails(
                      'Class 6',
                      'Discipolat et communication biblique',
                      'You will be informed once available, but you can start registering',
                      true,
                    ),
                    const Divider(
                      color: MyColors.white,
                      height: 20,
                      //thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _classesDetails(
                      'Class 7',
                      'Eglise famille selon DIEU',
                      'Started last week',
                      false,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
