<?xml version="1.0" encoding="ISO-8859-1"?>

<StyledLayerDescriptor xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.opengis.net/sld" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" version="1.0.0" >
  <NamedLayer>
    <Name>EVP Ref Penman-Monteith</Name>
    <UserStyle>
      <FeatureTypeStyle>
        <FeatureTypeName>Feature</FeatureTypeName>
        <Rule>
          <Name>&quot;1200 mm&quot;</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>EVP_REF_AN</ogc:PropertyName>
              <ogc:Literal>&quot;1200 mm&quot;</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<LineSymbolizer>
<Stroke>
  <CssParameter name="stroke" >
    <ogc:Literal>#FF3300</ogc:Literal>
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
          <Name>&quot;1300 mm&quot;</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>EVP_REF_AN</ogc:PropertyName>
              <ogc:Literal>&quot;1300 mm&quot;</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<LineSymbolizer>
<Stroke>
  <CssParameter name="stroke" >
    <ogc:Literal>#FF9900</ogc:Literal>
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