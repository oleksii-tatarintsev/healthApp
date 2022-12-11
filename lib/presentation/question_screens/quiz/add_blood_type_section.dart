import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/domain/bloc/blood_type_bloc/blood_type_bloc.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class SelectBloodTypeSection extends StatefulWidget {
  const SelectBloodTypeSection({Key? key}) : super(key: key);

  @override
  State<SelectBloodTypeSection> createState() => SelectBloodTypeSectionState();
}

class SelectBloodTypeSectionState extends State<SelectBloodTypeSection> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BloodTypeBloc, BloodTypeState>(
      builder: (BuildContext context, state) {
        final BloodTypeBloc bloc = context.read<BloodTypeBloc>();
        print(state);

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                'Укажите вашу группу крови',
                style: MCTextStyles.black20SemiBold600,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Text(
                  'Эти данные вы можете изменить в любой момент',
                  style: MCTextStyles.black14Medium500,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Card(
                color: MCColors.white,
                child: SizedBox(
                  height: 237,
                  width: 337,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 50,
                      horizontal: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Группа крови',
                              style: MCTextStyles.black14Medium500,
                            ),
                            if (bloc.state is BloodTypeStateInitial)
                              Text(
                                '---',
                                style: MCTextStyles.blue14Bold700,
                              )
                            else if (bloc.state is BloodTypeStateValid)
                              Text(
                                '${bloc.rhesus} ${bloc.group}',
                                style: MCTextStyles.blue14Bold700,
                              ),
                          ],
                        ),
                        CustomRadioDemo(
                          title1: 'Rh+',
                          title2: 'Rh-',
                          onChanged: (String value) {
                            bloc.getRhesus(value);
                          },
                        ),
                        MCChoice(
                          options: [
                            'O (I)',
                            'A (II)',
                            'B (III)',
                            'AB (IV)',
                          ],
                          onChanged: (String value) {
                            bloc.getType(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, BloodTypeState state) {
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
}
