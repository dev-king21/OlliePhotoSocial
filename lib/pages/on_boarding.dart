import 'package:flutter/material.dart';
import 'package:ollie_photo_social/components/bottom_next.dart';
import 'package:ollie_photo_social/components/rounded_raised_button.dart';
import 'package:ollie_photo_social/constants.dart';
import 'package:ollie_photo_social/pages/explore.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int step = 0;
  List<bool> interestedCats = List.generate(8, (index) => false);

  void setInterestCats(int idx) {
    setState(() {
      interestedCats[idx] = !interestedCats[idx];
    });
  }

  List<Widget> _buildStepIcon() {
    List<Widget> stepIcon = [];
    for (var idx = 0; idx < 4; idx++) {
      stepIcon.add(
        SizedBox(
          width: 12,
          child: Icon(
            Icons.circle,
            size: 8,
            color: step == idx ? primaryColor : primaryTrans2Color,
          ),
        ),
      );
    }
    return stepIcon;
  }

  Widget _buildInterestStep(Size size) {
    List interests = [
      ["Women Bags", -0.03, 0.06, .88],
      ["Hats", .4, .05, .4],
      ["Electronics", .65, .05, .6],
      ["Watches", .3, .25, 1.0],
      ["Cars", .75, .28, .5],
      ["Wallets", -0.05, .48, .7],
      ["Comics", .4, .55, .45],
      ["Jewellery", .7, .46, .9],
    ];
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: List.generate(
                interests.length,
                (index) => _buildCategoryItem(interests[index], index, size),
              ),
            ),
          ),
          _buildStepTitle("Choose", "Your Interest"),
          SizedBox(height: appPadding * 2),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(List interest, int index, Size size) {
    final catImage = '${interest[0].toString().toLowerCase()}.png';
    return Positioned(
      left: size.width * interest[1],
      top: size.height * .83 * interest[2],
      child: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () => setInterestCats(index),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: interestedCats[index]
                        ? yellowColor
                        : Colors.transparent,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/icon/${catImage}"),
                    fit: BoxFit.fill,
                  ),
                ),
                width: 150 * interest[3],
                height: 150 * interest[3],
              ),
            ),
            Text(
              interest[0],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStepTitle(String title, String subtitle) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: appPadding * 1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: appPadding / 2),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: appPadding * 1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const stepImages = [
      'access_camera',
      'camera.gif',
      'push_notification.png',
      'location.gif'
    ];
    List<List<Widget>> skipAndNexts = [
      [],
      [
        RoundedRaisedButton(label: 'Allow Camera'),
      ],
      [
        RoundedRaisedButton(label: 'Allow Notification'),
      ],
      [
        RoundedRaisedButton(label: 'Arabic', filled: false),
        SizedBox(width: appPadding),
        RoundedRaisedButton(label: 'English'),
      ],
    ];
    var stepTitles = [
      ['Choose', 'Your Interest'],
      ['Access', 'Your Camera'],
      ['Get Push', 'Notifications'],
      ['Choose', 'Your Language']
    ];
    if (step == 0) return _buildInterestStep(size);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(height: 1),
          ),
          Image(
            image: AssetImage("assets/images/placeholder/${stepImages[step]}"),
            width: step == 2 ? size.width * .75 : size.width * .88,
            height: size.width * .7,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: skipAndNexts[step],
          ),
          SizedBox(height: appPadding / 2),
          (step == 1 || step == 2)
              ? InkWell(
                  onTap: () => skipAndNext(),
                  child: Text(
                    'Not Now',
                    style: TextStyle(
                      color: Color(0xff555555),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              : SizedBox(
                  width: 1,
                ),
          Expanded(
            flex: 2,
            child: SizedBox(height: 1),
          ),
          _buildStepTitle(stepTitles[step][0], stepTitles[step][1]),
          SizedBox(height: appPadding * 2),
        ],
      ),
    );
  }

  void skipAndNext() {
    if (step == 3) return nextPage();

    setState(() {
      step += 1;
    });
  }

  void nextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ExplorePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage('assets/images/layout/onboarding_topbar.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: appPadding * 2),
            // padding: EdgeInsets.symmetric(horizontal: appPadding * 1.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: appPadding * 1.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage(
                                "assets/images/icon/ollie_marker.png"),
                            width: 28,
                            height: 28,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Ollie',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => {},
                        child: Text(
                          'SKIP',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                _buildStepContent(context),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: appPadding * 1.5),
                  child: Row(
                    children: _buildStepIcon(),
                  ),
                ),
              ],
            ),
          ),
          BottomNextIcon(
            primary: true,
            nextAction: skipAndNext,
          ),
        ],
      ),
    );
  }
}
