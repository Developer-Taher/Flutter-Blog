import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/articles/bloc.dart';
import '../../../../../domain/entities/category/category.dart';

class CategoriesWidget extends StatefulWidget {
  final Function(Category) onSelectCategory;

  const CategoriesWidget({Key key, this.onSelectCategory}) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) => state.categoriesState.fold(
          () => Center(child: CircularProgressIndicator()),
          (either) => either.fold(
            (apiError) => Text(apiError.message ?? 'Unknown Error!'),
            (result) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    itemCount: result.data.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (_, index) => Chip(
                      label: Text(result.data[index].name),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
