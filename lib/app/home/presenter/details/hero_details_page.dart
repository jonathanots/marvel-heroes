import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_heroes/app/home/domain/entities/comic.dart';
import 'package:marvel_heroes/app/home/domain/entities/hero.dart' as char;
import 'package:marvel_heroes/app/home/home_controller.dart';
import 'package:marvel_heroes/app/home/presenter/details/states/comic_state.dart';
import 'package:marvel_heroes/app/home/presenter/details/widgets/list_comics_widget.dart';
import 'package:marvel_heroes/shared/utils/some_functions.dart';
import 'package:marvel_heroes/shared/widgets/custom_text_widget.dart';
import 'package:mobx/mobx.dart';

class HeroDetailsPage extends StatefulWidget {
  final int? heroId;
  final char.Hero? hero;
  const HeroDetailsPage({Key? key, required this.heroId, required this.hero}) : super(key: key);

  @override
  _HeroDetailsPageState createState() => _HeroDetailsPageState();
}

class _HeroDetailsPageState extends State<HeroDetailsPage> {
  final controller = Modular.get<HomeController>();

  final overlayLoading = OverlayEntry(builder: (_) {
    return Container(
      color: Colors.black45,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          CustomTextWidget(
            text: 'Loading more data...',
            textStyle: GoogleFonts.roboto(),
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 18,
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  });

  final _scrollController = ScrollController();

  _loadMore() async {
    await controller.fetchHeroComics(paginate: true);
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge && _scrollController.offset > 0) _loadMore();
    });

    controller.comicStore.setHeroId(widget.heroId);

    final fetchComics = autorun((_) => controller.fetchHeroComics(offset: 0, limit: 10));

    fetchComics();

    reaction<IHeroComicState>((_) => controller.comicStore.state, (state) {
      if (state is HeroComicLoading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    reaction<IHeroComicState>((_) => controller.comicStore.state, (state) {
      if (state is HeroComicSuccess) {
        print('success fetch hero comics');
      } else if (state is HeroComicError) {
        print('error at fetch hero comics');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.message)));

        // if (state.error is HeroUnauthorizedException) {
        //   Modular.to.pushNamedAndRemoveUntil(Modular.initialRoute, (_) => false);
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hero == null)
      return Center(
        child: Text('Error at get character data. Please, try again later.'),
      );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () => [controller.comicStore.clearComics(), Modular.to.pop()],
          ),
          title: Text(
            '${widget.hero!.name}',
            style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.white,
        ),
        body: GlowingOverscrollIndicator(
          color: Colors.transparent,
          axisDirection: AxisDirection.down,
          child: Scrollbar(
            radius: Radius.circular(5),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Hero(
                    tag: 'char_${widget.hero!.id}',
                    child: Image.network(
                      widget.hero!.thumbnail,
                      fit: BoxFit.fitHeight,
                      height: getHeight(context, factor: 0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${widget.hero!.description.isEmpty ? 'No description' : widget.hero!.description}',
                            style: GoogleFonts.rubik(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListComicsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
