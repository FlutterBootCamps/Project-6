import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/helper/extention/screen_helper.dart';
import 'package:my_store/page/filter/bloc/filter_bloc.dart';
import 'package:my_store/page/filter/categoryProducts.dart';
import 'package:my_store/helper/extention/const_color.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterBloc()..add(LoadingEvent()),
      child: Builder(builder: (context) {
        final bloc = context.read<FilterBloc>();

        return BlocProvider(
          create: (context) => FilterBloc()..add(LoadingEvent()),
          child: BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              context.read<FilterBloc>();
              return SafeArea(
                child: Scaffold(
                  backgroundColor: bodyColor,
                  appBar: AppBar(backgroundColor: bodyColor, actions: [
                    Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.yellow.shade100,
                              blurRadius: 1000000,
                              spreadRadius: 20,
                              blurStyle: BlurStyle.normal)
                        ]),
                        child: SvgPicture.asset(
                          "assets/image/crescent-moon-svgrepo-com.svg",
                          color: Colors.yellow.shade400,
                          width: 70,
                          height: 70,
                        )),
                  ]),
                  body: BlocBuilder<FilterBloc, FilterState>(
                    builder: (context, state) {
                      if (state is TabBarLoading) {
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: bloc.categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 19 / 12,
                          ),
                          itemBuilder: (context, number) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                      create: (context) => FilterBloc()..add(LoadingProdactsEvent()),
                                        child: CategorySelectPage(
                                            categoryFilter: bloc.categories[number]),
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: Column(children: [
                                    SizedBox(
                                      height: context.getHeight()*0.1,
                                      width: context.getWidth()*0.4,
                                      child: Image.network(
                                          bloc.categories[number].image),
                                    ),
                                    Text(bloc.categories[number].name!)
                                  ]),
                                ));
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
