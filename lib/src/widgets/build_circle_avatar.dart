part of '../pages/profile_edit/profile_edit_page.dart';

class BuildCircleAvatar extends StatelessWidget {
  final String image;
  final VoidCallback onChangeImageTap;
  final File? file;

  const BuildCircleAvatar({
    Key? key,
    required this.image,
    required this.onChangeImageTap,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: Screens.width(context),
      height: 150.0,
      child: Center(
        child: Stack(
          children: [
            (file == null)
                ? CircleAvatar(
                    radius: 60.0,
                    backgroundColor: theme.hintColor,
                    child: Icon(
                      FeatherIcons.camera,
                      color: Colors.white,
                      size: Screens.width(context) / 7,
                    ))
                : CircleAvatar(
                    radius: 60.0,
                    backgroundColor: theme.hintColor,
                    backgroundImage: FileImage(file!),
                  ),
            InkWell(
              borderRadius: BorderRadius.circular(120.0),
              onTap: onChangeImageTap,
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  FeatherIcons.camera,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
