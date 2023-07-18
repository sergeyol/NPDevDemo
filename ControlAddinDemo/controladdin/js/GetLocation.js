function RequestGeo() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
        alert("done");
    } else { 
        alert("Geolocation is not supported by this browser.");
    }
}
  
function showPosition(position) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Result',[position.coords.longitude,position.coords.latitude]);
}