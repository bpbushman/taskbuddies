import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

loveIcon() => LikeButton(
      size: 20,
      circleColor:
          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? Colors.pink[200] : Colors.grey,
          size: 20,
        );
      },
      likeCount: 0,
      countBuilder: (int count, bool isLiked, String text) {
        var color = isLiked ? Colors.black87 : Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            "love",
            style: TextStyle(color: color),
          );
        } else
          result = Text(
            text,
            style: TextStyle(color: color),
          );
        return result;
      },
    );

commentIcon() => LikeButton(
      size: 20,
      circleColor:
          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.comment,
          color: isLiked ? Colors.blue : Colors.grey,
          size: 20,
        );
      },
      likeCount: 0,
      countBuilder: (int count, bool isLiked, String text) {
        var color = isLiked ? Colors.black87 : Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            "comment",
            style: TextStyle(color: color),
          );
        } else
          result = Text(
            text,
            style: TextStyle(color: color),
          );
        return result;
      },
    );

addBuddyIcon() => LikeButton(
      size: 20,
      circleColor:
          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.person_add,
          color: isLiked ? Colors.green : Colors.grey,
          size: 20,
        );
      },
      likeCount: 0,
      countBuilder: (int count, bool isLiked, String text) {
        var color = isLiked ? Colors.black87 : Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            "add Buddy",
            style: TextStyle(color: color),
          );
        } else
          result = Text(
            text,
            style: TextStyle(color: color),
          );
        return result;
      },
    );
