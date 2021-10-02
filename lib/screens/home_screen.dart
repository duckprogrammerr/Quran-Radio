import 'package:audio_palyer/utils/appstyle.dart';
import 'package:audio_palyer/veiwmodel/audio_provider.dart';
import 'package:audio_palyer/veiwmodel/home_view.dart';
import 'package:audio_palyer/widgets/audio_widget.dart';
import 'package:audio_palyer/widgets/fav_list.dart';
import 'package:audio_palyer/widgets/radios_gridview_w.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    Provider.of<FavoritViewModel>(context, listen: false).getFavList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('المفضلة', style: AppStyle.bodyTitle),
                    FavListView(),
                    Text('الراديوات', style: AppStyle.bodyTitle),
                    //radio list in gridview
                    RadioGridView()
                  ],
                ),
              ),
            ),
            // ignore: unnecessary_null_comparison
            audioProvider.isSelected != -1 ? const AudioWidget() : Container(),
          ],
        ),
      ),
    );
  }
}
