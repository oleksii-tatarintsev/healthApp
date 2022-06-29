import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/domain/bloc/person_data_bloc/person_data_bloc.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';
import 'package:healthapp/utils/validator.dart';

class PersonDataSection extends StatefulWidget {
  const PersonDataSection({Key? key}) : super(key: key);

  @override
  State<PersonDataSection> createState() => PersonDataSectionState();
}

class PersonDataSectionState extends State<PersonDataSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonDataBloc, PersonDataState>(
      builder: (BuildContext context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
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
                  validator: (value) => Validator.validateName(name: value!),
                ),
                SizedBox(
                  height: 38,
                ),
                MCTextField(
                  title: 'Фамилия',
                  onChanged: (value) {},
                  validator: (value) =>
                      Validator.validateLastName(name: value!),
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
                    CustomDatePicker(
                      onChanged: (DateTime value) {
                        context.read<PersonDataBloc>().birthDateSelect(value);
                      },
                    ),
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
                      onChanged: (String value) {
                        context.read<PersonDataBloc>().genderSelect(value);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, PersonDataState state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => ToastMessenger.showContainer(
            context: context,
            child: ShowToast(errorMessage: error),
          ),
        );
      },
    );
  }

  bool submitForm() {
    return _formKey.currentState!.validate();
  }
}
