@AbapCatalog.sqlViewName: 'ZBUOM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Units of Measurement'
define view ZB_UOM
  as select from    t006  as units_of_measurement
    left outer join t006a as units_of_measurement_texts on units_of_measurement.msehi = units_of_measurement_texts.msehi
{
  units_of_measurement.mandt       as client,
  @EndUserText.label: 'int. UOM'
  @EndUserText.quickInfo: 'internal Unit of Measurement'
  units_of_measurement.msehi       as unit_of_measurement,
  units_of_measurement.isocode     as iso_code,
  units_of_measurement_texts.spras as language,
  @EndUserText.label: 'com. UOM'
  @EndUserText.quickInfo: 'commercial Unit of Measurement'
  units_of_measurement_texts.mseh3 as commercial_format,
  @EndUserText.label: 'tech. UOM'
  @EndUserText.quickInfo: 'technical Unit of Measurement'
  units_of_measurement_texts.mseh6 as technical_format,
  units_of_measurement_texts.mseht as short_text,
  units_of_measurement_texts.msehl as long_text
}
