import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          SettingsName(
            titleData: "Notification",
            subtitleData: "to get notification",
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                onbottomsheet(context);
              });
            },
            child: SettingsName(
              titleData: "Terms and Condition",
              subtitleData: "All the stuff you need to know",
            ),
          ),
          SettingsName(
            titleData: "Privacy Policy",
            subtitleData: "Important for both of us",
          ),
          SettingsName(
            titleData: "Share the App",
            subtitleData: "shareeee....!!!",
          ),
          SettingsName(
            titleData: "Third party Application",
            subtitleData: "......!!!!",
          ),
          SettingsName(
            titleData: "About",
            subtitleData: "About the App",
          ),
        ],
      ),
    );
  }
}

class SettingsName extends StatelessWidget {
  const SettingsName(
      {super.key, required this.titleData, required this.subtitleData});
  final String titleData;
  final String subtitleData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titleData),
      subtitle: Text(subtitleData),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}

void onbottomsheet(BuildContext context) {
  showDialog(
      context: (context),
      builder: (context) {
        return ListView(
          children: [
            AlertDialog(
                title: Text(
                    "Terms and Conditions\nLast updated: July 07, 2023\n\nPlease read these terms and conditions carefully before using Our Service.\nInterpretation and Definitions\nInterpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.Acknowledgment\nThese are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.\nYour access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.\nBy accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.\n\nLinks to Other Websites\nOur Service may contain links to third-party web sites or services that are not owned or controlled by the Company.\nThe Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.\nTermination\nWe may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.\nUpon termination, Your right to use the Service will cease immediately.\nLimitation of Liability\nNotwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven't purchased anything through the Service.\nTo the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.\n\nSome states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party's liability will be limited to the greatest extent permitted by law."),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Text("ok")),
                ]),
          ],
        );
      });
}
