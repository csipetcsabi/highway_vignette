import 'package:highway_vignette/api/models/payload.dart';
import 'package:highway_vignette/features/highway_vignette/domain/repository/highway_repository.dart';
import 'package:highway_vignette/utils/price_calculator.dart';
import 'package:mockito/annotations.dart';


@GenerateNiceMocks([MockSpec<PriceCalculatorMixin>(), MockSpec<HighwayRepository>(), MockSpec<Payload>()])
void main(){}