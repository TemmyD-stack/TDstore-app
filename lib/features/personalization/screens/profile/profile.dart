import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile', style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image: TImages.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text("Change profile picture")),
                  ],
                ),
              ),

              //DETAILS
              const SizedBox(height: TSizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),


              const TSectionHeader(title: "Profile Information", showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(onPressed: () {  }, title: 'Name', value: 'TemmyD-stack',),
              TProfileMenu(onPressed: () {  }, title: 'Username', value: 'temmy_the_dayo',),

              // Heading Personal Info
              const SizedBox(height: TSizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),


              const TSectionHeader(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),



              TProfileMenu(onPressed: () {  }, title: 'User ID', value: '45689',),
              TProfileMenu(onPressed: () {  }, title: 'Email', value: 'temi.dire.dayo.1@gmail.com',),
              TProfileMenu(onPressed: () {  }, title: 'Phone Number', value: '+234 706 172 0130',),
              TProfileMenu(onPressed: () {  }, title: 'Gender', value: 'Female',),
              TProfileMenu(onPressed: () {  }, title: 'DAte of Birth', value: '17 April, 1980',),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),


              Center(
                child: TextButton(
                  onPressed: (){}, 
                  child: const Text("Close Account", style: TextStyle(color: Colors.red),)
                
                ),
              )


            ],
          ),
        ),
      )
    );
  }
}

