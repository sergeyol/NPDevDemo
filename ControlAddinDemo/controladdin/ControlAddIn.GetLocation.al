controladdin "GetLocation"
{
    Scripts = 'controladdin/js/GetLocation.js';
    procedure RequestGeo();
    event Result(Longitude: Text; Latitude: Text);
}