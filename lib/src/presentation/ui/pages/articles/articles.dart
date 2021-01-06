import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/articles/bloc.dart';
import '../../../../injection.dart';
import 'widgets/widgets.dart';

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  final _bloc = getIt<ArticlesBloc>();

  void _loadData() {
    _bloc
      ..getCategories()
      ..getArticles();
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () {
              _loadData();
              return Future.value();
            },
            child: BlocProvider<ArticlesBloc>(
              create: (_) => _bloc,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 20,
                      right: 20,
                      bottom: 50,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Good Morning!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: IconButton(
                                tooltip: 'Add Article',
                                onPressed: () {},
                                icon: Icon(Icons.post_add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 50),
                    sliver: SliverToBoxAdapter(
                      child: CategoriesWidget(
                        onSelectCategory: (category) {},
                      ),
                    ),
                  ),
                  ArticlesWidget(),
                ],
              ),
            ),
          ),
        ),
      );
}
