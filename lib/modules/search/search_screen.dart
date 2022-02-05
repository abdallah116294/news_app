
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubite.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class SearchScreen extends  StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  var searchController=TextEditingController();
   // var list=NewsCubit.get(context).search;


   @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(
              title: const Text('search'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: ( String value)
                    {
                      NewsCubit.get(context).getSearch(value );
                    },
                    validator: ( value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'search must not be empty ';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        label: Text('Search '),
                        prefixIcon: Icon(Icons.search)
                    ),
                  ),
                ),
                Expanded(child: buildArticleItem(list ,context))
              ],
            )

        );


      },
    );
  }
}
