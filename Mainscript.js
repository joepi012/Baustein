// JavaScript Document
function Hinzufuegen()
{
   var NeuerVerfasser = null;
   var NeueZeile = null;
   var NeueSpalte1 = null;
   var NeueSpalte2 = null;
   var NeueSpalte3 = null;
   var NeueOption = null;
   var atext = "";

   var NeuerButton = null;
   
   var NeueAuswahl = null;
   var Tabelle = document.getElementById("tabelle");
   
   NeueZeile = document.createElement("tr");
   
   NeueSpalte1 = document.createElement("td");
   NeueSpalte2 = document.createElement("td");
   NeueSpalte3 = document.createElement("td");
   
   NeueAuswahl = document.createElement("select");
   NeueAuswahl.setAttribute("form", "editor");
   for (i = 0; i < 4; i++){
     NeueOption = document.createElement("option");
     atext = document.createTextNode("Autor"+i);
     NeueOption.appendChild(atext);
     NeueAuswahl.appendChild(NeueOption);
   }
   
   NeueSpalte2.appendChild(NeueAuswahl);
   
   NeuerButton = document.createElement("button");
   NeuerButton.setAttribute("onclick", "Entfernen(this.parentNode.parentNode)");
   atext = document.createTextNode("Autor entfernen");
   NeuerButton.appendChild(atext);
   
   NeueSpalte3.appendChild(NeuerButton);
   
   NeueZeile.appendChild(NeueSpalte1);
   NeueZeile.appendChild(NeueSpalte2);
   NeueZeile.appendChild(NeueSpalte3);
   
   Tabelle.appendChild(NeueZeile);
}

function Entfernen(element)
{
	element.parentNode.removeChild(element);
}

function TabelleUnsichtbar()
{
	if (getStyle(document.getElementById("tabelle"), "display") == "table")
	{
		document.getElementById("tabelle").style.display = "none";
		document.getElementById("TabelleUnsichtbar").value = "Metadaten einblenden";
	}
	else
	{
		document.getElementById("tabelle").style.display = "table";
		document.getElementById("TabelleUnsichtbar").value = "Metadaten ausblenden";
	}
}

function getStyle(oElm, strCssRule){
	var strValue = "";
	if(document.defaultView && document.defaultView.getComputedStyle){
		strValue = document.defaultView.getComputedStyle(oElm, "").getPropertyValue(strCssRule);
	}
	else if(oElm.currentStyle){
		strCssRule = strCssRule.replace(/\-(\w)/g, function (strMatch, p1){
			return p1.toUpperCase();
		});
		strValue = oElm.currentStyle[strCssRule];
	}
	return strValue;
}
