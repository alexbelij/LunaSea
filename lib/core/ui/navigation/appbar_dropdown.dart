import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';

// ignore: non_constant_identifier_names
Widget LSAppBarDropdown({
    @required String title,
    @required List<String> profiles,
    List<Widget> actions
}) => profiles != null && profiles.length < 2
    ? LSAppBar(title: title, actions: actions)
    : AppBar(
    title: PopupMenuButton<String>(
        child: Wrap(
            direction: Axis.horizontal,
            children: [
                Text(title),
                LSIcon(icon: Icons.arrow_drop_down),
            ],
        ),
        onSelected: (result) => Database.lunaSeaBox.put(LunaSeaDatabaseValue.ENABLED_PROFILE.key, result),
        itemBuilder: (context) {
            return <PopupMenuEntry<String>>[for(String profile in profiles) PopupMenuItem<String>(
                value: profile,
                child: Text(profile),
            )];
        },
        tooltip: 'Switch Profiles',
    ),
    centerTitle: false,
    elevation: 0,
    actions: actions,
);
