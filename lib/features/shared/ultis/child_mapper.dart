import 'package:fichas_esdi/features/children/domain/entities/child.dart';
import 'package:fichas_esdi/features/shared/ultis/date_utils.dart';

class ChildMapper {
  static Map<String, dynamic> toCardProps(Child child) {
    final now = DateTime.now().toUtc();

    final aplicable = child.isCurrentlyAdmitted || child.isGraduated;
    final aplicableText = child.isCurrentlyAdmitted
        ? "Ingreso aplicable"
        : child.isGraduated
        ? "Egreso aplicable"
        : "No aplicable";

    return {
      "codigo": child.documentNumber,
      "fecha": DateUtilsEsdi.formatDate(child.admissionDate),
      "meses":
          "${DateUtilsEsdi.monthsBetweenFullUtc(child.birthday, now)} meses",
      "nombre": "${child.lastName}, ${child.firstName}",
      "ingreso":
          "Ficha de ingreso disponible desde el ${DateUtilsEsdi.formatDateRange(child.admissionValidFrom, child.admissionValidUntil)}",
      "egreso":
          "Ficha de egreso disponible desde el ${DateUtilsEsdi.formatDateLong(child.graduationDate)}",
      "aplicable": aplicable,
      "aplicableText": aplicableText,
    };
  }
}
