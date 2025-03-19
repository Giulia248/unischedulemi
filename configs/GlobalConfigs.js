var endPoint =  ""
var isRemote = false

if  (isRemote) {
    endPoint = "https://unischedulemi.altervista.org/";
} else {
    endPoint =  "http://127.0.0.1:5500/";
}


function commonLog(log, urgent) { // log: string - urgent: bool
    const icon = urgent ? "❗️" : "";
    console.log("[LOG]", icon, log);
}

// COLORS
const uniDarkGreen = "#006d77";
const uniLightGreen = "#83c5be";
const uniWhite = "#edf6f9";
const uniLightOrange = "#ffddd2";
const uniOrange = "#e29578";




