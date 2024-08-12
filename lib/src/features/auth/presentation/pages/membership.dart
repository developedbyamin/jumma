import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumma/src/core/assets/assets/app_vectors.dart';

import '../../../../core/config/theme/app_colors.dart';

class Membership extends StatelessWidget {
  const Membership({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'MEMBERSHIP AGREEMENT',
          style: TextStyle(
            color: AppColors.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppVectors.exit),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Text("""Please read these 'site terms of use' carefully before using our site.
Our customers who use and shop on this shopping site are assumed to have accepted the following terms:
The web pages on our site and all pages linked to it ('site') belong to and are operated by ……………………………….company ('Company') at ………………………. While you ('User') use all services offered on the site, you are subject to the following conditions, by benefiting from and continuing to use the service on the site; You are deemed to have the right, authority and legal capacity to sign a contract in accordance with the laws you are bound by, and that you are over 18 years of age, that you have read and understood this contract and that you are bound by the terms written in the contract.

This contract is indefinite and imposes rights and obligations on the parties regarding the site subject to the contract, and when the parties accept/approve this contract online or in writing, they declare and undertake that they will fulfill the mentioned rights and obligations completely, accurately, on time, and within the conditions requested in this contract. .

1. RESPONSIBILITIES

The company always reserves the right to make changes to prices and the products and services offered.
The company accepts and undertakes that the member will benefit from the services subject to the contract, excluding technical malfunctions.
The user accepts in advance that he will not reverse engineer the use of the site or take any other action to find or obtain the source code of the site, otherwise he will be responsible for any damages that may occur to third parties and legal and criminal proceedings will be taken against him.
The User accepts that he/she will be solely responsible for any damages he/she may incur due to incomplete and incorrect information given while becoming a member of the site, and that in case of providing incorrect information and in case of violation of this agreement by the Member, the company may unilaterally terminate his/her membership without the need for any notice or warning.
The name and Internet Protocol (IP) address of the Internet service provider used by the company to access the site for the improvement and development of the website and/or within the framework of legal legislation, the date and time the site was accessed, the pages accessed while on the site, and the Internet connection of the website that allows direct connection to the site. Some information such as address may be collected. The user agrees to the collection of this information.
The User shall not produce content that is contrary to general morality and good manners, unlawful, harms the rights of third parties, misleading, offensive, obscene, pornographic, harms personal rights, violates copyrights, or encourages illegal activities in its activities within the site, in any part of the site or in its communications. , agrees that he will not share. Otherwise, he/she is entirely responsible for the damage that may occur, and in this case, the 'Site' authorities may suspend or terminate such accounts and reserve the right to initiate legal proceedings. For this reason, if judicial authorities request information regarding activities or user accounts, it reserves the right to share this information with the authorities.
Members of the site are responsible for their relationships with each other or with third parties.

2. INTELLECTUAL PROPERTY RIGHTS

2.1. All registered or unregistered intellectual property rights such as title, business name, trademark, patent, logo, design, information and method contained in this Site belong to the site operator and owner company or the specified person and are under the protection of national and international law. Visiting this Site or using the services on this Site does not give you any rights regarding these intellectual property rights.

2.2. The information on the site cannot be reproduced, published, copied, presented and/or transferred in any way. The whole or part of the site cannot be used on another website without permission. In case of such a violation, the user will be responsible for covering the amount of compensation requested from the company due to the damages suffered by third parties and all other liabilities, including but not limited to court costs and attorney fees.
3. CONFIDENTIAL INFORMATION

3.1. The company will not disclose personal information transmitted by users through the site to third parties. This personal information; It contains all kinds of other information intended to identify the User, such as person's name-surname, address, telephone number, mobile phone, e-mail address, and will be briefly referred to as 'Confidential Information'.

3.2. User, promotion, advertising, campaign, promotion, announcement, etc. He accepts and declares that he consents to the company that owns the Site sharing his contact, portfolio status and demographic information with its affiliates or affiliated group companies, and to receive electronic messages in this context for himself or his affiliates, limited to their use within the scope of marketing activities. This personal information may be used within the company to determine the customer profile, to offer promotions and campaigns appropriate to the customer profile, and to conduct statistical studies.

3.3.The User has the right to cancel the consent given by this agreement without explaining any reason. The company processes the cancellation immediately and prevents the user from receiving electronic messages within 3 (three) business days.

3.4. Confidential Information can only be disclosed to official authorities if this information is requested by the official authorities in due course and in cases where disclosure to the official authorities is mandatory in accordance with the mandatory legislation in force.

4. NO WARRANTY:

THIS AGREEMENT ARTICLE SHALL BE VALID TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW. THE SERVICES OFFERED BY THE COMPANY ARE PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS AND WITH RESPECT TO THE SERVICES OR THE APPLICATION, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. EXPRESSED OR IMPLIED, INCLUDING MAKES NO WARRANTY OF ANY KIND, STATUTORY OR OTHERWISE.

5. REGISTRATION AND SECURITY

The user must provide accurate, complete and up-to-date registration information. Otherwise, this Agreement will be deemed to have been violated and the account may be closed without informing the User.

The user is responsible for password and account security on the site and third-party sites. Otherwise, the Company cannot be held responsible for any data loss, security breaches or damage to hardware and devices that may occur.

6. FORCE MAJEURE

Not under the control of the parties; arising from the contract due to reasons such as natural disasters, fire, explosions, civil wars, wars, riots, public movements, declaration of mobilization, strikes, lockouts and epidemics, infrastructure and internet failures, power outages (together referred to as "Force Majeure" below). If the obligations cannot be fulfilled by the parties, the parties are not responsible for this. During this period, the rights and obligations of the Parties arising from this Agreement are suspended.
7. INTEGRITY OF THE CONTRACT AND APPLICABILITY

If one of the terms of this agreement becomes partially or completely invalid, the remainder of the agreement continues to be valid.

8. CHANGES TO BE MADE IN THE CONTRACT

The company may change the services offered on the site and the terms of this contract partially or completely at any time. Changes will be valid from the date of publication on the site. It is the User's responsibility to follow the changes. The user is deemed to have accepted these changes by continuing to benefit from the services offered.

9. NOTIFICATION

All notifications to be sent to the parties regarding this Agreement will be made through the Company's known e-mail address and the e-mail address specified by the user in the membership form. The user accepts that the address specified when signing up is the valid notification address, and that if it changes, he will notify the other party in writing within 5 days, otherwise notifications to this address will be deemed valid.

10. EVIDENCE CONTRACT

In any disputes that may arise between the Parties regarding the transactions related to this agreement, the Parties' books, records and documents, computer records and fax records will be accepted as evidence in accordance with the Code of Civil Procedure No. 6100, and the user agrees that he will not object to these records.

11. DISPUTE RESOLUTION

Istanbul (Central) Courthouse Courts and Enforcement Offices are authorized to resolve any disputes arising from the implementation or interpretation of this Agreement.
          """),
      ),
    );
  }
}
