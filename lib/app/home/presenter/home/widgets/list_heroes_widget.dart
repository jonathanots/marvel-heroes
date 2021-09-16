import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_heroes/app/home/domain/entities/hero.dart' as char;
import 'package:marvel_heroes/app/home/home_controller.dart';
import 'package:marvel_heroes/app/home/presenter/home/states/hero_state.dart';
import 'package:marvel_heroes/app/home/presenter/home/widgets/hero_card_widget.dart';
import 'package:marvel_heroes/shared/utils/some_functions.dart';

class ListHeroesWidget extends StatefulWidget {
  ListHeroesWidget({Key? key}) : super(key: key);

  @override
  State<ListHeroesWidget> createState() => _ListHeroesWidgetState();
}

class _ListHeroesWidgetState extends State<ListHeroesWidget> {
  final controller = Modular.get<HomeController>();

  final _scrollController = ScrollController();

  _loadMore() async {
    await controller.fetchHero(offset: 11, limit: 10, paginate: true);
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge && _scrollController.offset > 0) _loadMore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.heroStore.state is HeroError
          ? Center(
              child: Text('Something is wrong. Please refresh the page'),
            )
          : RefreshIndicator(
              onRefresh: () async => await controller.heroStore.refresh(),
              color: Colors.black,
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.transparent,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: controller.heroStore.heroes.length,
                  separatorBuilder: (_, index) => index % 2 != 0 ? Container() : Divider(color: Colors.transparent),
                  itemBuilder: (_, index) {
                    if (index % 2 != 0) return Container();

                    char.Hero? first;
                    char.Hero? second;

                    try {
                      first = controller.heroStore.heroes[index];
                      second = controller.heroStore.heroes[index + 1];
                    } catch (e) {
                      print("Some hero can't be accessed because on array, error position in array.");
                    }
                    if (first == null) return Container();

                    return Container(
                      width: getWidth(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [HeroCardWidget(character: first), second == null ? Container() : HeroCardWidget(character: second)],
                      ),
                    );
                  },
                ),
              ),
            );
    });
  }
}
