import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Widget _showToast(String error) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(error),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonDataBloc, PersonDataState>(
      builder: (BuildContext context, state) {
        print(state);

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
          error: (error) => fToast.showToast(
            child: _showToast(error),
            gravity: ToastGravity.BOTTOM,
            toastDuration: Duration(seconds: 2),
          ),
        );
      },
    );
  }

  bool submitForm() {
    return _formKey.currentState!.validate();
  }
}
