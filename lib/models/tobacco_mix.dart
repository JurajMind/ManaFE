  class TobaccoMix {
    final String name;

   factory TobaccoMix(Map jsonMap) =>
      TobaccoMix._internalFromJson(jsonMap);
      
  TobaccoMix._internalFromJson(Map jsonMap)
      :
        name = jsonMap["AccName"];


}