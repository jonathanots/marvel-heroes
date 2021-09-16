import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_heroes/app/home/home_controller.dart';
import 'package:marvel_heroes/app/home/presenter/home/states/hero_state.dart';
import 'package:marvel_heroes/app/home/presenter/home/widgets/list_heroes_widget.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  final overlayLoading = OverlayEntry(builder: (_) {
    return Container(
      color: Colors.black45,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  });

  @override
  void initState() {
    super.initState();

    final fetchHeroes = autorun((_) => controller.fetchHero(offset: 0, limit: 10));

    fetchHeroes();

    reaction<IHeroState>((_) => controller.heroStore.state, (state) {
      if (state is HeroLoading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    reaction<IHeroState>((_) => controller.heroStore.state, (state) {
      if (state is HeroSuccess) {
        print('success fetch heroes');
      } else if (state is HeroError) {
        print('error at fetch heroes');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.message)));

        // if (state.error is HeroUnauthorizedException) {
        //   Modular.to.pushNamedAndRemoveUntil(Modular.initialRoute, (_) => false);
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Heróis da Marvel',
            style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      ' MARVEL ',
                      style: GoogleFonts.roboto(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        backgroundColor: Colors.red,
                        letterSpacing: -3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListHeroesWidget(),
            )
          ],
        ),
      ),
    );
  }
}
