
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EN extends StatefulWidget {
  @override
  _ENState createState() => _ENState();
}

class _ENState extends State<EN> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  String? _selectedAgeGroup;
  String? _selectedSharkGroup;
  String? _selectedabundanceGroup;
  String? _selectedcatchesGroup;
  String? _selectedyearGroup;

  List<String> _selectedActivities = [];
  List<String> _fishingGearOptions = [
    'Pelagic longline',
    'Bottom longline',
    'Purse seine',
    'Trawling',
    'Gattatia',
    'Garracia',
    'Trammel net',
    'Traps',
    'Other (Specify)',
  ];
  Map<String, TextEditingController> _fishingGearControllers = {};

  final TextEditingController _additionalTextField1Controller = TextEditingController();
  final TextEditingController _additionalTextField2Controller = TextEditingController();
  final TextEditingController _additionalTextField3Controller = TextEditingController();
  final TextEditingController _additionalTextField4Controller = TextEditingController();
  final TextEditingController _additionalTextField5Controller = TextEditingController();
  final TextEditingController _additionalTextField6Controller = TextEditingController();
  final TextEditingController _additionalTextField7Controller = TextEditingController();
  final TextEditingController _additionalTextField8Controller = TextEditingController();
  final TextEditingController _additionalTextField9Controller = TextEditingController();
  final TextEditingController _additionalTextField10Controller = TextEditingController();
  final TextEditingController _additionalTextField11Controller = TextEditingController();
  final TextEditingController _additionalTextField12Controller = TextEditingController();
  final TextEditingController _additionalTextField13Controller = TextEditingController();
  final TextEditingController _additionalTextField14Controller = TextEditingController();
  final TextEditingController _additionalTextField15Controller = TextEditingController();
  final TextEditingController _additionalTextField16Controller = TextEditingController();

  void _submitForm() async {
    String number = _numberController.text;
    String date = _dateController.text;
    String location = _locationController.text;

    if (number.isNotEmpty &&
        date.isNotEmpty &&
        location.isNotEmpty &&
        _selectedAgeGroup != null) {
      Map<String, dynamic> formData = {
        'number': number,
        'date': date,
        'location': location,
        'age': _selectedAgeGroup!,
        'activities': _selectedActivities,
        'Can you identify different shark species?': _selectedSharkGroup!,
        'In your opinion, white shark abundance has:': _selectedabundanceGroup,
        'In your opinion, white shark mean size during catches or in markets is:': _selectedcatchesGroup,
        'When during the year do you usually see/catch white sharks?': _selectedyearGroup
      };

      for (String gearOption in _fishingGearOptions) {
        if (_fishingGearControllers.containsKey(gearOption)) {
          formData[gearOption] = _fishingGearControllers[gearOption]!.text;
        }
      }

      formData['When did you start fishing? (Approx year of work in this field)'] =
          _additionalTextField1Controller.text;
      formData['How many days per week do you usually go fishing?'] =
          _additionalTextField2Controller.text;
      formData['Is fishing your primary income?'] =
          _additionalTextField3Controller.text;
      formData['What is your target species?'] =
          _additionalTextField4Controller.text;
      formData['Do you target sharks?'] = _additionalTextField5Controller.text;
      formData['Does your fishing method involve chumming? If YES, with what?'] =
          _additionalTextField6Controller.text;
      formData['Do you usually see sharks on your fishing trips? In which period do you see them most?'] =
          _additionalTextField7Controller.text;
      formData['Have you ever identified a white shark?'] =
          _additionalTextField8Controller.text;
      formData['Where do you usually go fishing? (you can specify an area on the map)'] =
          _additionalTextField9Controller.text;
      formData['How many sharks do you catch each year? '] =
          _additionalTextField10Controller.text;
      formData['Do you often see/catch pregnant white shark individuals?'] =
          _additionalTextField13Controller.text;
      formData['Do you have videos or pictures of the white sharks you saw?'] =
          _additionalTextField11Controller.text;
      formData['Would you be interested in helping assess the current distribution of white sharks by sharing future sightings or catches? (Facebook account or WhatsApp number??)'] =
          _additionalTextField12Controller.text;
      formData['SPECIES	Fishing gear Area/Coord	Depth	Sex	Length Weight	Month/Year Photo/video'] =
          _additionalTextField14Controller.text;
      formData['SPECIES	Fishing gear Area/Coord	Depth	Sex	Length Weight	Month/Year Photo/video'] =
          _additionalTextField15Controller.text;
      formData['SPECIES	Fishing gear Area/Coord	Depth	Sex	Length Weight	Month/Year Photo/video'] =
          _additionalTextField16Controller.text;

      await FirebaseFirestore.instance.collection('users').add(formData);

      _numberController.clear();
      _dateController.clear();
      _locationController.clear();
      _selectedAgeGroup = null;
      _selectedcatchesGroup = null;
      _selectedyearGroup = null;
      _selectedabundanceGroup = null;
      _selectedSharkGroup = null;
      _selectedActivities = [];
      _fishingGearControllers.forEach((_, controller) => controller.clear());
      _additionalTextField1Controller.clear();
      _additionalTextField2Controller.clear();
      _additionalTextField3Controller.clear();
      _additionalTextField4Controller.clear();
      _additionalTextField5Controller.clear();
      _additionalTextField6Controller.clear();
      _additionalTextField7Controller.clear();
      _additionalTextField8Controller.clear();
      _additionalTextField9Controller.clear();
      _additionalTextField10Controller.clear();
      _additionalTextField11Controller.clear();
      _additionalTextField12Controller.clear();
      _additionalTextField13Controller.clear();
      _additionalTextField14Controller.clear();
      _additionalTextField15Controller.clear();
      _additionalTextField16Controller.clear();
    } else {
      print("Number, date, location, age, and fishing gear cannot be empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interview'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _numberController,
                decoration: InputDecoration(labelText: 'Number'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              SizedBox(height: 16),
              Text(
                'General Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Age:', style: TextStyle(fontWeight: FontWeight.bold)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile('20-30'),
                  buildRadioTile('30-40'),
                  buildRadioTile('40-50'),
                  buildRadioTile('50-60'),
                  buildRadioTile('>60'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Activity:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  buildCheckbox('Commercial'),
                  buildCheckbox('Recreational'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Fishing Gear Number of days fishing per year :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildFishingGearInputs(),

              buildAdditionalTextField(
                  '• When did you start fishing? (Approx year of work in this field)',
                  _additionalTextField1Controller),
              buildAdditionalTextField(
                  '• How many days per week do you usually go fishing?',
                  _additionalTextField2Controller),
              buildAdditionalTextField('• Is fishing your primary income?',
                  _additionalTextField3Controller),

              SizedBox(height: 16),
              Text(
                '2. Fishing activity :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildAdditionalTextField(
                  'Where do you usually go fishing? (you can specify an area on the map)',
                  _additionalTextField9Controller),

              buildAdditionalTextField('What is your target species?',
                  _additionalTextField4Controller),
              buildAdditionalTextField(
                  'Do you target sharks?', _additionalTextField5Controller),
              buildAdditionalTextField(
                  'Does your fishing method involve chumming? If YES, with what?',
                  _additionalTextField6Controller),
              buildAdditionalTextField(
                  'Do you usually see sharks on your fishing trips? In which period do you see them most?',
                  _additionalTextField7Controller),
              buildAdditionalTextField(
                  'Have you ever identified a white shark?',
                  _additionalTextField8Controller),
              Text(
                'Can you identify different shark species?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile1('Yes'),
                  buildRadioTile1('No'),
                ],
              ),
              Text(
                '3. White shark',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildAdditionalTextField(
                  'How many sharks do you catch each year?',
                  _additionalTextField10Controller),
              Text(
                'Can you specify when and where it happened during your professional experience? It can be also if you saw them in markets (specify “Market” in fishing gear)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildAdditionalTextField(
                  'SPECIES	Fishing gear Area/Coord	Depth	Sex	Length Weight	Month/Year Photo/video',
                  _additionalTextField14Controller),
              buildAdditionalTextField(
                  'SPECIES	Fishing gear Area/Coord	Depth	Sex	Length Weight	Month/Year Photo/video',
                  _additionalTextField15Controller),
              buildAdditionalTextField(
                  'SPECIES	Fishing gear Area/Coord	Depth	Sex	Length Weight	Month/Year Photo/video',
                  _additionalTextField16Controller),
              Text(
                'In your opinion, white shark abundance has:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile2('strongly decreased '),
                  buildRadioTile2('decreased '),
                  buildRadioTile2('same as before '),
                  buildRadioTile2('slightly increased '),
                  buildRadioTile2('increased'),

                ],
              ),
              Text(
                'In your opinion, white shark mean size during catches or in markets is:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile4('strongly decreased '),
                  buildRadioTile4('decreased '),
                  buildRadioTile4('same as before '),
                  buildRadioTile4('slightly increased '),
                  buildRadioTile4('increased'),

                ],
              ),

              buildAdditionalTextField(
                  'Do you often see/catch pregnant white shark individuals?',
                  _additionalTextField13Controller),
              Text(
                'When during the year do you usually see/catch white sharks?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile3('January '),
                  buildRadioTile3('February '),
                  buildRadioTile3('March '),
                  buildRadioTile3('April '),
                  buildRadioTile3('May '),
                  buildRadioTile3('June '),
                  buildRadioTile3('July  '),
                  buildRadioTile3('August '),
                  buildRadioTile3('September '),
                  buildRadioTile3('October '),
                  buildRadioTile3('November'),
                  buildRadioTile3('December '),

                ],
              ),

              buildAdditionalTextField(
                  'Do you have videos or pictures of the white sharks you saw?',
                  _additionalTextField11Controller),
              buildAdditionalTextField(
                  'Would you be interested in helping assess the current distribution of white sharks by sharing future sightings or catches? (Facebook account or WhatsApp number??)',
                  _additionalTextField12Controller),


              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAdditionalTextField(String label,
      TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: label),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  RadioListTile buildRadioTile(String value) {
    return RadioListTile(
      title: Text(value),
      value: value,
      groupValue: _selectedAgeGroup,
      onChanged: (selectedValue) {
        setState(() {
          _selectedAgeGroup = selectedValue.toString();
        });
      },
    );
  }

  RadioListTile buildRadioTile1(String value) {
    return RadioListTile(
      title: Text(value),
      value: value,
      groupValue: _selectedSharkGroup,
      onChanged: (selectedValue) {
        setState(() {
          _selectedSharkGroup = selectedValue.toString();
        });
      },
    );
  }

  RadioListTile buildRadioTile2(String value) {
    return RadioListTile(
      title: Text(value),
      value: value,
      groupValue: _selectedabundanceGroup,
      onChanged: (selectedValue) {
        setState(() {
          _selectedabundanceGroup = selectedValue.toString();
        });
      },
    );
  }

  RadioListTile buildRadioTile3(String value) {
    return RadioListTile(
      title: Text(value),
      value: value,
      groupValue: _selectedyearGroup,
      onChanged: (selectedValue) {
        setState(() {
          _selectedyearGroup = selectedValue.toString();
        });
      },
    );
  }

  RadioListTile buildRadioTile4(String value) {
    return RadioListTile(
      title: Text(value),
      value: value,
      groupValue: _selectedcatchesGroup,
      onChanged: (selectedValue) {
        setState(() {
          _selectedcatchesGroup = selectedValue.toString();
        });
      },
    );
  }

  Widget buildCheckbox(String activity) {
    return Row(
      children: [
        Checkbox(
          value: _selectedActivities.contains(activity),
          onChanged: (value) {
            setState(() {
              if (value != null && value) {
                _selectedActivities.add(activity);
              } else {
                _selectedActivities.remove(activity);
              }
            });
          },
        ),
        Text(activity),
      ],
    );
  }

  Widget buildFishingGearInputs() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _fishingGearOptions.length,
      itemBuilder: (context, index) {
        String gearOption = _fishingGearOptions[index];
        bool isOther = gearOption == 'Other (Specify)';
        _fishingGearControllers.putIfAbsent(
          gearOption,
              () => TextEditingController(),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isOther)
              TextField(
                controller: _fishingGearControllers[gearOption],
                decoration: InputDecoration(labelText: gearOption),
              ),
            SizedBox(height: isOther ? 16 : 8),
          ],
        );
      },
    );
  }
}