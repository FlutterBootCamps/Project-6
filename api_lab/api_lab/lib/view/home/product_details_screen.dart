import 'package:api_lab/constant/colors.dart';
import 'package:api_lab/extensions/screen_handler.dart';
import 'package:api_lab/view/home/bloc/home_bloc.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeLoadDataState) {
          return Scaffold(
            backgroundColor: darkblue,
            appBar: AppBar(
              iconTheme: IconThemeData(color: text),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<HomeBloc>().add(HomeLoadDataEvent());
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              centerTitle: true,
              title: Text(
                state.product!.title!,
                style: TextStyle(
                  color: text,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                  preferredSize: Size(context.getWidth(), 10),
                  child: const Divider()),
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.getWidth(),
                        height: context.getHeight() * 0.45,
                        child: Swiper(
                          autoplay: true,
                          allowImplicitScrolling: true,
                          itemCount: state.product!.images!.length,
                          itemBuilder: (context, index) {
                            return Image.network(
                              state.product!.images![index]
                                  .replaceAll('"', '')
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              width: context.getWidth(),
                            );
                          },
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "\$${state.product!.price}",
                        style: TextStyle(
                            color: text,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("description",
                          style: TextStyle(
                              color: text,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(state.product!.description!,
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: text.withOpacity(0.8),
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
              backgroundColor: darkblue,
              body: Center(
                  child: Text(
                "Error",
                style: TextStyle(color: text),
              )));
        }
      },
    );
  }
}
