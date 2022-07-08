unit uSpaceAge;

interface

  type ISpaceAge = interface
    function OnMercury() : double;
    function OnVenus() : double;
    function OnEarth() : double;
    function OnMars() : double;
    function OnJupiter() : double;
    function OnSaturn() : double;
    function OnUranus() : double;
    function OnNeptune() : double;
  end;

  type TSpaceAge = class(TInterfacedObject, ISpaceAge)
    const
      OneYearOnEarthInSeconds = 31557600;
      EarthYearRatioOnMercury = 0.2408467;
      EarthYearRatioOnVenus = 0.61519726;
      EarthYearRatioOnEarth = 1.0;
      EarthYearRatioOnMars = 1.8808158;
      EarthYearRatioOnJupiter = 11.862615;
      EarthYearRatioOnSaturn = 29.447498;
      EarthYearRatioOnUranus = 84.016846;
      EarthYearRatioOnNeptune = 164.79132;
    constructor Create(AValue : Integer);
    function OnEarth() : double;
    function OnMercury() : double;
    function OnMars() : double;
    function OnVenus() : double;
    function OnJupiter() : double;
    function OnSaturn() : double;
    function OnUranus() : double;
    function OnNeptune() : double;
  private
    FAgeInSeconds : Integer;
    function AgeOnPlanet(APlanetYearRatio : double) : double;
  end;

  function NewSpaceAge(AAgeInSeconds : Integer) : TSpaceAge;

implementation

  uses
    Math;

  constructor TSpaceAge.Create(AValue : Integer);
    begin
      self.FAgeInSeconds := AValue;
    end;

  function TSpaceAge.AgeOnPlanet(APlanetYearRatio : double) : double;
    begin
      Result := RoundTo(((self.FAgeInSeconds/APlanetYearRatio)/OneYearOnEarthInSeconds), -2);
    end;

  function TSpaceAge.OnMercury() : double;
    begin
      Result := AgeOnPlanet(EarthYearRatioOnMercury);
    end;

  function TSpaceAge.OnVenus() : double;
    begin
      Result := AgeOnPlanet(EarthYearRatioOnVenus);
    end;

  function TSpaceAge.OnEarth() : double;
    begin
      Result := AgeOnPlanet(EarthYearRatioOnEarth);
    end;

  function TSpaceAge.OnMars() : double;
    begin
      Result := AgeOnPlanet(EarthYearRatioOnMars);
    end;

  function TSpaceAge.OnJupiter() : double;
    begin
      Result := AgeOnPlanet(EarthYearRatioOnJupiter);
    end;

  function TSpaceAge.OnSaturn() : double;
    begin
      Result := AgeOnPlanet(EarthYearRatioOnSaturn);
    end;

  function TSpaceAge.OnUranus() : double;
    begin
      Result := AgeOnPlanet(EarthYearRatioOnUranus);
    end;

  function TSpaceAge.OnNeptune() : double;
    begin
      Result := AgeOnPlanet(EarthYearRatioOnNeptune);
    end;

  function NewSpaceAge(AAgeInSeconds : Integer) : TSpaceAge;
    begin
      Result := TSpaceAge.Create(AAgeInSeconds);
    end;

end.
