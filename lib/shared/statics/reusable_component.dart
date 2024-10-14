import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import '../../models/response/get_citiy/get_city_response.dart';
import '../resources/color_manger.dart';
import '../resources/strings_manger.dart';
import 'enum.dart';



//  appScreen with search appBar

class CustomScreenWithSearchAppBar extends StatefulWidget {
  const CustomScreenWithSearchAppBar({
    Key? key,
    required this.text,
    required this.body,
    this.changedWidget,
    this.onChanged,
    this.onClose,
   this.searchController,
  }) : super(key: key);

  final Widget body;
  final String text;
  final Function(String)? onChanged;
  final void Function(String)? changedWidget;
  final Function? onClose;
 final TextEditingController? searchController;
  @override
  State<CustomScreenWithSearchAppBar> createState() =>
      _CustomScreenWithSearchAppBarState();
}

class _CustomScreenWithSearchAppBarState
    extends State<CustomScreenWithSearchAppBar> {

  bool isSearchedClicked = false;
  String searchText = '';
  List<CityItem>? governoratesItemList;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth:30.w,
        centerTitle: false,
        titleSpacing: 0,
        iconTheme: const IconThemeData(
          color: ColorManger.whiteColor,
        ),
        title: isSearchedClicked
            ? Container(
                height: 50.h,
                decoration: BoxDecoration(
                    color: ColorManger.whiteColor,
                    borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  controller: widget.searchController,
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsetsDirectional.only(
                        start: 25, top: 15, bottom: 15),
                    hintStyle:
                        Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: ColorManger.labelGrayColor,
                            ),
                    hintText: StringManger.search.tr(),
                    border: InputBorder.none,
                  ),
                ),
              )
            : Row(
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    widget.text,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManger.whiteColor,
                        ),
                  ),
                ],
              ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchedClicked = !isSearchedClicked;
                  if (!isSearchedClicked) {
                    widget.onClose!();
                  }
                });
              },
              icon: Icon(
                isSearchedClicked ? Icons.close : Icons.search,
              ))
        ],
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Container(
            color: ColorManger.blueColor,
          ),
        ),
      ),
      body: widget.body,
    );
  }
}


// appScreen
class CustomScreen extends StatelessWidget {
   const CustomScreen({
    Key? key,
     this.text,
    required this.body,
    this.actionWidget,
    this.changedWidget,
    this.mapTypeEnum,
  }) : super(key: key);

  final Widget body;
   final String? text;
  final Widget? actionWidget;
  final void Function(String)? changedWidget;
  final MapTypeEnum? mapTypeEnum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40.w,
        centerTitle: false,
        titleSpacing: 0,
        iconTheme: const IconThemeData(
          color: ColorManger.whiteColor,
        ),
        title: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Text(
              text??'',
              maxLines:1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorManger.whiteColor,
                  ),
            ),
          ],
        ),
        actions: [actionWidget ?? const SizedBox()],
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Container(
            color: ColorManger.blueColor,
          ),
        ),
      ),
      body: body,
    );
  }
}


// textField
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.text,
    required this.keyboardType,
    required this.textEditingController,
    required this.hintText,
    this.enabled,
    this.suffixIcon,
    this.onChanged,
    this.onClose,
    this.onPresed
  }) : super(key: key);

  final String text;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final String? hintText;
  final bool? enabled;
  final bool? suffixIcon;
  final Function(String)? onChanged;
  final Function? onClose;
  final void Function()? onPresed;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool isSearchedClicked = false;


class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.text,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
        SizedBox(
          height: 9.h,
        ),
        SizedBox(
          height: 60.h,
          child: TextField(
            onChanged: widget.onChanged,
            enabled: widget.enabled,
            keyboardType: widget.keyboardType,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsetsDirectional.only(
                  start: 25, top: 15, bottom: 15),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: ColorManger.whiteGColor,
              filled: true,
              suffixIcon:
                  widget.suffixIcon==true? const Icon(Icons.search):IconButton(onPressed:
                     widget.onPresed,icon: const Icon(Icons.close)),

              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: ColorManger.labelGrayColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}


//  textFormField
class CustomTextFormField extends StatefulWidget {
  final String? Function(String?)? validate;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final void Function()? suffixPressed;
  final bool obscurePassword;
  final TextInputAction? inputAction;
  final Function(CountryCode)? onCountryChange;
  final String? hintText;
  final Function()? onEditComplete;
  final IconData? suffix;
  final FocusNode? focusNode;
  final CountryCode? valueOfCountry;
  final bool isPhone;
  final bool? enabled;

  const CustomTextFormField({
    Key? key,
    this.valueOfCountry,
    this.isPhone = false,
    this.enabled,
    this.onCountryChange,
    required this.validate,
    required this.keyboardType,
    required this.textEditingController,
    required this.hintText,
    this.inputAction,
    this.onEditComplete,
    this.focusNode,
    this.obscurePassword = false,
    this.suffixPressed,
    this.suffix,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        validator: widget.validate,
        keyboardType: widget.keyboardType,
        controller: widget.textEditingController,
        obscureText: widget.obscurePassword,
        focusNode: widget.focusNode,
        onEditingComplete: widget.onEditComplete,
        decoration: InputDecoration(
          suffixIcon: widget.suffix != null
              ? IconButton(
                  onPressed: widget.suffixPressed, icon: Icon(widget.suffix))
              : null,
          contentPadding: REdgeInsets.symmetric(
            horizontal: 10,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: ColorManger.redColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: ColorManger.whiteColor,
          filled: true,
          errorStyle: const TextStyle(fontSize: 12),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ColorManger.mainColor,
                fontSize: 14.sp,
              ),
        ),
      ),
    );
  }
}


// LoadingIndicator

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  CircularProgressIndicator(
        color: ColorManger.blueColor,
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorManger.blueColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorManger.whiteColor,
              ),
        ),
      ),
    );
  }
}


void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorManger.greyBordColor,
      textColor: ColorManger.blackColor,
      fontSize: 17.sp);
}


class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
          itemCount: 20, // Adjust the count based on your needs
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: ColorManger.whiteGColor,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 338.w,
              height: 50.h,
              margin: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 12),
              padding: const EdgeInsets.all(8),
            );
          }),
    );
  }
}

class CustomSliverShimmer extends StatelessWidget {
  const CustomSliverShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                color: ColorManger.whiteGColor,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 338.w,
              height: 50.h,
              margin: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 12),
              padding: const EdgeInsets.all(8),
            ),
          );
        });
  }
}


class CustomCachedNetworkImage extends StatelessWidget{
  const CustomCachedNetworkImage({super.key,required this.imageUrl,this.onTap,
    required this.height,required this.width,required this.borderRadius,
    required this.fit
  });

  final String imageUrl;
  final double height;
  final double width;
  final double borderRadius;
  final BoxFit? fit;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageBuilder:
              (context, imageProvider) =>
              Image(
                image: imageProvider,
                height: height,
                width: width,
                fit: fit,
              ),
          imageUrl: imageUrl,
          width: width,
          height: height,
          placeholder: (context, url) =>
          const Center(
              child: CustomLoadingIndicator()),
          errorWidget:
              (context, url, error) =>
          const Icon(Icons.error),
        ),
      ),
    ) ;
  }


}