/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.themes.add("default",function(){function b(a,b){var c,d;d=a.config.sharedSpaces,d=d&&d[b],d=d&&CKEDITOR.document.getById(d);if(d){var e='<span class="cke_shared " dir="'+a.lang.dir+'"'+">"+'<span class="'+a.skinClass+" "+a.id+" cke_editor_"+a.name+'">'+'<span class="'+CKEDITOR.env.cssClass+'">'+'<span class="cke_wrapper cke_'+a.lang.dir+'">'+'<span class="cke_editor">'+'<div class="cke_'+b+'">'+"</div></span></span></span></span></span>",f=d.append(CKEDITOR.dom.element.createFromHtml(e,d.getDocument()));d.getCustomData("cke_hasshared")?f.hide():d.setCustomData("cke_hasshared",1),c=f.getChild([0,0,0,0]),!a.sharedSpaces&&(a.sharedSpaces={}),a.sharedSpaces[b]=c,a.on("focus",function(){for(var a=0,b,c=d.getChildren();b=c.getItem(a);a++)b.type==CKEDITOR.NODE_ELEMENT&&!b.equals(f)&&b.hasClass("cke_shared")&&b.hide();f.show()}),a.on("destroy",function(){f.remove()})}return c}var a={};return{build:function(c,d){var e=c.name,f=c.element,g=c.elementMode;if(!f||g==CKEDITOR.ELEMENT_MODE_NONE)return;g==CKEDITOR.ELEMENT_MODE_REPLACE&&f.hide();var h=c.fire("themeSpace",{space:"top",html:""}).html,i=c.fire("themeSpace",{space:"contents",html:""}).html,j=c.fireOnce("themeSpace",{space:"bottom",html:""}).html,k=i&&c.config.height,l=c.config.tabIndex||c.element.getAttribute("tabindex")||0;i?isNaN(k)||(k+="px"):k="auto";var m="",n=c.config.width;n&&(isNaN(n)||(n+="px"),m+="width: "+n+";");var o=h&&b(c,"top"),p=b(c,"bottom");o&&(o.setHtml(h),h=""),p&&(p.setHtml(j),j="");var q="<style>."+c.skinClass+"{visibility:hidden;}</style>";a[c.skinClass]?q="":a[c.skinClass]=1;var r=CKEDITOR.dom.element.createFromHtml(['<span id="cke_',e,'" class="',c.skinClass," ",c.id," cke_editor_",e,'" dir="',c.lang.dir,'" title="',CKEDITOR.env.gecko?" ":"",'" lang="',c.langCode,'"'+(CKEDITOR.env.webkit?' tabindex="'+l+'"':"")+' role="application"'+' aria-labelledby="cke_',e,'_arialbl"'+(m?' style="'+m+'"':"")+">"+'<span id="cke_',e,'_arialbl" class="cke_voice_label">'+c.lang.editor+"</span>"+'<span class="',CKEDITOR.env.cssClass,'" role="presentation"><span class="cke_wrapper cke_',c.lang.dir,'" role="presentation"><table class="cke_editor" border="0" cellspacing="0" cellpadding="0" role="presentation"><tbody><tr',h?"":' style="display:none"',' role="presentation"><td id="cke_top_',e,'" class="cke_top" role="presentation">',h,"</td></tr><tr",i?"":' style="display:none"',' role="presentation"><td id="cke_contents_',e,'" class="cke_contents" style="height:',k,'" role="presentation">',i,"</td></tr><tr",j?"":' style="display:none"',' role="presentation"><td id="cke_bottom_',e,'" class="cke_bottom" role="presentation">',j,"</td></tr></tbody></table>"+q+"</span>"+"</span>"+"</span>"].join(""));r.getChild([1,0,0,0,0]).unselectable(),r.getChild([1,0,0,0,2]).unselectable(),g==CKEDITOR.ELEMENT_MODE_REPLACE?r.insertAfter(f):f.append(r),c.container=r,r.disableContextMenu(),c.on("contentDirChanged",function(a){var b=(c.lang.dir!=a.data?"add":"remove")+"Class";r.getChild(1)[b]("cke_mixed_dir_content");var d=this.sharedSpaces&&this.sharedSpaces[this.config.toolbarLocation];d&&d.getParent().getParent()[b]("cke_mixed_dir_content")}),c.fireOnce("themeLoaded"),c.fireOnce("uiReady")},buildDialog:function(a){var b=CKEDITOR.tools.getNextNumber(),c=CKEDITOR.dom.element.createFromHtml(['<div class="',a.id,"_dialog cke_editor_",a.name.replace(".","\\."),"_dialog cke_skin_",a.skinName,'" dir="',a.lang.dir,'" lang="',a.langCode,'" role="dialog" aria-labelledby="%title#"><table class="cke_dialog'," "+CKEDITOR.env.cssClass," cke_",a.lang.dir,'" style="position:absolute" role="presentation"><tr><td role="presentation"><div class="%body" role="presentation"><div id="%title#" class="%title" role="presentation"></div><a id="%close_button#" class="%close_button" href="javascript:void(0)" title="'+a.lang.common.close+'" role="button"><span class="cke_label">X</span></a>'+'<div id="%tabs#" class="%tabs" role="tablist"></div>'+'<table class="%contents" role="presentation">'+"<tr>"+'<td id="%contents#" class="%contents" role="presentation"></td>'+"</tr>"+"<tr>"+'<td id="%footer#" class="%footer" role="presentation"></td>'+"</tr>"+"</table>"+"</div>"+'<div id="%tl#" class="%tl"></div>'+'<div id="%tc#" class="%tc"></div>'+'<div id="%tr#" class="%tr"></div>'+'<div id="%ml#" class="%ml"></div>'+'<div id="%mr#" class="%mr"></div>'+'<div id="%bl#" class="%bl"></div>'+'<div id="%bc#" class="%bc"></div>'+'<div id="%br#" class="%br"></div>'+"</td></tr>"+"</table>",CKEDITOR.env.ie?"":"<style>.cke_dialog{visibility:hidden;}</style>","</div>"].join("").replace(/#/g,"_"+b).replace(/%/g,"cke_dialog_")),d=c.getChild([0,0,0,0,0]),e=d.getChild(0),f=d.getChild(1);if(CKEDITOR.env.ie&&!CKEDITOR.env.ie6Compat){var g=CKEDITOR.env.isCustomDomain(),h="javascript:void(function(){"+encodeURIComponent("document.open();"+(g?'document.domain="'+document.domain+'";':"")+"document.close();")+"}())",i=CKEDITOR.dom.element.createFromHtml('<iframe frameBorder="0" class="cke_iframe_shim" src="'+h+'"'+' tabIndex="-1"'+"></iframe>");i.appendTo(d.getParent())}return e.unselectable(),f.unselectable(),{element:c,parts:{dialog:c.getChild(0),title:e,close:f,tabs:d.getChild(2),contents:d.getChild([3,0,0,0]),footer:d.getChild([3,0,1,0])}}},destroy:function(a){var b=a.container,c=a.element;b&&(b.clearCustomData(),b.remove()),c&&(c.clearCustomData(),a.elementMode==CKEDITOR.ELEMENT_MODE_REPLACE&&c.show(),delete a.element)}}}()),CKEDITOR.editor.prototype.getThemeSpace=function(a){var b="cke_"+a,c=this._[b]||(this._[b]=CKEDITOR.document.getById(b+"_"+this.name));return c},CKEDITOR.editor.prototype.resize=function(a,b,c,d){var e=this,f=e.container,g=CKEDITOR.document.getById("cke_contents_"+e.name),h=CKEDITOR.env.webkit&&e.document&&e.document.getWindow().$.frameElement,i=d?f.getChild(1):f;i.setSize("width",a,!0),h&&(h.style.width="1%");var j=c?0:(i.$.offsetHeight||0)-(g.$.clientHeight||0);g.setStyle("height",Math.max(b-j,0)+"px"),h&&(h.style.width="100%"),e.fire("resize")},CKEDITOR.editor.prototype.getResizable=function(a){return a?CKEDITOR.document.getById("cke_contents_"+this.name):this.container};