import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 MethodChannel platformChannel = const MethodChannel('your_channel_name');

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {

   String? result;
   String updatedValue = 'submit';

  @override
  void initState() {
    // TODO: implement initState
    fetchDataFromNative();
    super.initState();
  }

  void fetchDataFromNative() async {
  try {
    result = await platformChannel.invokeMethod('getDataFromNative');
    print('Result from Native: $result');
  } on PlatformException catch (e) {
    print('Error: ${e.message}');
  }
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 150,
          height: 200,
          child: Column(
            children: [
              TextButton(onPressed: (){

                setState(() {
                  if(result!=null)
                   updatedValue = result!;
                });

              }
              , child: Text(updatedValue) )
            ],

          ),
        ),


        



      ),
    );
  }
}