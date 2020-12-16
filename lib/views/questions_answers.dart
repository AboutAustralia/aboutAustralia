import 'package:flutter/material.dart';
import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/theme/app_typography.dart';

class questionsAnswers extends StatefulWidget {
  @override
  _questionsAnswersState createState() => _questionsAnswersState();
}

class _questionsAnswersState extends State<questionsAnswers> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // Add the app bar to the CustomScrollView.
        SliverAppBar(
            title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.min,


                children: [
                  Center(
                      child: Text(
                        "الأسئلة الشائعة",
                        style: AppTypography.headerMedium.copyWith(
                          fontSize: 20,
                        ),
                      )),]
            ),            backgroundColor: AppColors.darkBlue,
            floating: false,
            pinned: true,
            // Display a placeholder widget to visualize the shrinking size.
            // Make the initial height of the SliverAppBar larger than normal.
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
                      width: MediaQuery.of(context).size.width*0.6,
                      child: FlatButton(
                        onPressed: null,
                        child: Row(children: [
                          Icon(Icons.add, color: Colors.white,),
                          Expanded(child: Center(child: Text("أضف سؤالًا", style: AppTypography.bodyNormal.copyWith(color: Colors.white),),))
                        ],),
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
