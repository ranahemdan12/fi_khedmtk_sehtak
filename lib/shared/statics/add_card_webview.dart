import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../view/orders_screen/screen/orders_screen.dart';
import '../resources/strings_manger.dart';
import 'enum.dart';


class PaymentArgument{
  final String paymentUrl;
  final ReserveOrderTypeEnum type;
  PaymentArgument({required this.paymentUrl,required this.type, });
}



class PaymentWebView extends StatefulWidget {
  const PaymentWebView({super.key, });


  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {

   late  WebViewController controller= WebViewController();
   late final PaymentArgument args;
    bool isSuccess= false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      args = ModalRoute.of(context)!.settings.arguments as PaymentArgument;

      setState(() {
        controller = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0xFFFFFFFF))
          ..setNavigationDelegate(
            NavigationDelegate(

              onProgress: (int progress) {},
              onPageStarted: (String url) async{},

              onPageFinished: (String url)async {},

              onWebResourceError: (WebResourceError error) {},

              onNavigationRequest: (NavigationRequest request) {

                return NavigationDecision.navigate;
              },
              onUrlChange: (change) {

                if (change.url?.contains('success') == true && !isSuccess) {
                  isSuccess = true;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrdersScreen(
                          reserveOrderType:  args.type),
                      ));

                } else if (change.url?.contains('fail') == true) {
                  showToast(StringManger.paymentFail.tr());

                }
              },
            ),
          )
          ..loadRequest(
            Uri.parse(
              args.paymentUrl,
            ), );
      });

    },);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      text: StringManger.payment.tr(),
        body: WebViewWidget(controller: controller,)
    );

  }
}

