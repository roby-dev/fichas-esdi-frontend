import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChildCard extends StatelessWidget {
  final String id;
  final String codigo;
  final String fecha;
  final String meses;
  final String nombre;
  final String ingreso;
  final String egreso;
  final bool aplicable;
  final String aplicableText;

  const ChildCard({
    super.key,
    required this.id,
    required this.codigo,
    required this.fecha,
    required this.meses,
    required this.nombre,
    required this.ingreso,
    required this.egreso,
    required this.aplicable,
    required this.aplicableText,
  });

  @override
  Widget build(BuildContext context) {
    final color = aplicable
        ? Theme.of(context).colorScheme.primary
        : Colors.red;

    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          context.push('/children/$id');
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(codigo),
                  const SizedBox(width: 8),
                  Text(fecha),
                  const SizedBox(width: 8),
                  Text(meses),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      aplicableText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              const SizedBox(height: 8),
              Text(
                ingreso,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                egreso,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
