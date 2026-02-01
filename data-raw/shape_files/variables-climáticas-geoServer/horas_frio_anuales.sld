<?xml version="1.0" encoding="ISO-8859-1"?>

<StyledLayerDescriptor xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.opengis.net/sld" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" version="1.0.0" >
  <NamedLayer>
    <Name>Horas Frío Anuales</Name>
    <UserStyle>
      <FeatureTypeStyle>
        <FeatureTypeName>Feature</FeatureTypeName>
        <Rule>
          <Name>1000.0</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>Horas</ogc:PropertyName>
              <ogc:Literal>1000.0</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<LineSymbolizer>
<Stroke>
  <CssParameter name="stroke" >
    <ogc:Literal>#33FFFF</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-opacity" >
    <ogc:Literal>1.0</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-width" >
    <ogc:Literal>2.0</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-linecap" >
    <ogc:Literal>butt</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-linejoin" >
    <ogc:Literal>bevel</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-dashoffset" >
    <ogc:Literal>0.0</ogc:Literal>
  </CssParameter>
</Stroke>
</LineSymbolizer>
        </Rule>
        <Rule>
          <Name>1400.0</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>Horas</ogc:PropertyName>
              <ogc:Literal>1400.0</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<LineSymbolizer>
<Stroke>
  <CssParameter name="stroke" >
    <ogc:Literal>#0099FF</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-opacity" >
    <ogc:Literal>1.0</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-width" >
    <ogc:Literal>2.0</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-linecap" >
    <ogc:Literal>butt</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-linejoin" >
    <ogc:Literal>bevel</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-dashoffset" >
    <ogc:Literal>0.0</ogc:Literal>
  </CssParameter>
</Stroke>
</LineSymbolizer>
        </Rule>
        <Rule>
          <Name>1800.0</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>Horas</ogc:PropertyName>
              <ogc:Literal>1800.0</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<LineSymbolizer>
<Stroke>
  <CssParameter name="stroke" >
    <ogc:Literal>#0000CC</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-opacity" >
    <ogc:Literal>1.0</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-width" >
    <ogc:Literal>2.0</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-linecap" >
    <ogc:Literal>butt</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-linejoin" >
    <ogc:Literal>bevel</ogc:Literal>
  </CssParameter>
  <CssParameter name="stroke-dashoffset" >
    <ogc:Literal>0.0</ogc:Literal>
  </CssParameter>
</Stroke>
</LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>