import 'package:flutter/material.dart';
import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/theme/app_typography.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as JSON;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:about_australia/fireStore_api.dart';

class questionsAnswers extends StatefulWidget {
  @override
  _questionsAnswersState createState() => _questionsAnswersState();
}

class _questionsAnswersState extends State<questionsAnswers> {
  //google auth start
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

    return null;
  }

  Future read_token() async {
    String value = await storage.read(key: 'valid_token');
    setState(() {
      if (_fAuth.currentUser != null) {
        _logged_in = true;
      }else{
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

  //google auth end
  void handleClick(String value) {
    setState(() {
      switch (value) {
        case "googlesignin":
          print('google');
          _GooglesignIn();
          return;
        case "signout":
          setState(() {
            FirebaseAuth.instance.signOut();
            _logged_in = false;
            showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                      title: new Text("تم تسجيل خروجك بنجاح",
                          style: AppTypography.bodyNormal
                              .copyWith(color: AppColors.darkBlue)),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            'تم',
                            style: AppTypography.bodyNormal
                                .copyWith(color: AppColors.darkBlue),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ));
          });
      }
    });
  }

  showLogin(BuildContext context) {
    read_token();
    return PopupMenuButton<String>(
        onSelected: handleClick,
        icon: Icon(Icons.person),
        itemBuilder: (BuildContext context) {
          if (!_logged_in) {
            return ["googlesignin"].map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Google sign in",
                      style: AppTypography.bodyNormal
                          .copyWith(color: AppColors.darkBlue)),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    FontAwesomeIcons.google,
                    color: AppColors.darkBlue,
                  ),
                ]),
              );
            }).toList();
          } else {
            return ["signout"].map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("تسجيل خروج",
                      style: AppTypography.bodyNormal
                          .copyWith(color: AppColors.darkBlue)),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.logout,
                    color: AppColors.darkBlue,
                  ),
                ]),
              );
            }).toList();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // Add the app bar to the CustomScrollView.
        SliverAppBar(
            snap: false,
            actions: [showLogin(context)],
            title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.min,

                children: [
                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                    "الأسئلة الشائعة",
                    style: AppTypography.headerMedium.copyWith(
                        fontSize: 20,
                    ),
                  ),
                      )),
                ]),
            backgroundColor: AppColors.darkBlue,
            floating: false,
            pinned: true,
            // Display a placeholder widget to visualize the shrinking size.
            //  Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 110,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: FlatButton(
                        onPressed: null,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Expanded(
                                child: Center(
                              child: Text(
                                "عندك سؤال؟",
                                style: AppTypography.bodyNormal
                                    .copyWith(color: Colors.white),
                              ),
                            ))
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            )),
        // Next, create a SliverList
        SliverList(
          // Use a delegate to build items as they're scrolled on screen.
          delegate: SliverChildBuilderDelegate(
            // The builder function returns a ListTile with a title that
            // displays the index of the current item.
            (context, index) => questionCard(
              questionText: "عندي سؤال مهم جدا واللهي ومحتاج جوابه بسرعة",
              answerPreview:
                  "ابشر يخوي جوابك جاي عالسريع ولا يهمك لانه السفارة الاسترالية اشي خرافي يعني",
              askedBy: "someone",
              useful: 5,
            ),
            // Builds 1000 ListTiles

            childCount: 100,
          ),
        ),
      ],
    );
  }
}

class questionCard extends StatelessWidget {
  questionCard(
      {Key key,
      this.questionText,
      this.answerPreview,
      this.askedBy,
      this.useful})
      : super(key: key);

  final String questionText;
  final String answerPreview;
  final String askedBy;
  final int useful;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                child: ClipOval(
                    child: Image.network(
                        'https://www.w3schools.com/howto/img_avatar.png')),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questionText,
                      style: AppTypography.bodyNormal
                          .copyWith(fontSize: 14, height: 1.5),
                    ),
                    SizedBox(height: 5),
                    Text(
                      answerPreview,
                      style: AppTypography.answerPreview
                          .copyWith(color: AppColors.neutrals[600]),
                    )
                  ],
                ),
              ),
              SizedBox(width: 5),
              Divider(
                height: 1,
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.thumb_up), Text(useful.toString())],
                  )))
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 2,
        )
      ],
    ));
  }
}
