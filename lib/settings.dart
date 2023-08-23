import 'package:audio_player/kvalues.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                onTermsandCondition(context);
              });
            },
            child: const SettingsName(
              titleData: "Terms and Condition",
              subtitleData: "All the stuff you need to know",
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                onPrivacyandCondition(context);
              });
            },
            child: const SettingsName(
              titleData: "Privacy Policy",
              subtitleData: "Important for both of us",
            ),
          ),
          InkWell(
            onTap: () {
              Share.share("https://github.com/ASNoufal/audioplayer.git",
                  subject: "Git repo of the App");
            },
            child: const SettingsName(
              titleData: "Share the App",
              subtitleData: "shareeee....!!!",
            ),
          ),
          InkWell(
            onTap: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.black,
                    title: const Text(
                      "Music Player",
                      style: kdash,
                    ),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                            'It is an offline music player app which allows to hear music from their storage and also do function like add to favorites',
                            style: kwhite,
                          ),
                          Text(
                            'App developed by Naufal',
                            style: kwhite,
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[600]),
                        child: const Text(
                          'Approve',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const SettingsName(
              titleData: "About",
              subtitleData: "About the App",
            ),
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
      title: Text(
        titleData,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitleData,
        style: const TextStyle(color: Colors.white38),
      ),
      trailing: const Icon(
        Icons.arrow_forward,
        color: Colors.white38,
      ),
    );
  }
}

void onTermsandCondition(BuildContext context) {
  showDialog(
      context: (context),
      builder: (context) {
        return ListView(
          children: [
            AlertDialog(
                title: const Text(
                  "Terms and Conditions\nLast updated: July 07, 2023\n\nPlease read these terms and conditions carefully before using Our Service.\nInterpretation and Definitions\nInterpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.Acknowledgment\nThese are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.\nYour access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.\nBy accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.\n\nLinks to Other Websites\nOur Service may contain links to third-party web sites or services that are not owned or controlled by the Company.\nThe Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.\nTermination\nWe may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.\nUpon termination, Your right to use the Service will cease immediately.\nLimitation of Liability\nNotwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven't purchased anything through the Service.\nTo the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.\n\nSome states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party's liability will be limited to the greatest extent permitted by law.",
                  style: TextStyle(fontSize: 9),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Text("ok")),
                ]),
          ],
        );
      });
}

void onPrivacyandCondition(BuildContext context) {
  showDialog(
      context: (context),
      builder: (context) {
        return ListView(
          children: [
            AlertDialog(
                title: const Text(
                  '''
          Naufal as built the Echo Play app as an Open Source app. This SERVICE is provided by Naufal as at no cost and is intended for use as is.

          This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.

          If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.

          The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Echo Play unless otherwise defined in this Privacy Policy.

          Information Collection and Use

          For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.

          The app does use third-party services that may collect information used to identify you.

          Link to the privacy policy of third-party service providers used by the app

          - Google Play Services (https://www.google.com/policies/privacy/)

          Log Data

          I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.

          Cookies

          Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

          This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.

          Service Providers

          I may employ third-party companies and individuals due to the following reasons:

          - To facilitate our Service;
          - To provide the Service on our behalf;
          - To perform Service-related services; or
          - To assist us in analyzing how our Service is used.

          I want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.

          Security

          I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.

          Links to Other Sites

          This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

          Children’s Privacy

          These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do the necessary actions.

          Changes to This Privacy Policy

          I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.

          This policy is effective as of 2023-07-07

          Contact Us

          If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at naufal202@gmail.com.

          This privacy policy page was created at privacypolicytemplate.net and modified/generated by App Privacy Policy Generator
          ''',
                  style: TextStyle(fontSize: 9),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Text("ok")),
                ])
          ],
        );
      });
}
