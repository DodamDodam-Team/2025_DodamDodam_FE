import 'package:dodamdodam_fe/view/main_pages/book_store/book_store_info.dart';
import 'package:dodamdodam_fe/view/main_pages/constructing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookStorePage extends ConsumerStatefulWidget {
  const BookStorePage({super.key});

  @override
  ConsumerState<BookStorePage> createState() => _BookStorePageState();
}

class _BookStorePageState extends ConsumerState<BookStorePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BookStoreInfoBox(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Constructing()],
          ),
        ),
      ],
    );
  }
}
