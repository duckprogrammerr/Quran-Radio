import 'package:audio_palyer/utils/appstyle.dart';
import 'package:audio_palyer/utils/colors.dart';
import 'package:audio_palyer/veiwmodel/audio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioWidget extends StatelessWidget {
  const AudioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: kDarkBlueColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: audioProvider.isPause
                  ? const Icon(
                      Icons.play_arrow,
                    )
                  : const Icon(
                      Icons.pause,
                    ),
              color: Colors.white,
              iconSize: 30,
              onPressed: () => audioProvider.switcher(),
            ),
            Text(
              audioProvider.r.name,
              style: AppStyle.selectedRadioTFont,
            ),
          ],
        ),
      ),
    );
  }
}
