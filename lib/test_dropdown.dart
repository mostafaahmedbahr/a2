import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_google_maps/bloc/cubit.dart';
import 'package:test_google_maps/bloc/states.dart';
import 'package:test_google_maps/model/uni_model.dart';
class DropDownScreen extends StatelessWidget {
  const DropDownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..getDate(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
                  child: DropdownButton (
                    hint: const Text("Selected"),
                    items: cubit.universities.map((e)
                    {
                      return DropdownMenuItem(
                          child: Text("$e"),
                        value: e,
                      );
                    }).toList(),
                    onChanged: ( value) {
                      // cubit.change(value);
                      print(value.toString());

                    },
                  ),
            ),
          );
        },

      ),
    );
  }
}
