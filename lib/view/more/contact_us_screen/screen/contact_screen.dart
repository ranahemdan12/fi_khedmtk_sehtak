import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/view/more/contact_us_screen/cubit/contact_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/link.dart';
import '../../../../shared/resources/asset_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../widget/customText.dart';
import '../widget/custom_text2.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {


  @override
  void initState() {
    ContactCubit.get(context).getContact();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.contactUs.tr(),
        body: BlocBuilder<ContactCubit,ContactState>(
          builder: (context,state){
            if(state is ContactLoading){
              return const Center(child: CustomLoadingIndicator());
            }

            else if(state is ContactSuccess){
              return  Padding(
                padding:const EdgeInsetsDirectional.only(start: 26,end: 26,top: 23),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText( text: StringManger.contactPhone.tr(),),
                    SizedBox(height: 16.h,),
                     CustomText2(text:state.getContactUsResponse.phone ??'',),
                    SizedBox(height: 16.h,),
                    CustomText( text: StringManger.theAddress.tr(),),
                    SizedBox(height: 16.h,),
                     CustomText2(text:state.getContactUsResponse.address??'',),
                    SizedBox(height: 16.h,),
                    CustomText( text: StringManger.emailUsAt.tr(),),
                    SizedBox(height: 16.h,),
                     CustomText2(text:state.getContactUsResponse.email?? '',),
                    SizedBox(height: 16.h,),
                    CustomText( text: StringManger.followUsOn.tr(),),
                    SizedBox(height: 16.h,),

                    Row(children: [
                      Link(
                        target: LinkTarget.self,
                        uri: Uri.parse(state.getContactUsResponse.twitter??''),
                        builder: (context,followLink)=>IconButton(onPressed: followLink,
                          icon:  SvgPicture.asset(AssetManger.xIcon),),
                      ),
                      SizedBox(width: 22.h,),
                      Link(
                        target: LinkTarget.self,
                        uri: Uri.parse(state.getContactUsResponse.facebook??''),
                        builder: (context,followLink)=>IconButton(onPressed: followLink,
                            icon: SvgPicture.asset(AssetManger.faceIcon)),
                      ),
                      SizedBox(width: 22.h,),
                      Link(
                        target: LinkTarget.self,
                        uri: Uri.parse(state.getContactUsResponse.instagram??''),
                        builder: (context,followLink)=> IconButton(onPressed:followLink,
                            icon: SvgPicture.asset(AssetManger.instaIcon)),
                      ),

                    ],),]
                            ),
              );
            }
            else if(state is ContactError){
              return  Center(child: Text(state.message));
             }else{
              return  Center(child: Image.asset("assets/images/noData.png"));
             }},

        ));
  }
}
