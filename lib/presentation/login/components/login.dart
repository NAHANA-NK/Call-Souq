import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logincubit/login_cubit.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(),
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: BlocListener<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginStatusLoaded) {
                            final loginCubit = context.read<LoginCubit>();
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) =>
                                  Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: BlocProvider.value(
                                      value: loginCubit,
                                      child: SizedBox(
                                        width: 300,
                                        height: 400,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          child: SizedBox(),
                                        ),
                                      ),
                                    ),
                                  ),
                            );
                          } else if (state is LoginStatusError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "ghhhg"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                        child: BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            final cubit = context.read<LoginCubit>();

                            return Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(50.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 240,
                                          height: 143,
                                          child: Image(
                                              image: NetworkImage(
                                                  "data:image/png;base64,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"))),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Welcome again!",
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  "Please Log into your existing \n account",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500),
                                                )
                                              ],
                                            )
                                          ]
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        children: [
                                          TextFormField(
                                            controller: cubit.emailController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                              filled: true,
                                              fillColor: Color(0xffF4F4F4),
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
                                              ),
                                              hintText: "Email Address",
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 20),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller: cubit.passwordController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                              filled: true,
                                              fillColor: Color(0xffF4F4F4),
                                              prefixIcon:
                                              Icon(Icons.lock_outline_rounded),
                                              hintText: "Password",
                                              suffixIcon:
                                              Icon(Icons.visibility_off_outlined),
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Forget your password?"),
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Click Here",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ))
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          final email = cubit.emailController.text
                                              .trim();
                                          final password =
                                          cubit.passwordController.text.trim();

                                          if (email.isEmpty || password.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    duration: Duration(seconds: 3),
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                        "Username and Password cant be empty!")));
                                          } else if (!email.contains('@') ||
                                              !email.contains('.')) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Please enter a valid email address."),
                                                backgroundColor: Colors.red,
                                                behavior: SnackBarBehavior.floating,
                                              ),
                                            );
                                          } else {
                                            context.read<LoginCubit>()
                                                .checkLoginStatus();
                                          }
                                        },
                                        child: Container(
                                          width: 380,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Color(0xff47BA82),
                                              borderRadius: BorderRadius.circular(
                                                  10)),
                                          child: Center(
                                              child: state is LoginStatusLoading
                                                  ? CircularProgressIndicator()
                                                  : Text(
                                                "Login",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              )),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text("Don’t have an account yet ?"),
                                        ],
                                      ),
                                      SizedBox(height: 5),

                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 380,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0xff47BA82)),
                                          ),
                                          child: Center(
                                              child: Text(
                                                "Create New Account",
                                                style: TextStyle(
                                                    color: Color(0xff47BA82),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              )),
                                        ),
                                      ),
                                      SizedBox(height: 8,)
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
              }
          ),
        ),
      ),
    );
  }
}