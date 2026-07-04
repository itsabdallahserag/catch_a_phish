import 'dart:io';

import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:catch_a_phish/services/cloudinary_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final ImagePicker picker = ImagePicker();

  bool isUploading = false;

  UserModel? user;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    user = await FirebaseUtils.readUser();

    if (!mounted) return;

    setState(() {});
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 80,
    );

    if (image == null) return;

    setState(() {
      isUploading = true;
    });

    try {
      File file = File(image.path);

      final url = await CloudinaryService.uploadImage(file);

      if (url != null) {
        await FirebaseUtils.updatePhotoUrl(url);

        user = await FirebaseUtils.readUser();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (!mounted) return;

      setState(() {
        isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.cyanAccent, width: 2),
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage:
                user?.photoUrl != null && user!.photoUrl!.isNotEmpty
                ? NetworkImage(user!.photoUrl!)
                : const AssetImage('assets/images/iconprofile.png')
                      as ImageProvider,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.cyanAccent,
            ),
            child: isUploading
                ? const Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black,
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: pickImage,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.edit, color: Colors.black, size: 18),
                  ),
          ),
        ),
      ],
    );
  }
}
