within OpalRT.ePHASORSIM.WrappedModels;
block GENROUSTATUS
  extends Wrappers.FMUTemplateInjectionStatus(redeclare
      ModelSets.OtherSM.GENROUSTATUS modelSet);
end GENROUSTATUS;
