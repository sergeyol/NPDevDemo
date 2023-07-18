function RequestGeo() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, coordsNotFound);
    } else { 
        alert("Geolocation is not supported by this browser.");
    }
}

function coordsNotFound() {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ResultError',"Coordinates not allowed");
}
  
function showPosition(position) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ResultSuccess',[position.coords.longitude,position.coords.latitude]);
}
