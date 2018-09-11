class NumberHelper {

  static double normalize(double value, double minValue,double maxValue){
    if(value > maxValue)
    return 1.0;

    if(value< minValue)
    return 0.0;

    return (value - minValue) / ( maxValue - minValue);
  }

  static double deNormalize(double value, double minValue,double maxValue){
    return value * ( maxValue - minValue) + minValue;
  }
}