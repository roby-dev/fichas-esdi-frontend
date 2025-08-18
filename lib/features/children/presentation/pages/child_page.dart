import 'package:fichas_esdi/features/children/presentation/providers/children_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChildPage extends ConsumerStatefulWidget {
  final String? id;

  const ChildPage({super.key, this.id});

  @override
  ConsumerState<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends ConsumerState<ChildPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _docController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  DateTime? _birthday;
  DateTime? _admissionDate;
  String? _communityHallId;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      if (widget.id != null) {
        await ref.read(childrenProvider.notifier).getChildById(widget.id!);
      } else {
        ref.read(childrenProvider.notifier).clearSelectedChild();
      }
    });

    _docController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    _docController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(childrenProvider);
    final child = state.selectedChild;
    final isEdit = widget.id != null;

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(child: Text('Error: ${state.errorMessage}'));
    }

    if (isEdit && child != null) {
      _docController.text = child.documentNumber;
      _firstNameController.text = child.firstName;
      _lastNameController.text = child.lastName;
      _birthday ??= child.birthday;
      _admissionDate ??= child.admissionDate;
      _communityHallId ??= child.communityHallId;
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _docController,
                decoration: const InputDecoration(
                  labelText: "Documento de identidad",
                ),
                keyboardType: TextInputType.number,
                maxLength: 8,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Requerido";
                  if (value.length != 8) return "Debe tener 8 dígitos";
                  return null;
                },
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: "Nombres"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Requerido" : null,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: "Apellidos"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Requerido" : null,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  _birthday == null
                      ? "Seleccionar fecha de nacimiento"
                      : "Nacimiento: ${_birthday!.day}/${_birthday!.month}/${_birthday!.year}",
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _birthday ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      _birthday = picked;
                    });
                  }
                },
              ),
              ListTile(
                title: Text(
                  _admissionDate == null
                      ? "Seleccionar fecha de ingreso"
                      : "Ingreso: ${_admissionDate!.day}/${_admissionDate!.month}/${_admissionDate!.year}",
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _admissionDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _admissionDate = picked;
                    });
                  }
                },
              ),
              DropdownButtonFormField<String>(
                value: _communityHallId,
                items: const [
                  DropdownMenuItem(value: "1", child: Text("Local 1")),
                  DropdownMenuItem(value: "2", child: Text("Local 2")),
                ],
                onChanged: (value) => setState(() => _communityHallId = value),
                decoration: const InputDecoration(
                  labelText: "Local de inscripción",
                ),
                validator: (value) =>
                    value == null ? "Seleccione un local" : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _birthday != null &&
                      _admissionDate != null) {
                    // Aquí llamas a tu provider para crear/editar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isEdit
                              ? "Guardando cambios..."
                              : "Creando nuevo niño...",
                        ),
                      ),
                    );
                  }
                },
                child: Text(isEdit ? "Guardar cambios" : "Crear niño"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
