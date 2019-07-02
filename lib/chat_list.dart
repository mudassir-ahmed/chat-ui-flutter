import 'package:flutter/material.dart';

// Documentaion used:
// ListTile - https://api.flutter.dev/flutter/material/ListTile-class.html
// https://api.flutter.dev/flutter/widgets/FittedBox-class.html
// https://api.flutter.dev/flutter/material/Card-class.html
// I originally used ListTile but that was promblematic

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Messages',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                    padding: EdgeInsets.all(20.0), child: Icon(Icons.search)),
              )
            ],
          ),
        ),
        _ChatItem(
            'Bushra Martinez',
            'https://cdn-images-1.medium.com/max/1200/1*3X2tLj85Jfq3dlGxWqQ4TA.png',
            7,
            true,
            'On my way to the gym but I need to go to the supplement store to buy some BCAAs. On my way to the gym but I needed to stop at the supplement store to buy some BCAAs On my way to the gym but I needed to stop by the supplement store to buy some BCAAs.'),
        _ChatItem(
            'Zainab Khan',
            'https://www.thenational.ae/image/policy:1.696524:1516870898/DTrCaEnXUAAIGi2.jpg?f=16x9&w=1200',
            2,
            false,
            'Rahhhh... I saw u with bushra'),
        _ChatItem(
            'Kylie Jenner',
            'https://pbs.twimg.com/profile_images/1114924576679424000/budLZeGp_400x400.jpg',
            0,
            true,
            'Great seeing you. I have to go now. I\'ll talk to you later.'),
        _ChatItem(
            'Chloe Sims',
            'https://modelstudents.co.uk/assets/models/176/176-profile-image-1525428232-thumb.jpg',
            0,
            false,
            'Please follow me on insta x'),
        _ChatItem(
            'Stefflon Don',
            'http://hdqwalls.com/wallpapers/stefflon-don-9o.jpg',
            0,
            false,
            'Why haven\'t aliens visited our solar system? They looked at the reviews and we only have one star.'),
        _ChatItem(
            'kim kardashian',
            'https://akns-images.eonline.com/eol_images/Entire_Site/2017618/rs_765x1024-170718174545-765.Kim-Kardashian-Mascara.jl.071817.jpg?fit=inside|900:auto&output-quality=90',
            0,
            false,
            'Please follow me on insta x'),
        Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 10),
          child: Text(
            'no more messages',
            style: TextStyle(color: Colors.grey[350]),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class _ChatItem extends StatelessWidget {
  final String imgURL, name, message;
  final int unread;
  final bool active;

  _ChatItem(this.name, this.imgURL, this.unread, this.active, this.message);

  Widget _activeIcon(isActive) {
    if (isActive) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(3),
          width: 16,
          height: 16,
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: Color(0xff43ce7d), // flat green
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 12.0),
              child: Stack(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      print('You want to see the display pictute.');
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(this.imgURL),
                      radius: 30.0,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: _activeIcon(active),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.name,
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4.0),
                        child: Text(this.message,
                            style: TextStyle(
                                color: Colors.grey, fontSize: 15, height: 1.1),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      )
                    ],
                  )),
            ),
            Column(
              children: <Widget>[
                Text('15 min', style: TextStyle(color: Colors.grey[350])),
                _UnreadIndicator(this.unread),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _UnreadIndicator extends StatelessWidget {
  final int unread;

  _UnreadIndicator(this.unread);

  @override
  Widget build(BuildContext context) {
    if (unread == 0) {
      return Container(); // return empty container
    } else {
      return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 30,
                color: Color(0xff3e5aeb),
                width: 30,
                padding: EdgeInsets.all(0),
                alignment: Alignment.center,
                child: Text(
                  unread.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              )));
    }
  }
}
