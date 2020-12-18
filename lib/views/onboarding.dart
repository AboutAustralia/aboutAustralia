import 'package:about_australia/components/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:about_australia/components/bottom_navigation_tabs_controller.dart';
import 'package:about_australia/theme/app_typography.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:about_australia/fireStore_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:about_australia/theme/app_colors.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<SliderModel> slide = new List<SliderModel>();
  int currentIndex = 4;
  PageController controller = new PageController(initialPage: 4);

  @override
  void initState() {
    super.initState();
    slide = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrent, int index) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2),
        height: isCurrent ? 10.0 : 6.0,
        width: isCurrent ? 10.0 : 6.0,
        decoration: BoxDecoration(
          color: isCurrent ? Color(0xff961c00) : Colors.grey[700],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  //auth params, I didn't put them in a separate class cuz it fucked everything up when I tried
  var _token;

  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  bool _logged_in;
  final storage = new FlutterSecureStorage();
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  final db = FireStoreAPI();

  //Google login
  //login proved us with username, imageurl, token and user id
  Future<User> _GooglesignIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );

    User googleuser = (await _fAuth.signInWithCredential(credential)).user;

    var displayname = googleuser.displayName;
    var photourl = googleuser.photoURL;
    var userid = googleSignInAccount.id;
    var token = gSA.accessToken;
    db.addUser(displayname, photourl, userid, token);
    print(displayname);
    store_user_detail(userid, photourl, displayname);

    store_token(token);
    read_token();
    ref.child('user').child(userid).once().then((DataSnapshot snap) {
      var data = snap.value;
      if (data == null) {
        ref.child('newuser').set(displayname);
        post_UserData(userid, displayname, photourl);
      } else {
        post_UserData(userid, displayname, photourl);
      }
    });

    return null;
  }

  Future read_token() async {
    String value = await storage.read(key: 'valid_token');
    setState(() {
      if (_fAuth.currentUser != null) {
        _logged_in = true;
      } else {
        _logged_in = false;
      }
    });
  }

  void post_UserData(var userid, var username, var userimage) {
    ref.child('user').child(userid).child('imageurl').set(userimage);
    ref.child('user').child(userid).child('name').set(username);
  }

  Future store_token(String valid_token) async {
    await storage.write(key: 'valid_token', value: '$valid_token');
  }

  Future store_user_detail(String userid, userimage, username) async {
    await storage.write(key: 'user-id', value: '$userid');
    await storage.write(key: 'user-image', value: '$userimage');
    await storage.write(key: 'user-name', value: '$username');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: <Widget>[
        PageView.builder(
          controller: controller,
          itemCount: slide.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return Slider(
              imageAssetPath: slide[index].getImageAssetPath(),
              title: slide[index].getTitle(),
              desc: slide[index].getDesc(),
              colour: Color(0xff023047),
            );
          },
        ),
        currentIndex != slide.length - slide.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {
                      controller.animateToPage(slide.length - slide.length,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    color: Colors.transparent,
                    child: Text("تخطي",
                        style: AppTypography.bodyNormal
                            .copyWith(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 495,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              icon: Icon(
                                Icons.navigate_before,
                                color: Color(0xff023047),
                              ),
                              iconSize: 40,
                              onPressed: () {
                                controller.animateToPage(currentIndex - 1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.linear);
                              },
                            )),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Row(
                        children: <Widget>[
                          for (int i = 0; i < slide.length; i++)
                            currentIndex == i
                                ? pageIndexIndicator(true, i)
                                : pageIndexIndicator(false, i),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      FlatButton(
                        onPressed: () {
                          _GooglesignIn();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BottomNavigationBarController(
                                        currentIndex: 0)),
                          );
                        },
                        color: Colors.transparent,
                        child: Text("تسجيل دخول",
                            style: AppTypography.bodyNormal
                                .copyWith(color: AppColors.darkBlue)),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {
                              _GooglesignIn();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavigationBarController(
                                            currentIndex: 0)),
                              );
                            },
                            color: Colors.transparent,
                            child: Text("تسجيل دخول",
                                style: AppTypography.bodyNormal
                                    .copyWith(color: AppColors.darkBlue)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavigationBarController(
                                            currentIndex: 0)),
                              );
                            },
                            color: Colors.transparent,
                            child: Text("المتابعة بدون حساب",
                                style: AppTypography.bodyNormal
                                    .copyWith(color: AppColors.darkBlue)),
                          ),
                        )
                      ]),
                ],
              ),
      ]),
    );
  }
}

class Slider extends StatelessWidget {
  String imageAssetPath, title, desc;
  Color colour;

  Slider({this.imageAssetPath, this.title, this.desc, this.colour});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageAssetPath),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Opacity(
              opacity: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xff023047).withOpacity(1),
                        Color(0xff034160).withOpacity(1),
                        Colors.cyan[200],
                        Colors.white,
                      ],
                      begin: AlignmentDirectional.topCenter,
                      end: Alignment.bottomCenter),
                ),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.map,
                    color: colour,
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 35,
                    width: 100,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: colour,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//                  Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             BottomNavigationBarController(currentIndex: 0)),
//                   );
