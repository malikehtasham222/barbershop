import 'dart:io';

import 'package:barbershop_new/src/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../helpers/constants.dart';
import '../providers/util_provider.dart';
import 'custom_app_bar.dart';
import 'custom_elevated_button.dart';

enum ImagePickType { Gallery, Camera }

class CustomImageCropperScreen extends StatefulWidget {
  const CustomImageCropperScreen({super.key});

  @override
  State<CustomImageCropperScreen> createState() =>
      _CustomImageCropperScreenState();
}

class _CustomImageCropperScreenState extends State<CustomImageCropperScreen> {
  XFile? _pickedFile;
  CroppedFile? _croppedFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(context,
          title: (_pickedFile == null)
              ? AppLocalizations.of(context)!.change_image_profile
              : AppLocalizations.of(context)!.crop_image),
      body: Column(
        children: [
          Expanded(
              child: (_pickedFile == null)
                  ? Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Const.margin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomElevatedButton(
                            label: AppLocalizations.of(context)!.open_camera,
                            onTap: () => _uploadImage(isForCamera: true),
                          ),
                          const SizedBox(height: Const.space25),
                          CustomElevatedButton(
                            label: AppLocalizations.of(context)!.open_gallery,
                            onTap: () => _uploadImage(),
                          ),
                        ],
                      ),
                    )
                  : ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 0.8 * screenWidth,
                        maxHeight: 0.7 * screenHeight,
                      ),
                      child: Image.file(File(_pickedFile!.path)),
                    ) //Crop.file(_sample!, key: _cropKey),
              ),
          (_pickedFile == null)
              ? const SizedBox()
              : Container(
                  margin: const EdgeInsets.all(20.0),
                  alignment: AlignmentDirectional.center,
                  child: CustomElevatedButton(
                    label: AppLocalizations.of(context)!.crop,
                    onTap: () => _cropImage().then((value) {
                      final prov =
                          Provider.of<UtilProvider>(context, listen: false);
                      prov.file = File(_croppedFile!.path);
                      return Get.back();
                    }),
                  ),
                )
        ],
      ),
    );
  }

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        cropStyle: CropStyle.circle,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: AppLocalizations.of(context)!.crop_image,
              toolbarColor: ColorDark.primary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: AppLocalizations.of(context)!.crop_image,
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  Future<void> _uploadImage({bool? isForCamera = false}) async {
    final pickedFile = await ImagePicker().pickImage(
        source:
            (isForCamera == true) ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
      /*_cropImage().then((value) {
        final prov = Provider.of<UtilProvider>(context, listen: false);
        prov.file = File(_croppedFile!.path);
        return Get.back();
      });*/
    }
  }

/*void _clear() {
    setState(() {
      _pickedFile = null;
      _croppedFile = null;
    });
  }*/
}
