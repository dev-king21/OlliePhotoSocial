import 'package:ollie_photo_social/model/this_that.dart';
import 'package:ollie_photo_social/mock_data/user_data.dart';

final List<ThisThat> thisThatList = [
  ThisThat(
    thisImageUrls: [
      'this1.png',
      'that3.png',
    ],
    thatImageUrls: [
      'this2.png',
      'that3.png',
    ],
    user: userList[0],
    title: 'Which one will you choose?',
    time: '5m',
    isGroup: true,
  ),
  ThisThat(
    thisImageUrls: [
      'this3.png',
      'this1.png',
      'this2.png',
    ],
    thatImageUrls: [
      'that2.png',
      'that1.png',
      'that3.png',
    ],
    user: userList[4],
    title: 'I\'m confuse to choose watch or notebook?',
    time: '5m',
    isGroup: true,
  ),
  ThisThat(
    thisImageUrls: [
      'this2.png',
      'this1.png',
      'this3.png',
    ],
    thatImageUrls: [
      'that3.png',
      'that2.png',
      'that1.png',
    ],
    user: userList[3],
    title: 'Help me to decide',
    time: '5m',
    isGroup: true,
  ),
  ThisThat(
    thisImageUrls: [
      'this1.png',
      'this2.png',
      'this3.png',
    ],
    thatImageUrls: [
      'that1.png',
      'that2.png',
      'that3.png',
    ],
    user: userList[2],
    title: 'Do you like these',
    time: '5m',
    isGroup: true,
  ),
  ThisThat(
    thisImageUrls: [
      'this1.png',
      'that1.png',
    ],
    thatImageUrls: [
      'this2.png',
      'that2.png',
    ],
    user: userList[5],
    title: 'Do you like these',
    time: '5m',
    isGroup: true,
  ),
];
