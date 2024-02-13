import 'package:flutter/material.dart';
import 'package:flutter_provider/Pages/Provider/homepage_provider.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ageController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Eligibilty Check"),
        centerTitle: true,
      ),
      body: Form(
        child: ChangeNotifierProvider<HomepageProvider>(
          create: (context)=>HomepageProvider(),
          child: Consumer<HomepageProvider>(
            builder: (context, provider,child) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color: (provider.isEligible==true)? Colors.green: Colors.red,
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(
                        hintText: "Enter your age"
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        provider.checkEligibility(int.parse(ageController.text));
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue
                        ),
                        child: Center(child: Text("Check",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),

                        ),),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(provider.eligibilityMessage.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),

                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),

    );
  }
}
