import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login/components/login.dart';
import '../cubit/profile_cubit.dart';
import '../resources/indexpages.dart';
import '../resources/resource.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key, required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(token),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Profile",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, size: 33),
            )
          ],
        ),
        drawer: Drawer(
          child: Builder(
              builder: (context) {
                final cubit =context.read<HomeScreenCubit>();
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.green),
                      accountName: Text(cubit.originalName, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      accountEmail: Text(cubit.originalEmail),
                      currentAccountPicture: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(cubit.profileUrl), // Replace with actual image URL
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text("logout"),
                      onTap: (){
                        // remPrefs();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Loginscreen(),));
                      },
                    ),

                  ],
                );
              }
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              final cubit = context.read<HomeScreenCubit>();
              return Column(
                children: [
                  // Profile Image
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xff47BA82),
                              width: 4,
                            ),
                          ),
                          child:
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:NetworkImage(state is ProfileImageUpdated && state.profileUrl.isNotEmpty
                                ? state.profileUrl : cubit.profileUrl.isNotEmpty
                                ?cubit.profileUrl:"https://tse2.mm.bing.net/th?id=OIP.NqY3rNMnx2NXYo3KJfg43gHaHa&pid=Api&P=0&h=180"),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Name & Role
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children:  [
                          Text(
                            cubit.originalName.isNotEmpty?cubit.originalName:"Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Text( cubit.supplierType.isNotEmpty?cubit.supplierType:"Supplier"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Contact Row
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(Icons.apartment),
                          SizedBox(width: 5),
                          Text(cubit.originalCompanyName.isNotEmpty?cubit.originalCompanyName:"Company Name"),
                          SizedBox(width: 40),
                          Icon(Icons.phone),
                          SizedBox(width: 5),
                          Text(cubit.whatsappNumberController.text.isNotEmpty?cubit.whatsappNumberController.text:"Phone Number"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(Icons.mail),
                          SizedBox(width: 5),
                          Text(cubit.originalEmail.isNotEmpty?cubit.originalEmail:"Mail"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: ProfileButtons(
                              text: "Personal",
                              ontap: () => cubit.switchScreen(1),
                              isSelected: cubit.selectedIndex == 1,
                            ),
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            fit: FlexFit.tight,
                            child: ProfileButtons(
                              text: "Company",
                              ontap: () => cubit.switchScreen(2),
                              isSelected: cubit.selectedIndex == 2,
                            ),
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            fit: FlexFit.tight,
                            child: ProfileButtons(
                              text: "Security",
                              ontap: () => cubit.switchScreen(3),
                              isSelected: cubit.selectedIndex == 3,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Selected Categories",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),

                      // Category Heading
                      if(cubit.selectedIndex == 1)PersonalDetailsIndex(),
                      if(cubit.selectedIndex == 2)CompanyIndex(),
                      if(cubit.selectedIndex == 3)SecurityIndex(),


                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}