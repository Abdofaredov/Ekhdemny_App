
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:ekhdemny/bloc/app_cubit.dart';
import 'package:ekhdemny/bloc/app_state.dart';
import 'package:ekhdemny/screens/details_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersTecScreen extends StatelessWidget {
  const OrdersTecScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context, state) {
          var cubit=AppCubit.get(context);
          return  RefreshIndicator(
            onRefresh: ()async{
             await  cubit.getDateOrdersTechnical();
            },
            child: ListView.builder(
                itemCount: cubit.ordersTechnicalList.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context,index){
                  return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(cubit.ordersTechnicalList[index].userImage,),
                                backgroundColor: Colors.white,
                                onBackgroundImageError:(Object, StackTrace){
                                  const AssetImage('assets/images/logo.png',);
                                } ,
                                //foregroundImage: NetworkImage(urlImageSignUp),
                                maxRadius: 40,
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text( cubit.ordersTechnicalList[index].userName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    // Text(cubit.ordersTechnicalList[index].,
                                    //     style: const TextStyle(
                                    //       color: Colors.white,
                                    //       fontSize: 20,
                                    //       fontWeight: FontWeight.bold,
                                    //     )),
                                   /* Text(cubit.ordersTechnicalList[index].userRate,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),*/
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.white, height: 10),
                          const SizedBox(height: 10,),
                          RichText(
                              text: TextSpan(
                                  children: [
                                    const TextSpan(text: 'Title Order : ',
                                        style:  TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    TextSpan(text: cubit.ordersTechnicalList[index].name,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),),
                                  ]
                              )),
                          const SizedBox(height: 5,),
                          RichText(
                              text: TextSpan(
                                  children: [
                                    const TextSpan(text: 'Details : ',
                                        style:  TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    TextSpan(text: cubit.ordersTechnicalList[index].details,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),),
                                  ]
                              )),
                          const SizedBox(height: 5,),
                          RichText(
                              text: TextSpan(
                                  children: [
                                    const TextSpan(text: 'City : ',
                                        style:  TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    TextSpan(text: cubit.ordersTechnicalList[index].city,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),),
                                  ]
                              )),
                          const SizedBox(height: 5,),
                          RichText(
                              text: TextSpan(
                                  children: [
                                    const TextSpan(text: 'Price : ',
                                        style:  TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    TextSpan(text: '${cubit.ordersTechnicalList[index].price} EGP',
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),),
                                  ]
                              )),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                    MoreDetailOrder(orderModel: cubit.ordersTechnicalList[index],
                                     isConfirmed: false,)));
                              },
                              child: const Text(
                                "More Details",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ));
                }),
          );
        },
        listener: (context, state) {

        });
  }
}



