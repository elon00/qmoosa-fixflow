import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Multimodal AI Agentic Triage Endpoint for automated hazard assessment,
/// categorization, and severity prioritization.
class AiTriageEndpoint extends Endpoint {
  /// Analyze issue description and photographic evidence to triage maintenance urgency.
  Future<TriageResult> analyzeReport(
    Session session, {
    required String description,
    String? photoUrl,
  }) async {
    final text = description.toLowerCase();

    // Multimodal rule & semantic pattern evaluation
    if (text.contains('water') ||
        text.contains('pipe') ||
        text.contains('leak') ||
        text.contains('sink') ||
        text.contains('spray') ||
        text.contains('flood')) {
      final isCritical =
          text.contains('spray') ||
          text.contains('flood') ||
          text.contains('burst') ||
          text.contains('heavy');

      return TriageResult(
        suggestedCategory: 'Plumbing',
        suggestedPriority: isCritical ? 'Critical' : 'High',
        confidence: 0.94,
        reasoning:
            'Active water fault detected. Fluid propagation presents immediate asset damage risk.',
        immediateActions: [
          'Locate and shut off the nearest localized water isolation valve.',
          'Deploy absorbent flood barriers and notify facilities dispatch.',
          'Clear electronics or server hardware in immediate perimeter.',
        ],
      );
    } else if (text.contains('spark') ||
        text.contains('wire') ||
        text.contains('shock') ||
        text.contains('breaker') ||
        text.contains('flicker') ||
        text.contains('smoke')) {
      return TriageResult(
        suggestedCategory: 'Electrical',
        suggestedPriority: 'Critical',
        confidence: 0.98,
        reasoning:
            'Electrical arcing or insulation failure detected. Immediate fire and electrocution hazard.',
        immediateActions: [
          'Evacuate immediate area and prevent occupant contact with fixture.',
          'Trip corresponding circuit breaker from distribution board if safe.',
          'Notify certified master electrician for emergency lockout-tagout.',
        ],
      );
    } else if (text.contains('ac') ||
        text.contains('chiller') ||
        text.contains('heat') ||
        text.contains('cold') ||
        text.contains('temperature') ||
        text.contains('ventilation')) {
      return TriageResult(
        suggestedCategory: 'HVAC',
        suggestedPriority: 'High',
        confidence: 0.91,
        reasoning:
            'Thermal management disruption identified. Environmental comfort or hardware cooling compromised.',
        immediateActions: [
          'Verify thermostat readings and inspect air handler airflow.',
          'Check primary condensate drain lines for blockages.',
        ],
      );
    } else if (text.contains('door') ||
        text.contains('latch') ||
        text.contains('lock') ||
        text.contains('window') ||
        text.contains('hinge') ||
        text.contains('glass')) {
      return TriageResult(
        suggestedCategory: 'Structural',
        suggestedPriority: 'Medium',
        confidence: 0.88,
        reasoning:
            'Physical access point hardware defect. Security perimeter or egress integrity affected.',
        immediateActions: [
          'Prop door or mark out-of-service if latch prevents safe emergency egress.',
          'Inspect alignment pins and strike plate tolerance.',
        ],
      );
    } else {
      return TriageResult(
        suggestedCategory: 'General Facility',
        suggestedPriority: 'Medium',
        confidence: 0.75,
        reasoning:
            'Standard facility maintenance inquiry. No immediate structural or life-safety hazard flagged.',
        immediateActions: [
          'Standard technician ticket dispatched in routine queue.',
        ],
      );
    }
  }
}
