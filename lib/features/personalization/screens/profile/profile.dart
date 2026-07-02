import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Profile',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
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
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : TImages.user;
                        return controller.imageUploading.value 
                        ? const TShimmerEffect(width: 80, height: 80) 
                        : TCircularImage(
                          image: image,
                          width: 80,
                          height: 80,
                          isNetworkImage: networkImage.isNotEmpty,
                        );
                      }),
                      TextButton(
                          onPressed: () => controller.uploadUserProfilePicture(),
                          child: const Text("Change profile picture")),
                    ],
                  ),
                ),

                //DETAILS
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                const TSectionHeader(
                  title: "Profile Information",
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Obx(() => TProfileMenu(
                      onPressed: () => Get.to(() => const ChangeName()),
                      title: 'Name',
                      value: controller.user.value.fullName,
                    )),
                Obx(() => TProfileMenu(
                      onPressed: () => Get.to(() => const ChangeName()),
                      title: 'Username',
                      value: controller.user.value.username,
                    )),

                // Heading Personal Info
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                const TSectionHeader(
                  title: 'Personal Information',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                Obx(() => TProfileMenu(
                      onPressed: () => Get.to(() => const ChangeName()),
                      title: 'User ID',
                      value: controller.user.value.id,
                    )),
                Obx(() => TProfileMenu(
                      onPressed: () => Get.to(() => const ChangeName()),
                      title: 'Email',
                      value: controller.user.value.email,
                    )),
                Obx(() => TProfileMenu(
                      onPressed: () => Get.to(() => const ChangeName()),
                      title: 'Phone Number',
                      value: controller.user.value.phoneNumber,
                    )),
                TProfileMenu(
                    onPressed: () {}, title: 'Gender', value: 'Female'),

                TProfileMenu(
                    onPressed: () {},
                    title: 'DAte of Birth',
                    value: '17 April, 1980'),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        "Close Account",
                        style: TextStyle(color: Colors.red),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
