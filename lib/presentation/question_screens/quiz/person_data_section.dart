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

  void _showToast() {
    final Widget toast = Container(
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
          Text('This is a Custom Toast'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonDataBloc>(
      create: (BuildContext context) => PersonDataBloc(),
      child: BlocConsumer<PersonDataBloc, PersonDataState>(
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
                        onChanged: (DateTime value) {},
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

                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // state.when(
                  //   initial: (){},
                  //   valid: valid,
                  //   error:  (_) { fToast.showToast(
                  //     child: toast,
                  //     gravity: ToastGravity.BOTTOM,
                  //     toastDuration: Duration(seconds: 2),
                  //   );},
                  //   loading: ()=> CircularProgressIndicator(),
                  // ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, PersonDataState state) {
          state.map(error: (PersonDataStateError value) {},
            initial: (PersonDataStateInitial value) {},
            loading: (PersonDataStateLoading value) {},
            valid: (PersonDataStateValid value) {},);
        },),
    );
  }

  bool submitForm() {
    return _formKey.currentState!.validate();
  }


}
