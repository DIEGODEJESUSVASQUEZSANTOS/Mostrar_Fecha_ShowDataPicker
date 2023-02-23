import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetsFormularios extends StatefulWidget {
  const WidgetsFormularios({super.key});
  @override
  State<WidgetsFormularios> createState() => _WidgetsFormularioState();
}

enum RadioOptions { uno, dos, tres, cuatro }

class _WidgetsFormularioState extends State<WidgetsFormularios> {
  bool? valueCheckBox = false;
  bool? valueSwitchListTile = false;
  double valueSlider = 1.0;
  List<String> itemsDropdown = ['Uno', 'Dos', 'Tres', 'Cuatro'];
  String valueDropdown = 'Uno';
  RadioOptions valueRadio = RadioOptions.uno;
  DateTime? DiaSeleccionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Widgets Formulario'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const Text('TextFormField'),
            TextFormField(),
            CheckboxListTile(
              title: const Text('Soy un checkbox'),
              subtitle: const Text('Presionáme'),
              value: valueCheckBox,
              onChanged: (value) {
                setState(() {
                  valueCheckBox = value;
                });
              },
            ),
            SwitchListTile(
                title: const Text('Soy un SwitchListtile'),
                subtitle: const Text('Presionáme'),
                value: valueSwitchListTile!,
                onChanged: (value) {
                  setState(() {
                    valueSwitchListTile = value;
                  });
                }),
            Slider(
                max: 10,
                min: 0,
                divisions: 5,
                value: valueSlider,
                onChanged: (value) {
                  setState(() {
                    valueSlider = value;
                    print(value);
                  });
                }),
            DropdownButton(
              value: valueDropdown,
              items: itemsDropdown
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (value) {
                setState(
                  () {
                    valueDropdown = value!;
                  },
                );
              },
            ),
            RadioListTile<RadioOptions>(
                title: const Text('Uno'),
                value: RadioOptions.uno,
                groupValue: valueRadio,
                onChanged: (value) {
                  setState(() {
                    valueRadio = value!;
                  });
                }),
            RadioListTile<RadioOptions>(
                title: const Text('Dos'),
                value: RadioOptions.dos,
                groupValue: valueRadio,
                onChanged: (value) {
                  setState(() {
                    valueRadio = value!;
                  });
                }),
            RadioListTile<RadioOptions>(
                title: const Text('Tres'),
                value: RadioOptions.tres,
                groupValue: valueRadio,
                onChanged: (value) {
                  setState(() {
                    valueRadio = value!;
                  });
                }),
            RadioListTile<RadioOptions>(
                title: const Text('Cuatro'),
                value: RadioOptions.cuatro,
                groupValue: valueRadio,
                onChanged: (value) {
                  setState(() {
                    valueRadio = value!;
                  });
                }),

            //TAREA DE FLUTTER: HACER QUE APAREZCA LA FECHA SELECCIONADA EN EL CALENDARIO DE UN ShowDataPicker:     
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Fecha de nacimiento',
                suffixIcon: IconButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 3650)),
                      lastDate: 
                          DateTime.now().add(const Duration(days: 3650)));
                    if (selectedDate != null) {
                      setState(() {
                        DiaSeleccionado = selectedDate;
                      });}
                  },
                  icon: const Icon(Icons.calendar_month_outlined))),
                  controller: TextEditingController(
                  text: DiaSeleccionado != null ? DateFormat('dd-MM-yyyy').format(DiaSeleccionado!): null),
                  readOnly: true,
            ),
            const SizedBox(
              height: 12,
            ),

            TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Hora inicio de clase',
                  suffixIcon: IconButton(
                      onPressed: () {
                        showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                      },
                      icon: const Icon(Icons.timer))),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('No hay llenado todos los campos'),
                              Text('No hay llenado todos los campos'),
                              Text('No hay llenado todos los campos'),
                              Text('No hay llenado todos los campos'),
                              Text('No hay llenado todos los campos'),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Salir'))
                          ],
                        );
                      });
                },
                child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
