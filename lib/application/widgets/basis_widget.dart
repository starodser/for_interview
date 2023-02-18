// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// class BlocBody {
//     return BlocProvider(
//       create: (context) => SpaceBloc(
//         UserRepository(),
//       )..add(LoadSpaceEvent()),
//       child: BlocBuilder<UserBloc, SpaceState>(
//         builder: (context, state) {
//           if (state is SpaceLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//            if (state is UserErrorState) {
//             return const Center(child:  Text("Error"));
//           }
//           if (state is UserLoadedState) {
//             List<UserModel> userList = state.users;
//             return ListView.builder(
//                 itemCount: userList.length,
//                 itemBuilder: (_, index) {
//                   return Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                     child: Card(
//                         color: Theme.of(context).primaryColor,
//                         child: ListTile(
//                             title: Text(
//                               '${userList[index].firstName}  ${userList[index].lastName}',
//                               style: const TextStyle(color: Colors.white),
//                             ),

//                             subtitle: Text(
//                               '${userList[index].email}',
//                               style: const TextStyle(color: Colors.white),
//                             ),
                            
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(
//                                   userList[index].avatar.toString()),
//                             ))),
//                   );
//                 });
//           }

//           return Container();
//         },
//       ),
//     );
//   }
// }