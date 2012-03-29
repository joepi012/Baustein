<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Baustein</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="Mainscript.js" type="text/javascript"></script>
</head>
<body>
	<div id="header">
		<div id="logo">
  			<logo1>Bau</logo1>
        	<logo2>Stein</logo2>
        	<logo3>version 3.0</logo3> 	
        	<b>angemeldet als: Eugen Koslowski</b>
  		</div>
	</div>
	<div id="content">
		<div id="contentNavigationArtikel">
        	<h1>Artikel</h1>
             <div>
             	<button class="contentButtonArtikel" value="Startmenue" onclick="location.href='index.html'">Startmenü</button>
              	<button class="contentButtonArtikel" value="Galerien">Galerien</button>
              	<button class="contentButtonArtikel" value="Rubriken">Rubriken</button>
          	 </div>
    	</div>
    	<div id="editorGesamt">
            	<table width="100%" border="0" id="tabelle">
                    <tr>
                      <td>Überschrift</td>
                      <td colspan="2">
						<input id="ueberschrift" maxlength="200" form="editor"\>
                      </td>
                    </tr>
                    <tr>
                      <td>Rubrik</td>
                      <td colspan="2"><select id="rubriken" form="editor">
                            <option>Die Bewohner</option>
                            <option>Abitur 2012</option>
                            <option>Veranstaltungen</option>
                            <option>Unser Zuhause</option>
                            <option>Aktuelles</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>
                        	Beschreibung
                        </td>
                        <td colspan="2">
                        	<textarea id="beschreibung" form="editor"></textarea>
                        </td>
                    </tr>
                    <tr>
                    	<td>
                        </td>
                        <td colspan="2">
                        	<button onclick="Hinzufuegen()">Autor hinzufügen</button>
                        </td>
                    </tr>
                    <tr>
                    	<td colspan="3">
                        <hr />
                        </td>
                    </tr>
                    <tr>
                    	<td>Verfasserliste</td>
                        <td>
                        	<select id="verfasser1" form="editor">
                            	<option>Autor1</option>
                                <option>Autor2</option>
                                <option>Autor3</option>
                                <option>Autor4</option>
                        	</select>
                        </td>
                        <td></td>
                    </tr>
                  </table>
                  <input type="button" id="TabelleUnsichtbar" onclick="TabelleUnsichtbar();" value="Metadaten ausblenden"/>
                  <form method="post" action="artikelAnzeigen.php" id="editor">
                <div id="editorTinyMCE">
                
                <script type="text/javascript" src="tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
			<script type="text/javascript">
				tinyMCE.init({
        			// General options
        			mode : "exact",
					elements : "txtTextArea1",
        			theme : "advanced",
        			plugins : "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

        			// Theme options
        			theme_advanced_buttons1 : "save,newdocument,|,cut,copy,paste,pastetext,pasteword,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect,|,forecolor,backcolor",
					theme_advanced_buttons2 : "bullist,numlist,|,search,replace,|,blockquote,|,undo,redo,|preview,|,tablecontrols,|,removeformat,|,fullscreen",
					theme_advanced_buttons3 : "link,unlink,anchor,image,|,hr,|,charmap,emotions,iespell,media,|,print,|,pagebreak",
       				theme_advanced_toolbar_location : "top",
        			theme_advanced_toolbar_align : "left",
        			theme_advanced_statusbar_location : "bottom",
					theme_advanced_fonts : "Arial=arial,helvetica,sans-serif; Comic Sans MS=comic sans ms,arial,helvetica,sans-serif;",
					theme_advanced_resizing : true,
					theme_advanced_statusbar_location : "bottom",
					theme_advanced_resize_horizontal : false,
					//Es muss ein passendes Dictionary im Firefox installiert sein, damit die Rechtschreibkontrolle funktioniert
    				//gecko_spellcheck : true,  
					

        			// Skin options
        			skin : "o2k7",
        			skin_variant : "silver",

        			// Example content CSS (should be your site CSS)
        			content_css : "style.css",
					
					//weitere Angaben
					width: "100%",
					heigth: "300px",

        			// Drop lists for link/image/media/template dialogs
        			template_external_list_url : "file:///Z:/Documents/BausteinAG/Layout Probe/tinymce/examples/lists/template_list.js",
        			external_link_list_url : "file:///Z:/Documents/BausteinAG/Layout Probe/tinymce/examples/lists/link_list.js",
        			external_image_list_url : "file:///Z:/Documents/BausteinAG/Layout Probe/tinymce/examples/lists/image_list.js",
        			media_external_list_url : "file:///Z:/Documents/BausteinAG/Layout Probe/tinymce/examples/lists/media_list.js",

        			// Replace values for the template plugin
        			template_replace_values : {
                	username : "Some User",
                	staffid : "991234"
					
        		}});
			</script>
        	<textarea name="txtTextArea1" style="width:100%"></textarea>
            </div>
		</form>
    	</div>
	</div>
</body>
</html>
