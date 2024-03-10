import 'package:api_app/bloc/bottom_nav_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BottomNavBlocBloc>();
    return BlocBuilder<BottomNavBlocBloc, BottomNavBlocState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BlocBuilder<BottomNavBlocBloc, BottomNavBlocState>(
            builder: (context, state) {
              return BottomNavigationBar(
                backgroundColor: Colors.amber[50],
                selectedItemColor: Colors.blueGrey[900],
                  onTap: (value) {
                    bloc.add(MoveScreenEvent(selectindex:value));
                    print('press');
                  },
                  currentIndex: bloc.screenindex,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.card_travel), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: ''),
                  ]);
            },
          ),
          body: bloc.views[bloc.screenindex],
        );
      },
    );
  }
}
