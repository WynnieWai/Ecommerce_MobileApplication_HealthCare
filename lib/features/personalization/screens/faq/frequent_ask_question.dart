import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';

class FrequentAskQuestion extends StatefulWidget {
  const FrequentAskQuestion({super.key});

  @override
  State<FrequentAskQuestion> createState() => _FrequentAskQuestionState();
}

class _FrequentAskQuestionState extends State<FrequentAskQuestion> {
  final List<Map<String, dynamic>> faqSections = [
    {
      'title': 'About This App',
      'faqs': [
        {
          'question': 'What is this app for?',
          'answer': 'This app allows users to browse, purchase, and manage healthcare and beauty products online.'
        },
        {
          'question': 'Is the app free to use?',
          'answer': 'Yes, the app is free to download and use. However, purchases made through the app will incur costs.'
        },
        {
          'question': 'Can I use this app for medical advice?',
          'answer': 'This app is not a substitute for professional medical advice. Please consult a healthcare professional for medical concerns.'
        },
      ],
    },
    {
      'title': 'Account',
      'faqs': [
        {
          'question': 'How do I create an account?',
          'answer': 'Tap on Sign Up and provide the required information to create your account.'
        },
        {
          'question': 'I forgot my password. What should I do?',
          'answer': 'Go to Login > Forgot Password and follow the instructions to reset your password.'
        },
        {
          'question': 'Can I delete my account?',
          'answer': 'Yes, go to Profile > Settings > Edit Account > Close Account. Note that this action is permanent.'
        },
      ],
    },
    {
      'title': 'Orders & Payments',
      'faqs': [
        {
          'question': 'How do I place an order?',
          'answer': 'Browse products, add them to your cart, and proceed to checkout to place an order.'
        },
        {
          'question': 'What payment methods are accepted?',
          'answer': 'We accept credit/debit cards, online banking, and e-wallets.'
        },
        {
          'question': 'How can I track my order?',
          'answer': 'Go to Profile > My Orders to view your current delivery status.'
        },
      ],
    },
    {
      'title': 'Shipping & Delivery',
      'faqs': [
        {
          'question': 'How long does delivery take?',
          'answer': 'Delivery usually takes 1-5 working days depending on your location.'
        },
        {
          'question': 'Do you offer same-day delivery?',
          'answer': 'Same-day delivery is available in selected areas for orders placed before 12 PM.'
        },
      ],
    },
    {
      'title': 'Returns & Refunds',
      'faqs': [
        {
          'question': 'What is the return policy?',
          'answer': 'Returns are accepted within 7 days for unopened items. Terms and conditions apply.'
        },
        {
          'question': 'When will I receive my refund?',
          'answer': 'Refunds are processed within 5-10 business days depending on your payment method.'
        },
      ],
    },
    {
      'title': 'Support',
      'faqs': [
        {
          'question': 'How can I contact customer support?',
          'answer': 'You can contact support via email at support@yourapp.com or call us at +60 12-345 6789. Our support team is available from 9 AM to 6 PM, Monday to Friday.'
        },
      ],
    },
  ];

  // Track expanded question globally: (sectionIndex, faqIndex)
  int? expandedSectionIndex;
  int? expandedFaqIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Frequently Asked Questions',style:Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.builder(
          itemCount: faqSections.length,
          itemBuilder: (context, sectionIndex) {
            final section = faqSections[sectionIndex];
            final faqs = section['faqs'] as List<Map<String, String>>;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Text(
                    section['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary,
                    ),
                  ),
                ),
                ...List.generate(faqs.length, (faqIndex) {
                  final faq = faqs[faqIndex];
                  final isExpanded = expandedSectionIndex == sectionIndex && expandedFaqIndex == faqIndex;
                  return Column(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            setState(() {
                              if (isExpanded) {
                                expandedSectionIndex = null;
                                expandedFaqIndex = null;
                              } else {
                                expandedSectionIndex = sectionIndex;
                                expandedFaqIndex = faqIndex;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                            decoration: BoxDecoration(
                              color: isExpanded ? TColors.primary.withOpacity(0.05): Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    faq['question']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: isExpanded ? TColors.primary : Theme.of(context).textTheme.bodyLarge?.color,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: isExpanded ? TColors.primary : Theme.of(context).iconTheme.color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (isExpanded)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          child: Text(
                            faq['answer']!,
                            style: const TextStyle(fontSize: 15, color: Colors.black87),
                          ),
                        ),
                    ],
                  );
                }),
                const SizedBox(height: 24), 
              ],
            );
          },
        ),
      ),
    );
  }
}