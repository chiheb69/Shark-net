
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AR extends StatefulWidget {
  @override
  _ARState createState() => _ARState();
}

class _ARState extends State<AR> {
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
    'أدوات الصيد',
    'صنار طافف',
    'صنار غاطس',
    'شباك داءرية',
    'غطاتيا',
    'جاراسيا',
    'صيد بالكركارة',
    'شباك مبطن',
    'آخر (حدد)',
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
        'التاريخ ': date,
        'الموقع ': location,
        'العمر': _selectedAgeGroup!,
        'النشاط': _selectedActivities,
        ' هل يمكنك تحديد أنواع مختلفة من أسماك القرش؟': _selectedSharkGroup!,
        'في رأيك، هل تراجع إعداد القروش البيضاء بشكل:': _selectedabundanceGroup,
        ' في رأيك، هل حجم القرش الأبيض المتوسط خلال الصيد أو في الأسواق:': _selectedcatchesGroup,
        ' في أي وقت من السنة ترى أو تصطاد عادة قروش بيضاء': _selectedyearGroup
      };

      for (String gearOption in _fishingGearOptions) {
        if (_fishingGearControllers.containsKey(gearOption)) {
          formData[gearOption] = _fishingGearControllers[gearOption]!.text;
        }
      }

      formData['متى بدأت في ممارسة الصيد؟ (تقديراً لسنة بداية العمل في هذا المجال)'] =
          _additionalTextField1Controller.text;
      formData['كم يومًا في الأسبوع تذهب عادة للصيد؟'] =
          _additionalTextField2Controller.text;
      formData['هل الصيد هو مصدر دخلك الرئيسي؟'] =
          _additionalTextField3Controller.text;
      formData['ما هو نوع الأسماك الذي تستهدفه؟'] =
          _additionalTextField4Controller.text;
      formData['هل تستهدف الأسماك القرشية؟'] = _additionalTextField5Controller.text;
      formData['• هل تشمل طريقتك في الصيد استخدام الطعم؟ إذا كانت الإجابة نعم، مع ماذا؟'] =
          _additionalTextField6Controller.text;
      formData['• هل ترى عادة الأسماك القرشية في رحلات الصيد؟ في أي فترة تراها بشكل أكثر؟'] =
          _additionalTextField7Controller.text;
      formData['• هل يمكنك تحديد أنواع مختلفة من أسماك القرش؟'] =
          _additionalTextField8Controller.text;
      formData['• أين تذهب عادة للصيد؟ (يمكنك تحديد منطقة على الخريطة'] =
          _additionalTextField9Controller.text;
      formData['• كم عدد الأسماك القرشية التي تصطادها كل عام؟ '] =
          _additionalTextField10Controller.text;
      formData[' هل ترى أو تصطاد بشكل متكرر فرادى قرش أبيض حاملاً؟'] =
          _additionalTextField13Controller.text;
      formData['• هل لديك فيديوهات أو صور للقروش البيضاء التي رأيتها؟'] =
          _additionalTextField11Controller.text;
      formData['• هل تكون مهتمًا بالمساعدة في تقييم التوزيع الحالي للقروش البيضاء من خلال مشاركة المشاهدات أو الصيد المستقبلي؟ (حساب في فيسبوك أو رقم واتساب'] =
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
        title: Text('مقابلة'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _numberController,
                decoration: InputDecoration(labelText: 'رقم '),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'التاريخ '),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'الموقع '),
              ),
              SizedBox(height: 16),
              Text(
                'معلومات عامة',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('العمر:', style: TextStyle(fontWeight: FontWeight.bold)),
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
                'النشاط:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  buildCheckbox('تجاري '),
                  buildCheckbox('ترفيهي'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'عدد الأيام التي تصطاد فيها سنويًا :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildFishingGearInputs(),

              buildAdditionalTextField(
                  '• متى بدأت في ممارسة الصيد؟ (تقديراً لسنة بداية العمل في هذا المجال)',
                  _additionalTextField1Controller),
              buildAdditionalTextField(
                  '• كم يومًا في الأسبوع تذهب عادة للصيد؟',
                  _additionalTextField2Controller),
              buildAdditionalTextField('• هل الصيد هو مصدر دخلك الرئيسي؟',
                  _additionalTextField3Controller),

              SizedBox(height: 16),
              Text(
                'نشاط الصيد :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildAdditionalTextField(
                  '• أين تذهب عادة للصيد؟ (يمكنك تحديد منطقة على الخريطة',
                  _additionalTextField9Controller),

              buildAdditionalTextField('ما هو نوع الأسماك الذي تستهدفه؟',
                  _additionalTextField4Controller),
              buildAdditionalTextField(
                  'هل تستهدف الأسماك القرشية؟', _additionalTextField5Controller),
              buildAdditionalTextField(
                  '• هل تشمل طريقتك في الصيد استخدام الطعم؟ إذا كانت الإجابة نعم، مع ماذا؟',
                  _additionalTextField6Controller),
              buildAdditionalTextField(
                  '• هل ترى عادة الأسماك القرشية في رحلات الصيد؟ في أي فترة تراها بشكل أكثر؟',
                  _additionalTextField7Controller),
              buildAdditionalTextField(
                  '• هل يمكنك تحديد أنواع مختلفة من أسماك القرش؟',
                  _additionalTextField8Controller),
              Text(
                ' هل يمكنك تحديد أنواع مختلفة من أسماك القرش؟',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile1('نعم'),
                  buildRadioTile1('لا'),
                ],
              ),
              Text(
                'القرش الأبيض',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildAdditionalTextField(
                  '• كم عدد الأسماك القرشية التي تصطادها كل عام؟',
                  _additionalTextField10Controller),
              Text(
                '• هل يمكنك تحديد متى وأين حدث ذلك خلال خبرتك المهنية؟ يمكن أيضًا أن يكون ذلك إذا رأيتهم في الأسواق (حدد "السوق" في معدات الصيد)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              buildAdditionalTextField(
                  'نوع الأسماك	معدات الصيد	المنطقة/ الإحداثيات	العمق	الطول	الوزن	الجنس	الشهر/السنة	الصورة/الفيديو (نعم/لا)',
                  _additionalTextField14Controller),
              buildAdditionalTextField(
                  'نوع الأسماك	معدات الصيد	المنطقة/ الإحداثيات	العمق	الطول	الوزن	الجنس	الشهر/السنة	الصورة/الفيديو (نعم/لا)',
                  _additionalTextField15Controller),
              buildAdditionalTextField(
                  'نوع الأسماك	معدات الصيد	المنطقة/ الإحداثيات	العمق	الطول	الوزن	الجنس	الشهر/السنة	الصورة/الفيديو (نعم/لا)',
                  _additionalTextField16Controller),
              Text(
                'في رأيك، هل تراجع إعداد القروش البيضاء بشكل:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile2('تراجع بشكل قوي  '),
                  buildRadioTile2('تراجع  '),
                  buildRadioTile2('كما كانت سابقاً  '),
                  buildRadioTile2('زيادة بشكل طفيف  '),
                  buildRadioTile2('زيادة '),

                ],
              ),
              Text(
                ' في رأيك، هل حجم القرش الأبيض المتوسط خلال الصيد أو في الأسواق:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile4('تراجع بشكل قوي  '),
                  buildRadioTile4('تراجع  '),
                  buildRadioTile4('كما كانت سابقاً  '),
                  buildRadioTile4('زيادة بشكل طفيف  '),
                  buildRadioTile4('زيادة '),

                ],
              ),

              buildAdditionalTextField(
                  ' هل ترى أو تصطاد بشكل متكرر فرادى قرش أبيض حاملاً؟',
                  _additionalTextField13Controller),
              Text(
                ' في أي وقت من السنة ترى أو تصطاد عادة قروش بيضاء',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRadioTile3('جانفي '),
                  buildRadioTile3('فيفري '),
                  buildRadioTile3('مارس '),
                  buildRadioTile3('أفريل '),
                  buildRadioTile3('ماي '),
                  buildRadioTile3('جوان '),
                  buildRadioTile3('جويلية  '),
                  buildRadioTile3('أوت '),
                  buildRadioTile3('سبتمبر '),
                  buildRadioTile3('أكتوبر '),
                  buildRadioTile3('نوفمبر'),
                  buildRadioTile3('ديسمبر '),

                ],
              ),

              buildAdditionalTextField(
                  '• هل لديك فيديوهات أو صور للقروش البيضاء التي رأيتها؟',
                  _additionalTextField11Controller),
              buildAdditionalTextField(
                  '• هل تكون مهتمًا بالمساعدة في تقييم التوزيع الحالي للقروش البيضاء من خلال مشاركة المشاهدات أو الصيد المستقبلي؟ (حساب في فيسبوك أو رقم واتساب',
                  _additionalTextField12Controller),


              ElevatedButton(
                onPressed: _submitForm,
                child: Text('إبعث'),
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