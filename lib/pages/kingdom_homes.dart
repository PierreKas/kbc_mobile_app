import 'package:flutter/material.dart';
import 'package:kbc/colors/colors.dart';
import 'package:kbc/widget/kbc_appbar.dart';
import 'package:kbc/widget/kbc_drawer.dart';

class KingdomHomes extends StatelessWidget {
  const KingdomHomes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: MyColors.black,
      appBar: const KBCAppBar(title: 'Kingdom Homes'),
      drawer: const KBCDrawer(),
      body: ListView.builder(
        itemCount: 21,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              _CellList(
                homeCellLeader: 'Christella',
                homeCellName: 'Rukiri 1',
                leaderPhoneNumber: '+250 000 000 000',
                hostHouseAddress: '',
              ),
              SizedBox(
                height: 10,
              ),
              _CellList(
                homeCellLeader: 'Christella',
                homeCellName: 'Rukiri 1',
                leaderPhoneNumber: '+250 000 000 000',
                hostHouseAddress: '',
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CellList extends StatelessWidget {
  final homeCellName;
  final homeCellLeader;
  final leaderPhoneNumber;
  final hostHouseAddress;
  const _CellList({
    super.key,
    required this.homeCellName,
    required this.homeCellLeader,
    required this.leaderPhoneNumber,
    this.hostHouseAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
          child: ListTile(
            title: Text(homeCellName),
            titleTextStyle: const TextStyle(
              color: MyColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      homeCellLeader,
                      style: const TextStyle(color: MyColors.black),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          leaderPhoneNumber,
                          style: const TextStyle(color: MyColors.black),
                        )
                      ],
                    )
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.location_on_outlined,
                    color: MyColors.bordeauxRed,
                  ),
                  onPressed: () {
                    hostHouseAddress;
                  },
                  iconSize: 30,
                  color: MyColors.white,
                )
              ],
            ),
            subtitleTextStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              color: MyColors.amber,
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}

// class _CellList extends StatelessWidget {
//   const _CellList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoPageScaffold(
//       child: CustomScrollView(
//         slivers: [
//           CupertinoSliverNavigationBar(
//             automaticallyImplyLeading: false,
//           ),
//           SliverPadding(
//             padding: EdgeInsetsGeometry.infinity,
//             sliver: SliverLis,
//           )
//         ],
//       ),
//     );
//   }
// }
