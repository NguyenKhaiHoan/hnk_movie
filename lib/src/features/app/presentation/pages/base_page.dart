import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/base_provider.dart';
import 'package:hnk_movie/src/features/app/presentation/widgets/bottom_navigation.dart';
import 'package:hnk_movie/src/features/auth/presentation/pages/account.dart';
import 'package:hnk_movie/src/features/movie/presentation/pages/favorite.dart';
import 'package:hnk_movie/src/features/movie/presentation/pages/home.dart';
import 'package:hnk_movie/src/features/movie/presentation/pages/search.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<StatefulWidget> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final _pages = [
    const HomePage(),
    const SearchPage(),
    FavoritePage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer(
        builder: (context, ref, child) {
          var state = ref.watch(baseControllerProvider);
          return Stack(
            children: <Widget>[
              IndexedStack(
                index: state.currentIndex,
                children: _pages,
              ),
              BottomNavigation(
                  onPressed: (index) => ref
                      .read(baseControllerProvider.notifier)
                      .onIndexChanged(index),
                  currentIndex: state.currentIndex)
            ],
          );
        },
      ),
    );
  }
}
