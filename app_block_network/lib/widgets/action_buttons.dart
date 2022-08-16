// import 'package:app_block_network/bloc/user_bloc.dart';
// import 'package:app_block_network/bloc/user_event.dart';
import 'package:app_block_network/cubit/user_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = context.read<UserCubit>();
    // final UserBloc userBloc = context.read<UserBloc>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          child: Text('Load'),
          onPressed: () {
            userCubit.fetchUsers();
            // userBloc.add(UserLoadEvent());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          child: Text('Clear'),
          onPressed: () {
            userCubit.clearUsers();
            // userBloc.add(UserClearEvenet());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
        ),
      ],
    );
  }
}
