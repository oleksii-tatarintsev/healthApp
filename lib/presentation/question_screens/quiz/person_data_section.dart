import 'package:flutter/cupertino.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class PersonDataSection extends StatelessWidget {
  const PersonDataSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            'Введите Ваши данные',
            style: MCTextStyles.black20SemiBold600,
          ),
          SizedBox(
            height: 58,
          ),
          MCTextField(
            title: 'Имя',
            onChanged: (value) {},
          ),
          SizedBox(
            height: 38,
          ),
          MCTextField(
            title: 'Фамилия',
            onChanged: (value) {},
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'Дата рождения',
                style: MCTextStyles.black14Medium500,
              ),
              Spacer(),
              CustomDatePicker(),
            ],
          ),
          SizedBox(
            height: 33,
          ),
          Row(
            children: [
              Text(
                'Пол',
                style: MCTextStyles.black14Medium500,
              ),
              Spacer(),
              CustomRadioDemo(
                title1: 'Мужской',
                title2: 'Женский',
              ),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
