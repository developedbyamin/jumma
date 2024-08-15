import 'package:flutter/material.dart';

import '../../../../core/config/theme/app_colors.dart';

class FilterPage extends StatefulWidget {
const FilterPage({ Key? key }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  final Map<String, bool> _filters = {
    "Baku": false,
    "Ganja": false,
    "Shamakhi": false,
    "Sunni": false,
    "Shia": false,
    "Parking Availability": false,
    "Accessibility (Wheelchair Access)": false,
    "Women's Prayer Area": false,
    "Madrasa (Religious School)": false,
    "Library": false,
    "Azerbaijani": false,
    "Arabic": false,
    "Persian": false,
    "English": false,
    "Proximity to Public Transport": false,
    "Nearby Restaurants or Halal Food Options": false,
    "Nearby Hotels or Accommodation": false,
  };

  List<String> getSelectedValues() {
    return _filters.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }
  
  @override
  Widget build(BuildContext context){
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter', style: textTheme.headlineMedium,),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _filters.updateAll((key, value) => false);
              });
            },
            child: Text('Clear', style: textTheme.bodyMedium,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            buildSectionTitle('Location'),
            buildCheckbox("Baku"),
            buildCheckbox("Ganja"),
            buildCheckbox("Shamakhi"),
            buildSectionTitle('Religious Affiliation'),
            buildCheckbox("Sunni"),
            buildCheckbox("Shia"),
            buildSectionTitle('Facilities'),
            buildCheckbox("Parking Availability"),
            buildCheckbox("Accessibility (Wheelchair Access)"),
            buildCheckbox("Women's Prayer Area"),
            buildCheckbox("Madrasa (Religious School)"),
            buildCheckbox("Library"),
            buildSectionTitle('Language Services'),
            buildCheckbox("Azerbaijani"),
            buildCheckbox("Arabic"),
            buildCheckbox("Persian"),
            buildCheckbox("English"),
            buildSectionTitle('Nearby Landmarks or Facilities'),
            buildCheckbox("Proximity to Public Transport"),
            buildCheckbox("Nearby Restaurants or Halal Food Options"),
            buildCheckbox("Nearby Hotels or Accommodation"),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 10),
      child: Text(
        title,
        style: textTheme.headlineMedium,
      ),
    );
  }

  Widget buildCheckbox(String title) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor: Colors.white,
          activeColor: AppColors.primary,
          value: _filters[title],
          onChanged: (value) {
            setState(() {
              _filters[title] = value!;
            });
          },
        ),
        Text(title, style: textTheme.bodyLarge,),
      ],
    );
  }

}


