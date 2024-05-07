
import 'package:ajuda_rs_cadastramento/data/models/distribution_center.dart';

abstract class ManageDistributionCenterEvent {}

class CreateDistributionCenterEvent extends ManageDistributionCenterEvent {
  final DistributionCenterModel distributionCenter;
  CreateDistributionCenterEvent({required this.distributionCenter});
}

class DeleteDistributionCenterEvent extends ManageDistributionCenterEvent {}

class UpdateDistributionCenterEvent extends ManageDistributionCenterEvent {}
