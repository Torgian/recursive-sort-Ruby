var pxlWidth = 1;
var pxlHeight = 1;

var water = "#1132FF";
var valley = "#10B200";
var mountain = "#E8A70C";


function noise(len, min, max){
  var output = [];
  for(var x = 0; x < len; x++){
    min = Math.ceil(min);
    max = Math.floor(max);
    output.push((Math.random() * ((max) - min) + min));
  }
  return output;
}

function red_noise(noise){
  var output = [];
  for (var x = 0; x < (noise.length - 1); x++){
    output.push(0.5 * (noise[x] + noise[x + 1]))
  }
  return output;
}

function smoother(noise){
  var output = [];
  for (var x = 0; x < (noise.length - 1); x++){
    output.push(Math.min((noise[x] + noise[x + 1]) / 2), noise[x]);
  }
  return output;
}


var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext('2d');

var width = canvas.width;
var height = canvas.height;

function makeMap(noise){
  var output = [];
  var sqrt = Math.floor(Math.sqrt(noise.length));
  for (x = 0; x < sqrt; x++){
    output.push(noise.slice(x * sqrt, (x * sqrt) + sqrt)); 
  }
  return output
}

function getColor(num) {
  switch (true){
    case (num >= 0 && num < 1):
      return water;
      break;
    case (num >= 1 && num  < 2):
      return valley;
      break;
    case (num >= 2):
      return mountain;
      break;
    default:
      return "white";
      break;
  }
}

function appendToCanvas(makeMap){
  //for each array
  //append y, then append x
  // for (y < 300; y < makeMap.length; y++)
   // for (x < 300; x < makeMap[y].length; x++)
   //    ctx.fillStyle = (0, 0 , 0, makeMap[y][x])
   //    ctx.fillRect(x, y, x + 30, y + 30)
  var yPos = 0;
  for (var i = 0;  i < makeMap.length; i++) {
    var xPos = 0;
    makeMap[i] = smoother(makeMap[i]);
    for (var j = 0; j < makeMap[i].length; j++) {
     // ctx.fillStyle = getColor(makeMap[i][j]);
      ctx.fillStyle = 'rgba(0, 0, 0,' + makeMap[i][j] + ')';
      ctx.fillRect(xPos, yPos, pxlWidth, pxlHeight);
      xPos += pxlWidth;
    }
    yPos += pxlHeight;
  }
}

appendToCanvas(makeMap(smoother(red_noise(noise(((width * height) + 1),0,1)))));