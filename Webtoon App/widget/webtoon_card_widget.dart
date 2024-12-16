import 'package:flutter/material.dart';

class WebtoonCard extends StatelessWidget {
  final String thumb;
  const WebtoonCard({
    super.key,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: Offset(10, 10),
            color: Colors.black.withValues(alpha: 0.5),
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.network(
        thumb,
        headers: {
          'Referer': "https://comic.naver.com/",
        },
      ),
    );
  }
}
