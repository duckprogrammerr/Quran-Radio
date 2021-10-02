import 'package:audio_palyer/data/radio_list.dart';
import 'package:audio_palyer/utils/appstyle.dart';
import 'package:audio_palyer/veiwmodel/audio_provider.dart';
import 'package:audio_palyer/veiwmodel/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioGridView extends StatelessWidget {
  const RadioGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritProvider = Provider.of<FavoritViewModel>(context);
    final audioProvider = Provider.of<AudioProvider>(context);
    return GridView.builder(
      shrinkWrap: true,
      itemCount: radios.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (ctx, i) {
        return Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: const Color(0xff334756),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const <BoxShadow>[
              BoxShadow(blurRadius: 4.0, spreadRadius: 3.0, color: Colors.grey)
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  radios[i].name,
                  style: AppStyle.bodyText,
                ),
              ),
              Row(children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite_outline_sharp,
                    color: Colors.red[400],
                    size: 33,
                  ),
                  onPressed: () {
                    favoritProvider.addFav(radios[i]);
                  },
                ),
                IconButton(
                  icon: Icon(
                    audioProvider.isSelected == i &&
                            audioProvider.isPause == false
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.green,
                    size: 33,
                  ),
                  onPressed: () => audioProvider.selectedRadio(radios[i]),
                )
              ])
            ],
          ),
        );
      },
    );
  }
}
