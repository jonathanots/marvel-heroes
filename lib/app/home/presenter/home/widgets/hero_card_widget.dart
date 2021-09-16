import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_heroes/app/home/domain/entities/hero.dart' as char;
import 'package:marvel_heroes/shared/utils/some_functions.dart';
import 'package:marvel_heroes/shared/widgets/network_image_widget.dart';

class HeroCardWidget extends StatelessWidget {
  final char.Hero character;

  const HeroCardWidget({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed('/character/${character.id}', arguments: character),
      child: Container(
        height: 200,
        width: getWidth(context, factor: 0.33),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Hero(
                  tag: 'char_${character.id}',
                  child: NetworkImageWidget(
                    url: character.thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        '${character.name}',
                        style: GoogleFonts.rubik(fontWeight: FontWeight.w600, color: Colors.grey[700]),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
