import 'package:dicionario_mobile_codesh/features/dictionary/viewmodel/dictionary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DictionaryView extends StatelessWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DictionaryViewModel(),
        child: Consumer<DictionaryViewModel>(
            builder: (context, dictionaryViewModel, child) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.search,
                          maxLength: 40,
                          onEditingComplete: () async {
                            dictionaryViewModel.searchWord();
                          },
                          onChanged: (value) =>
                              dictionaryViewModel.changeInputText(value),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            labelText: "Word",
                          ),
                          controller: dictionaryViewModel.searchInput,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                                onPressed: () {
                                  dictionaryViewModel.searchWord();
                                },
                                child: const Text("Search"))),
                        if (dictionaryViewModel.isLoading)
                          const LinearProgressIndicator()
                        else if (dictionaryViewModel.dictionaryInfo == null)
                          const Text("Search for a word")
                        else if (!dictionaryViewModel.isLoading)
                          Column(
                            children: [
                              Text(dictionaryViewModel.dictionaryInfo!.word),
                              if (dictionaryViewModel
                                          .dictionaryInfo?.phonetic !=
                                      null &&
                                  dictionaryViewModel
                                      .dictionaryInfo!.phonetic!.isNotEmpty)
                                Text(
                                  dictionaryViewModel.dictionaryInfo!.phonetic!,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600),
                                ),
                              if (dictionaryViewModel.dictionaryInfo?.phonetics
                                          .first.audio !=
                                      null &&
                                  dictionaryViewModel.dictionaryInfo!.phonetics
                                      .first.audio!.isNotEmpty)
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    if (dictionaryViewModel.dictionaryInfo !=
                                        null) {
                                      final audioUrl = dictionaryViewModel
                                          .dictionaryInfo!
                                          .phonetics
                                          .first
                                          .audio;
                                      if (audioUrl != null) {
                                        if (audioUrl.isNotEmpty) {
                                          dictionaryViewModel
                                              .playPhonetic(audioUrl);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "Audio not available for this word."),
                                            ),
                                          );
                                        }
                                      }
                                    }
                                  },
                                  label: const Text("Listen phonetic"),
                                ),
                              if (dictionaryViewModel.dictionaryInfo?.origin !=
                                      null &&
                                  dictionaryViewModel
                                      .dictionaryInfo!.origin.isNotEmpty)
                                Text(
                                    dictionaryViewModel.dictionaryInfo!.origin),
                              if (dictionaryViewModel
                                      .dictionaryInfo?.meanings !=
                                  null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...dictionaryViewModel
                                        .dictionaryInfo!.meanings
                                        .map((meaning) => Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Text(
                                                    "${meaning.partOfSpeech}:",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                ...meaning.definitions.map(
                                                    (meaningDef) => Text(
                                                        "${meaningDef.definition} /")),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                if (meaning
                                                    .definitions.isNotEmpty)
                                                  ...meaning.definitions
                                                      .expand((definition) {
                                                    List<Widget> widgets = [];

                                                    if (definition
                                                        .synonyms.isNotEmpty) {
                                                      widgets.add(
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                "Synonyms:"),
                                                            Wrap(
                                                              spacing: 8,
                                                              children: definition
                                                                  .synonyms
                                                                  .map((synonymus) => Chip(
                                                                      label: Text(
                                                                          synonymus)))
                                                                  .toList(),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }

                                                    if (definition
                                                        .antonyms.isNotEmpty) {
                                                      widgets.add(
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                "Antonyms:"),
                                                            Wrap(
                                                              spacing: 5,
                                                              children: definition
                                                                  .antonyms
                                                                  .map((antonym) => Chip(
                                                                      label: Text(
                                                                          antonym)))
                                                                  .toList(),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                    return widgets;
                                                  }),
                                              ],
                                            )),
                                    const SizedBox(
                                      height: 30,
                                    )
                                  ],
                                )
                            ],
                          ),
                      ],
                    ),
                  ),
                )));
  }
}
