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
    return Center(child: Text('book_store'));
  }
}
