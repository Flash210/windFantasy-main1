
// FutureBuilder<UserModel?> buildAppBar() {
//     return FutureBuilder(
//       future: _userModel,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(snapshot.data!.data.teamName,
//                   style: GoogleFonts.raviPrakash(
//                     textStyle: const TextStyle(
//                         color: MyColors.kBlue,
//                         fontSize: 30,
//                         fontWeight: FontWeight.w600),
//                   )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const DottedDashedLine(
//                     height: 3,
//                     width: 100,
//                     axis: Axis.horizontal,
//                     //dashColor: Colors.black,
//                   ),
//                   Text(
//                     " Budget \$${snapshot.data!.data.bank}",
//                     style: GoogleFonts.b612(
//                       textStyle: TextStyle(
//                           color: Colors.grey[700]!,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   const DottedDashedLine(
//                     height: 3,
//                     width: 100,
//                     axis: Axis.horizontal,
//                     //dashColor: Colors.black,
//                   ),
//                 ],
//               ),
//             ],
//           );
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else {
//           return const CircularProgressIndicator(); // Placeholder for loading state
//         }
//       },
//     );
//   }