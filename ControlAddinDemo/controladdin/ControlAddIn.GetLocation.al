controladdin "GetLocation"
{
    RequestedHeight = 500;
    RequestedWidth = 800;

    Scripts = 'controladdin/js/GetLocation.js';
    StartupScript = 'controladdin/js/startupScript.js';



    Images = 'image1.png';

    procedure RequestGeo();
    event ResultSuccess(Longitude: Text; Latitude: Text);
    event ResultError(Error: Text);
}