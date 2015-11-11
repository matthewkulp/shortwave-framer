require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"colourTransition":[function(require,module,exports){
exports.colourTransition = function(layer, colour, duration, fps) {
  var a, aDiff, b, bDiff, g, gDiff, i, myInterval, newColour, oldColour, r, rDiff, startInterval;
  oldColour = null;
  newColour = null;
  oldColour = layer.backgroundColor;
  newColour = colour;
  oldColour = oldColour.substring(5, oldColour.length - 1);
  oldColour = oldColour.split(', ');
  newColour = newColour.substring(5, newColour.length - 1);
  newColour = newColour.split(', ');
  r = parseFloat(oldColour[0]);
  g = parseFloat(oldColour[1]);
  b = parseFloat(oldColour[2]);
  a = parseFloat(oldColour[3]);
  rDiff = oldColour[0] - newColour[0];
  gDiff = oldColour[1] - newColour[1];
  bDiff = oldColour[2] - newColour[2];
  aDiff = oldColour[3] - newColour[3];
  if (fps === void 0) {
    fps = 30;
  }
  rDiff = rDiff / (fps * duration);
  gDiff = gDiff / (fps * duration);
  bDiff = bDiff / (fps * duration);
  aDiff = aDiff / (fps * duration);
  i = 0;
  myInterval = null;
  startInterval = function() {
    return myInterval = Utils.interval(1 / fps, function() {
      i++;
      r = r - rDiff;
      g = g - gDiff;
      b = b - bDiff;
      a = a - aDiff;
      layer.backgroundColor = 'rgba(' + Math.round(r) + ', ' + Math.round(g) + ', ' + Math.round(b) + ', ' + a + ')';
      if (i >= (fps * duration)) {
        return clearInterval(myInterval);
      }
    });
  };
  return startInterval();
};


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVm9sdW1lcy9GaWxlcy9Hb29nbGUgRHJpdmUvbWF0dGhld2t1bHAuY29tL0FuaW1hdGlvbnMvc2hvcnR3YXZlIDIuZnJhbWVyL21vZHVsZXMvY29sb3VyVHJhbnNpdGlvbi5jb2ZmZWUiLCIvVm9sdW1lcy9GaWxlcy9Hb29nbGUgRHJpdmUvbWF0dGhld2t1bHAuY29tL0FuaW1hdGlvbnMvc2hvcnR3YXZlIDIuZnJhbWVyL21vZHVsZXMvbXlNb2R1bGUuY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDQUEsT0FBTyxDQUFDLGdCQUFSLEdBQTJCLFNBQUMsS0FBRCxFQUFRLE1BQVIsRUFBZ0IsUUFBaEIsRUFBMEIsR0FBMUI7QUFDMUIsTUFBQTtFQUFBLFNBQUEsR0FBWTtFQUNaLFNBQUEsR0FBWTtFQUVaLFNBQUEsR0FBWSxLQUFLLENBQUM7RUFDbEIsU0FBQSxHQUFZO0VBQ1osU0FBQSxHQUFZLFNBQVMsQ0FBQyxTQUFWLENBQW9CLENBQXBCLEVBQXVCLFNBQVMsQ0FBQyxNQUFWLEdBQW1CLENBQTFDO0VBQ1osU0FBQSxHQUFZLFNBQVMsQ0FBQyxLQUFWLENBQWdCLElBQWhCO0VBQ1osU0FBQSxHQUFZLFNBQVMsQ0FBQyxTQUFWLENBQW9CLENBQXBCLEVBQXVCLFNBQVMsQ0FBQyxNQUFWLEdBQW1CLENBQTFDO0VBQ1osU0FBQSxHQUFZLFNBQVMsQ0FBQyxLQUFWLENBQWdCLElBQWhCO0VBRVosQ0FBQSxHQUFJLFVBQUEsQ0FBVyxTQUFVLENBQUEsQ0FBQSxDQUFyQjtFQUNKLENBQUEsR0FBSSxVQUFBLENBQVcsU0FBVSxDQUFBLENBQUEsQ0FBckI7RUFDSixDQUFBLEdBQUksVUFBQSxDQUFXLFNBQVUsQ0FBQSxDQUFBLENBQXJCO0VBQ0osQ0FBQSxHQUFJLFVBQUEsQ0FBVyxTQUFVLENBQUEsQ0FBQSxDQUFyQjtFQUdKLEtBQUEsR0FBUSxTQUFVLENBQUEsQ0FBQSxDQUFWLEdBQWUsU0FBVSxDQUFBLENBQUE7RUFDakMsS0FBQSxHQUFRLFNBQVUsQ0FBQSxDQUFBLENBQVYsR0FBZSxTQUFVLENBQUEsQ0FBQTtFQUNqQyxLQUFBLEdBQVEsU0FBVSxDQUFBLENBQUEsQ0FBVixHQUFlLFNBQVUsQ0FBQSxDQUFBO0VBQ2pDLEtBQUEsR0FBUSxTQUFVLENBQUEsQ0FBQSxDQUFWLEdBQWUsU0FBVSxDQUFBLENBQUE7RUFHakMsSUFBRyxHQUFBLEtBQU8sTUFBVjtJQUNDLEdBQUEsR0FBTSxHQURQOztFQUlBLEtBQUEsR0FBUSxLQUFBLEdBQVEsQ0FBQyxHQUFBLEdBQU0sUUFBUDtFQUNoQixLQUFBLEdBQVEsS0FBQSxHQUFRLENBQUMsR0FBQSxHQUFNLFFBQVA7RUFDaEIsS0FBQSxHQUFRLEtBQUEsR0FBUSxDQUFDLEdBQUEsR0FBTSxRQUFQO0VBQ2hCLEtBQUEsR0FBUSxLQUFBLEdBQVEsQ0FBQyxHQUFBLEdBQU0sUUFBUDtFQUVoQixDQUFBLEdBQUk7RUFDSixVQUFBLEdBQWE7RUFDYixhQUFBLEdBQWdCLFNBQUE7V0FDZixVQUFBLEdBQWEsS0FBSyxDQUFDLFFBQU4sQ0FBZ0IsQ0FBQSxHQUFFLEdBQWxCLEVBQXdCLFNBQUE7TUFDcEMsQ0FBQTtNQUNBLENBQUEsR0FBSSxDQUFBLEdBQUk7TUFDUixDQUFBLEdBQUksQ0FBQSxHQUFJO01BQ1IsQ0FBQSxHQUFJLENBQUEsR0FBSTtNQUNSLENBQUEsR0FBSSxDQUFBLEdBQUk7TUFHUixLQUFLLENBQUMsZUFBTixHQUF3QixPQUFBLEdBQVEsSUFBSSxDQUFDLEtBQUwsQ0FBVyxDQUFYLENBQVIsR0FBc0IsSUFBdEIsR0FBMkIsSUFBSSxDQUFDLEtBQUwsQ0FBVyxDQUFYLENBQTNCLEdBQXlDLElBQXpDLEdBQThDLElBQUksQ0FBQyxLQUFMLENBQVcsQ0FBWCxDQUE5QyxHQUE0RCxJQUE1RCxHQUFpRSxDQUFqRSxHQUFtRTtNQUMzRixJQUFHLENBQUEsSUFBSyxDQUFDLEdBQUEsR0FBSSxRQUFMLENBQVI7ZUFDQyxhQUFBLENBQWMsVUFBZCxFQUREOztJQVRvQyxDQUF4QjtFQURFO1NBYWhCLGFBQUEsQ0FBQTtBQS9DMEI7Ozs7QUNJM0IsT0FBTyxDQUFDLEtBQVIsR0FBZ0I7O0FBRWhCLE9BQU8sQ0FBQyxVQUFSLEdBQXFCLFNBQUE7U0FDcEIsS0FBQSxDQUFNLHVCQUFOO0FBRG9COztBQUdyQixPQUFPLENBQUMsT0FBUixHQUFrQixDQUFDLENBQUQsRUFBSSxDQUFKLEVBQU8sQ0FBUCIsImZpbGUiOiJnZW5lcmF0ZWQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlc0NvbnRlbnQiOlsiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiLCJleHBvcnRzLmNvbG91clRyYW5zaXRpb24gPSAobGF5ZXIsIGNvbG91ciwgZHVyYXRpb24sIGZwcykgLT5cblx0b2xkQ29sb3VyID0gbnVsbFxuXHRuZXdDb2xvdXIgPSBudWxsXG5cdCMgc2V0IG9sZCBhbmQgbmV3IGNvbG91cnMgYXMgdmFyaWFibGVzXG5cdG9sZENvbG91ciA9IGxheWVyLmJhY2tncm91bmRDb2xvclxuXHRuZXdDb2xvdXIgPSBjb2xvdXJcblx0b2xkQ29sb3VyID0gb2xkQ29sb3VyLnN1YnN0cmluZyg1LCBvbGRDb2xvdXIubGVuZ3RoIC0gMSlcblx0b2xkQ29sb3VyID0gb2xkQ29sb3VyLnNwbGl0KCcsICcpXG5cdG5ld0NvbG91ciA9IG5ld0NvbG91ci5zdWJzdHJpbmcoNSwgbmV3Q29sb3VyLmxlbmd0aCAtIDEpXG5cdG5ld0NvbG91ciA9IG5ld0NvbG91ci5zcGxpdCgnLCAnKVxuXHRcblx0ciA9IHBhcnNlRmxvYXQob2xkQ29sb3VyWzBdKVxuXHRnID0gcGFyc2VGbG9hdChvbGRDb2xvdXJbMV0pXG5cdGIgPSBwYXJzZUZsb2F0KG9sZENvbG91clsyXSlcblx0YSA9IHBhcnNlRmxvYXQob2xkQ29sb3VyWzNdKVxuXHRcblx0IyBDYWxjdWxhdGVzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHR3byBjb2xvdXJzXG5cdHJEaWZmID0gb2xkQ29sb3VyWzBdIC0gbmV3Q29sb3VyWzBdXG5cdGdEaWZmID0gb2xkQ29sb3VyWzFdIC0gbmV3Q29sb3VyWzFdXG5cdGJEaWZmID0gb2xkQ29sb3VyWzJdIC0gbmV3Q29sb3VyWzJdXG5cdGFEaWZmID0gb2xkQ29sb3VyWzNdIC0gbmV3Q29sb3VyWzNdXG5cdFxuXHQjIFNldHMgYSBmcmFtZSBkZWZhdWx0XG5cdGlmIGZwcyA9PSB1bmRlZmluZWRcblx0XHRmcHMgPSAzMFxuXHRcdFxuXHQjIENhbGN1bGF0ZSB0aGUgaW5jcmVtZW50c1xuXHRyRGlmZiA9IHJEaWZmIC8gKGZwcyAqIGR1cmF0aW9uKVxuXHRnRGlmZiA9IGdEaWZmIC8gKGZwcyAqIGR1cmF0aW9uKVxuXHRiRGlmZiA9IGJEaWZmIC8gKGZwcyAqIGR1cmF0aW9uKVxuXHRhRGlmZiA9IGFEaWZmIC8gKGZwcyAqIGR1cmF0aW9uKVxuXHQjIyBwcmludCBcIihyRGlmZiBJbmNyZW1lbnRzKVwiICsgckRpZmYgKyBcIihnRGlmZiBJbmNyZW1lbnRzKVwiICsgZ0RpZmYgKyBcIihiRGlmZiBJbmNyZW1lbnRzKVwiICsgYkRpZmYgKyBcIihhRGlmZiBJbmNyZW1lbnRzKVwiICsgYURpZmZcblx0aSA9IDBcblx0bXlJbnRlcnZhbCA9IG51bGxcblx0c3RhcnRJbnRlcnZhbCA9IC0+XG5cdFx0bXlJbnRlcnZhbCA9IFV0aWxzLmludGVydmFsICgxL2ZwcyksIC0+XG5cdFx0XHRpKytcblx0XHRcdHIgPSByIC0gckRpZmZcblx0XHRcdGcgPSBnIC0gZ0RpZmZcblx0XHRcdGIgPSBiIC0gYkRpZmZcblx0XHRcdGEgPSBhIC0gYURpZmZcblx0XHRcdCMgTnVtYmVycyBoYXZlIHRvIGJlIHdob2xlIHRvIHJlZ2VzdGVyIGFzIGEgcHJvcGVyIFJHQiB2YWx1ZS4gXG5cdFx0XHQjIFJlbmRlciBjb2xvdXIgdXNpbmcgdGhlIGNoYW5naW5nIHZhcmlhYmxlLlxuXHRcdFx0bGF5ZXIuYmFja2dyb3VuZENvbG9yID0gJ3JnYmEoJytNYXRoLnJvdW5kKHIpKycsICcrTWF0aC5yb3VuZChnKSsnLCAnK01hdGgucm91bmQoYikrJywgJythKycpJ1xuXHRcdFx0aWYgaSA+PSAoZnBzKmR1cmF0aW9uKVxuXHRcdFx0XHRjbGVhckludGVydmFsKG15SW50ZXJ2YWwpXG5cdFx0XHQjIyBwcmludCBpICsgXCIoUilcIiArIE1hdGgucm91bmQocikgKyBcIihHKVwiICsgTWF0aC5yb3VuZChnKSArIFwiKEIpXCIgKyBNYXRoLnJvdW5kKGIpICsgXCIoQSlcIiArIGFcblx0c3RhcnRJbnRlcnZhbCgpXG5cdCMjIFRPRE9cblx0IyMgRml4IHNwbGl0IHN0cmluZyBpc3N1ZS5cblx0IyMgU2V0IHRoZSB0cnVlIGNvbG91ciB2YWx1ZSBhZnRlciBmYWRlIGVuZHMuXG5cdCMjIEFiaWxpdHkgdG8gc3RvcCBtaWQtZmFkZS5cblx0IyMgUmVtb3ZlIHRoZSBuZWVkIHRvIHNldCB0aGUgb3JpZ2luYWwgY29sb3VyIGFzIHJnYmFcbiIsIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iXX0=
