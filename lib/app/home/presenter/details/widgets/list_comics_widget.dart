import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_heroes/app/home/domain/entities/comic.dart';
import 'package:marvel_heroes/app/home/home_controller.dart';
import 'package:marvel_heroes/app/home/presenter/details/states/comic_state.dart';
import 'package:marvel_heroes/shared/utils/some_functions.dart';
import 'package:marvel_heroes/shared/widgets/custom_text_widget.dart';
import 'package:marvel_heroes/shared/widgets/network_image_widget.dart';

class ListComicsWidget extends StatefulWidget {
  const ListComicsWidget({Key? key}) : super(key: key);

  @override
  _ListComicsWidgetState createState() => _ListComicsWidgetState();
}

class _ListComicsWidgetState extends State<ListComicsWidget> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.comicStore.state is HeroComicError) return Container();

        return controller.comicStore.comics.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: CustomTextWidget(
                    text: controller.comicStore.state is HeroComicLoading ? 'Loading ...' : 'No Comics',
                    textStyle: GoogleFonts.rubik(),
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              )
            : AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: controller.comicStore.comics.isEmpty ? 0 : 1,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Comics',
                                style: GoogleFonts.rubik(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        itemCount: controller.comicStore.comics.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, index) => Divider(color: Colors.transparent),
                        itemBuilder: (_, index) {
                          Comic? comic = controller.comicStore.comics[index];

                          if (comic == null) return Container();

                          return Container(
                            height: 130,
                            width: getWidth(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: NetworkImageWidget(url: comic.thumbnail, fit: BoxFit.fill),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Column(
                                      children: [
                                        CustomTextWidget(
                                          text: '${comic.title}',
                                          textStyle: GoogleFonts.rubik(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextWidget(
                                          text: '${comic.description == null ? 'No description' : comic.description}',
                                          textStyle: GoogleFonts.rubik(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w200),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Spacer(),
                                        CustomTextWidget(
                                          text: '${comic.pageCount} pages',
                                          textStyle: GoogleFonts.rubik(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w200),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
