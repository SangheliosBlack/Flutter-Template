import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/point_of_sale/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddNewClientDialog extends ConsumerWidget {

  final bool addInmediately;

  const AddNewClientDialog({
    super.key,
    required this.addInmediately
  });

  @override
  Widget build(BuildContext context,ref) {

    //final client = ref.watch(clientsProvider).

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClientsHeader(),
                      SearchClientWidget(),
                      Divider(color: Colors.grey.withAlpha(50),height: 10),
                      Gap(25),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 20,
                          children: [
                            ClientDialogNameField(),
                            ClientDialogPhoneField(),
                            ClientDialogAddressField(),
                            ClientDialogReferenceField()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ClientsDialogButtons(
              addInmediately: addInmediately,
            )
          ],
        ),
      ),
    );
  }
}