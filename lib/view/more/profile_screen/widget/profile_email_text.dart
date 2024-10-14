import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/profile_cubit/profile_cubit.dart';



class ProfileEmailText extends StatelessWidget {
  const ProfileEmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: state is ProfileSuccessState ? Text((
              "${state.profile.info!.email}"),
            style: Theme.of(context).textTheme.labelLarge,)
              : const Text("Guest"),
        );
      },
    );
  }
}
