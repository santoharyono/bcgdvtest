import 'package:bcgdvtest/src/component/song_item.component.dart';
import 'package:bcgdvtest/src/const/App_const.dart';
import 'package:bcgdvtest/src/screen/home/home_view_model.dart';
import 'package:bcgdvtest/src/util/string_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel _viewModel;
  Size _screenSize;
  TextEditingController _searchController;
  int previousIndex = 0;

  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).initAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _searchController = TextEditingController();
    _viewModel = Provider.of<HomeViewModel>(context);
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple song search preview'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          hintText: 'Search artist...'),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _viewModel.getSongList(
                              artist: _searchController.text);
                        }),
                  )
                ],
              )),
              Expanded(
                  flex: 8,
                  child: ListView.separated(
                    itemCount: _viewModel.songList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final song = _viewModel.songList[index];
                      return Container(
                          height: 80,
                          width: _screenSize.width,
                          child: SongItem(
                              onTap: () {
                                _viewModel.playSong(song.previewUrl);
                                _showBottomSheet(context, song.previewUrl);
                                _viewModel.songList[previousIndex].isSelected =
                                    false;
                                previousIndex = index;
                                _viewModel.songList[index].isSelected = true;
                              },
                              songTitle:
                                  StringUtil.shortenString(song.trackName),
                              album:
                                  StringUtil.shortenString(song.collectionName),
                              artist: StringUtil.shortenString(song.artistName),
                              imageUrl: song.artworkUrl,
                              playSignWidget:
                                  _viewModel.songList[index].isSelected &&
                                          _viewModel.isPlaying
                                      ? Image.asset(
                                          AppImage.playingIndicatorImage,
                                          height: _screenSize.height,
                                          width: _screenSize.width,
                                        )
                                      : null));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ))
            ],
          ),
        ));
  }

  void _showBottomSheet(BuildContext context, String trackUrl) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: IconButton(
                            icon: Icon(Icons.fast_rewind_rounded),
                            onPressed: () {}),
                      )),
                      Expanded(
                          child: Container(
                        child: IconButton(
                            icon: _viewModel.isPlaying
                                ? Icon(Icons.pause_outlined)
                                : Icon(Icons.play_arrow_rounded),
                            onPressed: () {
                              _viewModel.isPaused
                                  ? _viewModel.playSong(trackUrl)
                                  : _viewModel.pauseSong();
                            }),
                      )),
                      Expanded(
                          child: Container(
                        child: IconButton(
                            icon: Icon(Icons.fast_forward_rounded),
                            onPressed: () {}),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
