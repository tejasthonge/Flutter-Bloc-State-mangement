import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_app/features/cart/ui/cart.dart';
import 'package:shope_app/features/home/bloc/home_bloc.dart';
import 'package:shope_app/features/wishlist/ui/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc:
          homeBloc, //here we provide the bloc due to that we not have to wrap the blocprovider
      //other wise it got the error red screen

//here i only on to listen when we get an  action state
      listenWhen: (previous, current) => current is HomeActionState,

// here i only on to build when we dont get an action state  means this returning scafold build only when the state is not the the HomeActionState
      buildWhen: (previous, current) => current is! HomeActionState,

      listener: (context, state) {
        // this listener  is listening only the state is the HomeActionState
        if (state is HomeNavigationToCartListPageState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const CartPage()));
        } else if (state is HomeNavigationToWishListPageState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const WishListPage()));
        }
      },
      //above we just getting the state and proforme some action

      builder: (context,state){

      
        switch (state.runtimeType ) {
          case HomeLoadingState :
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.amber.shade700,
                ),
              ),
            );

          case HomeErrorState :
            return const Scaffold(
              body: Center(
                child: Icon(Icons.error, color: Colors.red),
              ),
            );

          case HomeLoadedSuccessState :
          final successeState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.white,
                centerTitle: true,
                backgroundColor: Colors.amber.shade800,
                title: const Text("Shope App"),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishListNavigationEvent());
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartListNavigationEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),

              body: GridView.builder(
                itemCount: successeState.productsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10), itemBuilder: (context ,index){
                  final item = successeState.productsList[index];
                  return ClipRRect(

                    borderRadius: BorderRadius.circular(20),
                    child: Container(

                      child: Column( 
                        children: [ 
                          Image.network(
                            item.imageUrl,

                            
                          )
                        ],
                      ),
                    ),
                  );
              }),
            );

          default:
            return Scaffold(
              body: Center(
                child: Text('No data yet'),
              ),
            );
        }
      },
    );
  }
}
