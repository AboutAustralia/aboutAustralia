import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;



class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class HistoryOfAustralia extends StatelessWidget {
  int count = 0;

  SliverPersistentHeader makeHeader(String headerText, String immage) {
    immage = immage;
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 130.0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(immage),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter),
          ),
        ),
      ),
    );
  }

  Container card(String title, String Stitle, Color colour) {
    title = title;
    Stitle = Stitle;
    colour = colour;
    return Container(
        height: 90,
        width: double.infinity,
        decoration: (BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: colour.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              )
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 13.0),
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(height: 0.7, color: colour, fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13.0),
              child: Text(
                Stitle,
                textAlign: TextAlign.right,
                style: TextStyle(color: colour, fontSize: 14),
              ),
            ),
          ],
        ));
  }

  Padding cont(String cont) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        cont,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.grey[700], fontSize: 19),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          makeHeader('قبل الميلاد', 'assets/art.jpg'),
          SliverFixedExtentList(
            itemExtent: 680.0,
            delegate: SliverChildListDelegate([
              Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      card('قبل الميلاد', '60000-42000 ق.م', Colors.brown),
                      cont(
                          "أن أول إنسان وطأت قدماه أستراليا كان قبل 65 ألف عام على الأقل، أي قبل ما كان يقدر سابقا بكثير.\n تستند هذه النتيجة إلى كنز من آلاف القطع الأثرية للسكان الأصليين تم اكتشافها في المأوى الصخري المسمى مادجيدبي في منطقة الإقليم الشمالي.\n كما تفيد الدراسات إلى أن البشر وصلوا إلى القارة الأسترالية قبل انقراض الحيوانات الضخمة مثل الدببة الأسترالية العملاقة والكنغارو قصير الوجه. وأن الاستيطان الأول  للبشر حدث في وقت كان فيه مستوى سطح البحر أقل بكثير، حيث كانت المسافة من جنوب شرقي آسيا إلى أستراليا أقصر من اليوم.\n يذكر أن توقيت وصول أول إنسان إلى البلاد كان موضع نقاش على مدى عقود، مع تقديرات سابقة لوصول السكان الأصليين إلى أستراليا ما بين 47 ألف و60 ألف عام.  "),
                    ],
                  )),
            ]),
          ),
          makeHeader('اكتشاف أستراليا', 'assets/vessel.jpg'),
          SliverFixedExtentList(
            itemExtent: 550.0,
            delegate: SliverChildListDelegate([
              Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      card('اكتشاف أستراليا', 'القرن السابع عشر',
                          Color(0xff023047)),
                      cont(
                          "   يصنف البحار والمستكشف الهولندي وليام جانزون كأول أوروبي شاهد أستراليا، فخلال رحلته الشهيرة ما بين عامي 1605 و1606 حلّ الأخير بهذه المنطقة ليعلن بداية الرحلات الاستكشافية والتوسعية الهولندية بها.\n واصل البحارة الهولنديين الإبحار على طول الساحل في رحلاتهم ودعوا هذه الأرض نيو هولاند. و في عام 1642 شاهد هولندي يدعى أبيل تازمان  (Abel Tasman) جزيرة تسمى (فان ديمان), ولم يدرك أن هذه الجزير جزء من أستراليا. تم تغيير الاسم لاحقا الى تازمينيا على شرف مكتشفها. ثم اكتشف الجزر التي أطلق عليها اسم نيوزيلندا وجزر تونجا وفيجي.  "),
                    ],
                  )),
            ]),
          ),
          makeHeader('Header Section 3', 'assets/cook.jpg'),
          SliverFixedExtentList(
            itemExtent: 710.0,
            delegate: SliverChildListDelegate([
              Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      card(' بريطانيا في استراليا', 'القرن الثامن عشر',
                          Colors.blueGrey),
                      cont(
                          "ما بين سنتي 1768 و1771، قاد المستكشف الإنجليزي جيمس كوك رحلة علمية واستكشافية انتهت بإعلان ملكية بريطانيا للسواحل الشرقية لأستراليا يوم 22 من شهر آب/أغسطس سنة 1770 وظهور ما يعرف بمنطقة نيوساوث ويلز.\n سعى الإنجليز إلى توسيع نفوذهم ليمتد نحو ممتلكاتهم في أستراليا. وبناء على ذلك، حاولت بريطانيا إنشاء عدد من المستعمرات بهذه الأراضي, لكن هذه المهمة مثلت عبئا ثقيلا على السلطات, لغياب مقومات البنية التحتية و المناخ السيء, فارتأت بريطانيا ترحيل المجرمين نحو المستعمرات في استراليا كبديل لمستعمراتها في أمريكا بعد حصولها على استقلالها.وفي عام 1793 وصلت أول سفينة تحمل أول المستوطنين المهاجرين الأحرار، الذين كانت شروط هجرتهم تشمل تزويدهم بمرور مجاني واعطائهم معدات زراعية وأدوات، بالإضافة إلى قطعة أرض خلية من النفقات.  "),
                    ],
                  )),
            ]),
          ),
          makeHeader('Header Section 4', 'assets/castle_hill.jpg'),
          SliverFixedExtentList(
            itemExtent: 770.0,
            delegate: SliverChildListDelegate([
              Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      card('تأسيس المستعمرات', 'القرن التاسع عشر',
                          Colors.grey[850]),
                      cont(
                          "في عام 1804، اندلع تمرد المدانين في كاسل هيل الذي يقوده حوالي مئتين من الهاربين، معظمهم من المدانين الإيرلنديين، كانت هذه الانتفاضة الأولى والوحيدة للمسجونين في التاريخ الأسترالي, غير أنه أُخمد بسرعة من قِبل فيلق نيو ساوث ويلز.في 1803, استعمرت أرض فان دامين، والتي تسمى تازمينيا حالياً، حتى أصبحت مستعمرة مستقلة في 1825. وقامت المملكة المتحدة باستعمار الجزء الغربي من أستراليا في 1828. بعد انفصال عدة مستعمرات عن نيو ساوث ويلز مثل: جنوب أستراليا في 1836 وفيكتوريا في 1851 وكوينزلاند في 1859.  تأسس الإقليم الشمالي الذي كان منفصلاً عن الجنوب الأسترالي، حينها كانت جنوب أستراليا مقاطعة حرة ولم تكن مستعمرة عقوبات أبداً. وكذلك فيكتوريا وغرب أستراليا، ولكنهم مؤخراً وافقوا على نقل المحكوم عليهم إليها. وقاد سكان نيوساوث ويلز إلى حملة لإيقاف نقل المحكوم عليهم للمستعمرة، حينها كانت أخر سفينة للمحكوم عليهم تصل نيوساوث ويلز في 1848. "),
                    ],
                  )),
            ]),
          ),
          makeHeader('Header Section 5', 'assets/rush.jpg'),
          SliverFixedExtentList(
            itemExtent: 660.0,
            delegate: SliverChildListDelegate([
              Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      card('اكتشاف الذهب', 'القرن التاسع عشر',
                          Colors.deepOrangeAccent),
                      cont(
                          "تم اكتشاف الذهب في استراليا لأول مرة عام 1951 مما أدى إلى تحول استراليا اقتصاديا وسياسيا وديموغرافيا. ونتيجة لذلك هاجر حوالي 2% من سكان بريطانيا بالإضافة إلى سكان من مختلف الأعراق  إلى استراليا. ان تمرّد حاجز دفاع يوريكا عام 1854، وهو احتجاج مسلّح نفّذه عمال المناجم في مناجم ذهب فيكتوريا، والجدل الذي تلا ذلك، بمثابة قوّةٍ دافعة كبيرة لإجراء إصلاحات ديمقراطية. جاء التمرّد إثر اعتراض الحكومة على تقديم تراخيص للتعدين، إذ يجب دفع رسوم الترخيص بغض النظر عما إذا كان طلب المُنقب عن الذهب قد أتى بأي ذهب، ووجد المتعهدون الأقل نجاحًا صعوبة في دفع رسوم الترخيص الخاصة بهم. وأنتج الذهب ثروة مفاجئة للقليلين، ويعود تاريخ ثراء بعض أقدم الأثرياء في أستراليا إلى هذه الفترة."),
                    ],
                  )),
            ]),
          ),
          makeHeader('Header Section 6', 'assets/commonwealth.jpg'),
          SliverFixedExtentList(
            itemExtent: 660.0,
            delegate: SliverChildListDelegate([
              Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      card('الاتحاد', 'القرن العشرين', Colors.grey[700]),
                      cont(
                          "في بداية القرن العشرين، بعد اختتام مفاوضات استمرت قرابة العقدين عن الاتحاد وبموافقة جميع المستعمرات الأسترالية الست على دستور اتحادي وتصديق البرلمان البريطاني عليها في مرحلة لاحقة في عام 1900، أسفر ذلك عن اندماج سياسي للمستعمرات الأسترالية الست في الكومنولث الأسترالي الموحد، وأُعلن عنه رسميًا في 1 يناير 1901،  وتم حينها اختيار علم استراليا. أصبحت أستراليا تتمتع بالحكم الذاتي في الشؤون الداخلية والخارجية بإقرار قانون اعتماد القوانين التشريعية لويستمنستر في 9 أكتوبر 1942. وأزال قانون أستراليا لعام 1986 بقايا السلطة القانونية البريطانية على الصعيد الاتحادي. "),
                    ],
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
