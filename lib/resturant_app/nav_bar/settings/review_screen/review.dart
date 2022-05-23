import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';


class Reveiw extends StatelessWidget {
  var reveiwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is ResturantReviewSuccessState ){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('Done!'),
            padding: EdgeInsetsDirectional.all(20),
            duration: Duration(milliseconds: 800),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              design(
                  chiled: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      defaultFormField(
                        maxLines: 3,
                        controller: reveiwController,
                        label: 'reveiw',
                        type: TextInputType.text,
                        prefix: Icons.rate_review_outlined,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: defaultColor,
                            ),
                            child: defaultButton(
                              function: () {
                                HomeCubit.get(context)
                                    .userReview(comment: reveiwController.text);
                                reveiwController.clear();
                              },
                              text: 'send',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        )),
                    Center(
                      child: Text(
                        'Reveiw',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
