import 'package:flutter/material.dart';
import 'package:s_pay/config/constants/sizes.dart';
import 'package:s_pay/config/constants/text_strings.dart';
import 'package:s_pay/config/helpers/helper_function.dart';
import 'package:s_pay/core/common/styles/spacing_styles.dart';

class SendMoney extends StatefulWidget {
  static const String routeName = "/send-money";
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  String words = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text == "") return;
      words =
          SHelperFunctions.converAmountToWords(double.parse(_controller.text));
      setState(() {});
    });

    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 2))..forward();
    _animation = Tween(begin: 0.0,end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: SSpacingStyle.paddingBarWithHeight,
        child: Center(
          child: Column(
            children: [
              Text(
                STexts.yourPaying,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: SSizes.md,
              ),
              IntrinsicWidth(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _controller,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: Theme.of(context).textTheme.displaySmall,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        prefix: Text("₹"),
                        border: InputBorder.none,
                        hintText: "0"),
                  ),
                ),
              ),
              SizedBox(
                height: SSizes.spaceBtwItems,
              ),
              Text(
                words != "" ? "$words ${STexts.only}" : "",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: SSizes.spaceBtwSections,
              ),
              IntrinsicWidth(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: STexts.addDescription,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                height: SSizes.spaceBtwSections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        showStatusBottomSheet(context,
                            isSuccess: true,
                            message: STexts.paymentSuccessfullySent);
                      },
                      child: Text(STexts.submit)))
            ],
          ),
        ),
      ),
    );
  }

  void showStatusBottomSheet(BuildContext context,
      {required bool isSuccess, required String message}) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: SSpacingStyle.paddingBarWithHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedIcon(
                icon: AnimatedIcons.event_add,
                progress: _animation,
                size: 120,
                color: isSuccess ? Colors.green : Colors.red,
              ),
              SizedBox(height: 16),
              Text(
                message,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(STexts.close),
              ),
            ],
          ),
        );
      },
    );
  }
}
