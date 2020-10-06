import 'package:bcgdvtest/src/const/App_const.dart';
import 'package:flutter/material.dart';

class SongItem extends StatelessWidget {
  const SongItem(
      {Key key,
      this.songTitle,
      this.artist,
      this.album,
      this.imageUrl,
      this.onTap,
      this.playSignWidget});

  final String songTitle;
  final String artist;
  final String album;
  final String imageUrl;
  final Function onTap;
  final Widget playSignWidget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white),
                    child: imageUrl != null || imageUrl.isNotEmpty
                        ? Image.network(
                            imageUrl,
                            height: size.height,
                            width: size.width,
                          )
                        : Image.asset(
                            AppImage.defaultImageSong,
                            height: size.height,
                            width: size.width,
                          )),
              ),
            )),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          songTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft, child: Text(artist)),
                      Align(alignment: Alignment.centerLeft, child: Text(album))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: playSignWidget,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
