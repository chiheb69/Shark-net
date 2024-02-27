
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FR extends StatefulWidget {
  @override
  _FRState createState() => _FRState();
}

class _FRState extends State<FR> {
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
    'Palangre pélagique',
    'Palangre de fond',
    'Senne coulissante',
    'Chalutage',
    'Gattatie',
    'Garracia',
    'Filet trémail',
    'Pièges',
    'Autres (précisez)',
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
        'emplacement': location,
        'age': _selectedAgeGroup!,
        'activities': _selectedActivities,
        'Pouvez-vous identifier différentes espèces de requins ?': _selectedSharkGroup!,
        'Selon vous, l’abondance des requins blancs a ': _selectedabundanceGroup,
        'Selon vous, la taille moyenne des requins blancs lors des captures ou sur les marchés est de :': _selectedcatchesGroup,
        'Quand au cours de l’année voyez-vous/attrapez-vous habituellement des requins blancs ?': _selectedyearGroup
      };

      for (String gearOption in _fishingGearOptions) {
        if (_fishingGearControllers.containsKey(gearOption)) {
          formData[gearOption] = _fishingGearControllers[gearOption]!.text;
        }
      }

      formData['Quand as-tu commencé à pêcher ? (Année approximative de travail dans ce domaine)'] =
          _additionalTextField1Controller.text;
      formData['Combien de jours par semaine allez-vous habituellement à la pêche ?'] =
          _additionalTextField2Controller.text;
      formData['La pêche est-elle votre principal revenu ?'] =
          _additionalTextField3Controller.text;
      formData['Quelle est votre espèce cible ?'] =
          _additionalTextField4Controller.text;
      formData['Ciblez-vous les requins ?'] = _additionalTextField5Controller.text;
      formData['Votre méthode de pêche implique-t-elle le chumming ? Si OUI, avec quoi ?'] =
          _additionalTextField6Controller.text;
      formData['Voyez-vous habituellement des requins lors de vos sorties de pêche ? À quelle période les voyez-vous le plus ?'] =
          _additionalTextField7Controller.text;
      formData['Avez-vous déjà identifié un requin blanc ?'] =
          _additionalTextField8Controller.text;
      formData['Où allez-vous habituellement pêcher ? (vous pouvez spécifier une zone sur la carte)'] =
          _additionalTextField9Controller.text;
      formData['Combien de requins attrapez-vous chaque année ? '] =
          _additionalTextField10Controller.text;
      formData['Voyez-vous/attrapez-vous souvent des requins blancs gravides ?'] =
          _additionalTextField13Controller.text;
      formData['Avez-vous des vidéos ou des photos des requins blancs que vous avez vus ?'] =
          _additionalTextField11Controller.text;
      formData['Seriez-vous intéressé à contribuer à évaluer la répartition actuelle des requins blancs en partageant de futures observations ou captures ? (Compte Facebook ou numéro WhatsApp ??)'] =
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
        title: Text('ENTRETIEN'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _numberController,
                decoration: InputDecoration(labelText: 'Numéro'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Emplacement'),
              ),
              SizedBox(height: 16),
              Text(
                'informations générales',
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
                'Activité:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  buildCheckbox('Commerciale'),
                  buildCheckbox('Récréative '),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Équipement de pêche & Nombre de jours de pêche par an :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildFishingGearInputs(),

              buildAdditionalTextField(
                  '• Quand as-tu commencé à pêcher ? (Année approximative de travail dans ce domaine)',
                  _additionalTextField1Controller),
              buildAdditionalTextField(
                  '• Combien de jours par semaine allez-vous habituellement à la pêche ?',
                  _additionalTextField2Controller),
              buildAdditionalTextField('• La pêche est-elle votre principal revenu ?',
                  _additionalTextField3Controller),

              SizedBox(height: 16),
              Text(
                '2. Activité de pêche :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildAdditionalTextField(
                  'Où allez-vous habituellement pêcher ? (vous pouvez spécifier une zone sur la carte)',
                  _additionalTextField9Controller),

              buildAdditionalTextField('Quelle est votre espèce cible ?',
                  _additionalTextField4Controller),
              buildAdditionalTextField(
                  'Ciblez-vous les requins ?', _additionalTextField5Controller),
              buildAdditionalTextField(
                  'Votre méthode de pêche implique-t-elle le chumming ? Si OUI, avec quoi ?',
                  _additionalTextField6Controller),
              buildAdditionalTextField(
                  'Voyez-vous habituellement des requins lors de vos sorties de pêche ? À quelle période les voyez-vous le plus ?',
                  _additionalTextField7Controller),
              buildAdditionalTextField(
                  'Avez-vous déjà identifié un requin blanc ?',
                  _additionalTextField8Controller),
              Text(
                'Pouvez-vous identifier différentes espèces de requins ?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile1('Oui'),
                  buildRadioTile1('Non'),
                ],
              ),
              Text(
                '3. requin blanc',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildAdditionalTextField(
                  'Combien de requins attrapez-vous chaque année ?',
                  _additionalTextField10Controller),
              Text(
                'Pouvez-vous préciser quand et où cela s est produit au cours de votre expérience professionnelle ? Cela peut l être aussi si vous les avez vus sur les marchés (précisez « Marché » dans les engins de pêche)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildAdditionalTextField(
                  'ESPÈCES	Matériel  de pêche	Zone/Coordonnée 	Profondeur	Sexe 	Longueur	Poids	Mois /année	Photo/video ', _additionalTextField14Controller),
              buildAdditionalTextField(
                  'ESPÈCES	Matériel  de pêche	Zone/Coordonnée 	Profondeur	Sexe 	Longueur	Poids	Mois /année	Photo/video ',
                  _additionalTextField15Controller),
              buildAdditionalTextField(
                  'ESPÈCES	Matériel  de pêche	Zone/Coordonnée 	Profondeur	Sexe 	Longueur	Poids	Mois /année	Photo/video ',
                  _additionalTextField16Controller),
              Text(
                'Selon vous, l’abondance des requins blancs a ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile2('fortement diminué  '),
                  buildRadioTile2('diminuée  '),
                  buildRadioTile2('pareil qu avant  '),
                  buildRadioTile2('légèrement augmenté  '),
                  buildRadioTile2('augmenté '),

                ],
              ),
              Text(
                'Selon vous, la taille moyenne des requins blancs lors des captures ou sur les marchés est de :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile4('fortement diminué  '),
                  buildRadioTile4('diminuée  '),
                  buildRadioTile4('pareil qu avant  '),
                  buildRadioTile4('légèrement augmenté  '),
                  buildRadioTile4('augmenté '),

                ],
              ),

              buildAdditionalTextField(
                  'Voyez-vous/attrapez-vous souvent des requins blancs gravides ?',
                  _additionalTextField13Controller),
              Text(
                'Quand au cours de l’année voyez-vous/attrapez-vous habituellement des requins blancs ?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile3('Janvier  '),
                  buildRadioTile3('Février  '),
                  buildRadioTile3('Mars '),
                  buildRadioTile3('Avril  '),
                  buildRadioTile3('Mai  '),
                  buildRadioTile3('Juin  '),
                  buildRadioTile3('Juillet   '),
                  buildRadioTile3('Août  '),
                  buildRadioTile3('Septembre  '),
                  buildRadioTile3('Octobre  '),
                  buildRadioTile3('Novembere'),
                  buildRadioTile3('Décembre  '),

                ],
              ),

              buildAdditionalTextField(
                  'Avez-vous des vidéos ou des photos des requins blancs que vous avez vus ?',
                  _additionalTextField11Controller),
              buildAdditionalTextField(
                  'Seriez-vous intéressé à contribuer à évaluer la répartition actuelle des requins blancs en partageant de futures observations ou captures ? (Compte Facebook ou numéro WhatsApp ??)',
                  _additionalTextField12Controller),


              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Envoyer'),
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