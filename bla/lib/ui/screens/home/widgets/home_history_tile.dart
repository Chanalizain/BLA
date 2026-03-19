import 'package:blabla/ui/screens/home/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';

class HomeHistoryTile extends StatelessWidget {
  const HomeHistoryTile({super.key, required this.ridePref, this.onPressed});

  final RidePreference ridePref;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return ListTile(
      onTap: onPressed,
      leading: Icon(Icons.history, color: BlaColors.iconLight),

      title: Text(
        viewModel.getHistoryTitle(ridePref), style: BlaTextStyles.body),
      subtitle: Text(
        viewModel.getHistorySubtitle(ridePref),
        style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
      ),

      trailing: Icon(
        Icons.arrow_forward_ios,
        color: BlaColors.iconLight,
        size: 16,
      ),
    );
  }
}
