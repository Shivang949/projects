import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../store/content_store.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  final TextEditingController userNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final store = context.read<ContentStore>();
      store.fetchOffers('signup');
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<ContentStore>();
    final theme = Theme.of(context);
    return Column(
      children: [
        if (store.finalOffer != null && store.finalOffer!.title.isNotEmpty)
          Text(
            store.finalOffer!.title,
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: theme.colorScheme.onSurface),
          ),
        const SizedBox(
          height: 12,
        ),
        if (store.finalOffer != null && store.finalOffer!.subTitle.isNotEmpty)
          Text(
            store.finalOffer!.subTitle,
            style: theme.textTheme.titleLarge
                ?.copyWith(color: theme.colorScheme.onSurface),
          ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: store.finalOffer?.items
                      .where((item) => item.title == 'Firstname')
                      .first
                      .title,
                  labelText: 'FirstName *',
                  border: const OutlineInputBorder(),
                ),
                validator: (String? value) {
                  return (value == null || value.isEmpty)
                      ? 'Please enter some text'
                      : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: store.finalOffer?.items
                      .where((item) => item.title == 'LastName')
                      .first
                      .title,
                  labelText: 'LastName *',
                  border: const OutlineInputBorder(),
                ),
                validator: (String? value) {
                  return (value == null || value.isEmpty)
                      ? 'Please enter some text'
                      : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: store.finalOffer?.items
                      .where((item) => item.title == 'username')
                      .first
                      .title,
                  labelText: 'username *',
                  border: const OutlineInputBorder(),
                ),
                validator: (String? value) {
                  return (value == null || value.isEmpty)
                      ? 'Please enter some text'
                      : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                  onPressed: () {
                    final username = userNameController.text.trim();
                    store.setSessionStorageKey(username);

                    Fluttertoast.showToast(
                      msg: "User saved successfully",
                      gravity: ToastGravity.BOTTOM,
                    );
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ],
    );
  }
}
