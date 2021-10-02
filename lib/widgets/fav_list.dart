import 'package:audio_palyer/data/radio_list.dart';
import 'package:audio_palyer/models/radio_model.dart';
import 'package:audio_palyer/utils/appstyle.dart';
import 'package:audio_palyer/veiwmodel/audio_provider.dart';
import 'package:audio_palyer/veiwmodel/home_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavListView extends StatelessWidget {
  const FavListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritProvider = Provider.of<FavoritViewModel>(context);

    return SizedBox(
      height: 250,
      child: Center(
        child: favoritProvider.favList.isNotEmpty
            ? Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: favoritProvider.favList.length,
                  itemBuilder: (context, index) {
                    return FavWidget(favoritProvider.favList[index]);
                  },
                ),
              )
            : const Text(
                'لايوجد',
                style: AppStyle.bodyTitle,
              ),
      ),
    );
  }
}

class FavWidget extends StatefulWidget {
  final RadioModel r;

  const FavWidget(this.r, {Key? key}) : super(key: key);

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final favoritProvider = Provider.of<FavoritViewModel>(context);
    final audioProvider = Provider.of<AudioProvider>(context);
    return Container(
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color(0xff334756),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(blurRadius: 4.0, spreadRadius: 3.0, color: Colors.grey)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              widget.r.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(
                    audioProvider.isSelected == radios.indexOf(widget.r) &&
                            audioProvider.isPause == false
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.green,
                    size: 36.0,
                  ),
                  onPressed: () => audioProvider.selectedRadio(widget.r)),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red[400],
                  size: 36,
                ),
                onPressed: () {
                  favoritProvider.deleteFav(widget.r);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
