var controlAddIn = document.getElementById("controlAddIn");

var nameDiv = document.createElement("div");
nameDiv.id = "nameDiv";
nameDiv.appendChild(document.createTextNode("Enjoy Microsoft Learn!"));

var imageDiv = document.createElement("div");
imageDiv.id = "imageDiv";

var image1 = document.createElement("img");
image1.id = "image1";
image1.setAttribute("src", Microsoft.Dynamics.
                                     NAV.GetImageResource("image1.png"));

imageDiv.appendChild(image1);

controlAddIn.appendChild(nameDiv);
controlAddIn.appendChild(imageDiv);
