import 'package:flutter/material.dart';
import 'package:kbc/colors/colors.dart';
import 'package:kbc/components/appbar_text.dart';

class KBCAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showDrawer;

  const KBCAppBar({
    super.key,
    required this.title,
    this.showDrawer = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.bordeauxRed,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: MyColors.white, width: 3),
            ),
            child: Image.asset(
              height: 28,
              width: 28,
              'assets/kbc_logo.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          MyAppBarText(content: title),
        ],
      ),
      iconTheme: const IconThemeData(color: MyColors.amber),
      // Only show drawer icon if showDrawer is true
      leading: showDrawer
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
