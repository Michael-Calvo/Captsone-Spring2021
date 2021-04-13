/*************************************************************************
* ADOBE CONFIDENTIAL
* ___________________
*
*  Copyright 2015 Adobe Systems Incorporated
*  All Rights Reserved.
*
* NOTICE:  All information contained herein is, and remains
* the property of Adobe Systems Incorporated and its suppliers,
* if any.  The intellectual and technical concepts contained
* herein are proprietary to Adobe Systems Incorporated and its
* suppliers and are protected by all applicable intellectual property laws,
* including trade secret and or copyright laws.
* Dissemination of this information or reproduction of this material
* is strictly forbidden unless prior written permission is obtained
* from Adobe Systems Incorporated.
**************************************************************************/
var communicate,acom_analytics,utilities,started,startup=new Promise((function(e,t){"use strict";started=e})),startupComplete=!1;function registerActions(e){"use strict";var t,n=function(){return communicate.getModule("acro-web2pdf")},o=function(){return communicate.getModule("acro-gstate")},c=["*://*/*.pdf"],a=["http://*/*","https://*/*"],i=["all"],r=function(e){var t,n=e.splice();for(t=0;t<e.length;t+=1)n.push(e[t]+"?*")}(["*://*/*.ai","*://*/*.bmp","*://*/*.doc","*://*/*.docx","*://*/*.gif","*://*/*.indd","*://*/*.jpeg","*://*/*.jpg","*://*/*.odf","*://*/*.odg","*://*/*.odp","*://*/*.ods","*://*/*.odt","*://*/*.png","*://*/*.ppt","*://*/*.pptx","*://*/*.pptx","*://*/*.ps","*://*/*.psd","*://*/*.pub","*://*/*.rtf","*://*/*.stw","*://*/*.sxd","*://*/*.sxc","*://*/*.sxi","*://*/*.sxw","*://*/*.text","*://*/*.tif","*://*/*.tiff","*://*/*.txt","*://*/*.xls","*://*/*.xlsx"].concat(c));function l(e){return utilities&&utilities.getTranslation?utilities.getTranslation(e):chrome.i18n.getMessage(e)}function s(e){return(e.title||l("web2pdfUntitledFileName")).replace(/[<>?:|\*"\/\\'&\.]/g,"")}function u(e,t){if(!e&&!t)return!1;try{const n=e.pageUrl||t.url,o=new URL(n);if(o.protocol&&["http:","https:"].includes(o.protocol))return!0}catch(e){console.error(e)}return!1}startupComplete||(startupComplete=!0,startup.then((function(t){chrome.runtime.getPlatformInfo((function(e){var t;SETTINGS.OS=e.os,SETTINGS.CHROME_VERSION=0,SETTINGS.EXTENSION_VERSION=0;try{(t=navigator.userAgent.match(/Chrome\/([0-9]+)/))&&(SETTINGS.CHROME_VERSION=+t[1])}catch(e){}try{SETTINGS.EXTENSION_VERSION=chrome.runtime.getManifest().version}catch(e){}"mac"===e.os?acom_analytics.event(acom_analytics.e.OS_MAC_OP):"win"===e.os&&acom_analytics.event(acom_analytics.e.OS_WIN_OP)})),e?"update"===e.reason?t.event(t.e.EXTENSION_UPDATE):"install"===e.reason&&t.event(t.e.EXTENSION_INSTALLED):t.event(t.e.EXTENSION_STARTUP),chrome.browserAction.onClicked.addListener((function(e){communicate.echo(e)}))})),!SETTINGS.IS_READER&&SETTINGS.USE_ACROBAT?(chrome.contextMenus.create({title:l("web2pdfConvertPageContextMenu"),contexts:["page"],onclick:function(e,t){u(e,t)&&(acom_analytics.event(acom_analytics.e.CONTEXT_MENU_CONVERT_PAGE),n().handleConversionRequest({tabId:t.id,caller:o().web2pdfCaller.MENU,action:o().web2pdfAction.CONVERT,context:o().web2pdfContext.PAGE,url:e.pageUrl||t.url,domtitle:s(t)}))},documentUrlPatterns:a}),chrome.contextMenus.create({title:l("web2pdfAppendPageContextMenu"),contexts:["page"],onclick:function(e,t){u(e,t)&&(acom_analytics.event(acom_analytics.e.CONTEXT_MENU_APPEND_PAGE),n().handleConversionRequest({tabId:t.id,caller:o().web2pdfCaller.MENU,action:o().web2pdfAction.APPEND,context:o().web2pdfContext.PAGE,url:e.pageUrl||t.url,domtitle:s(t)}))},documentUrlPatterns:a}),chrome.contextMenus.create({title:l("web2pdfConvertLinkContextMenu"),contexts:["link"],onclick:function(e,t){u(e,t)&&(acom_analytics.event(acom_analytics.e.CONTEXT_MENU_CONVERT_LINK),n().handleConversionRequest({tabId:t.id,caller:o().web2pdfCaller.MENU,action:o().web2pdfAction.CONVERT,context:o().web2pdfContext.LINK,url:e.linkUrl,domtitle:s(t)}))},documentUrlPatterns:a}),chrome.contextMenus.create({title:l("web2pdfAppendLinkContextMenu"),contexts:["link"],onclick:function(e,t){u(e,t)&&(acom_analytics.event(acom_analytics.e.CONTEXT_MENU_APPEND_LINK),n().handleConversionRequest({tabId:t.id,caller:o().web2pdfCaller.MENU,action:o().web2pdfAction.APPEND,context:o().web2pdfContext.LINK,url:e.linkUrl,domtitle:s(t)}))},documentUrlPatterns:a})):SETTINGS.IS_READER||("Adobe PDF",t=chrome.contextMenus.create({title:"Adobe PDF",contexts:i,id:"pdf-page"}),chrome.contextMenus.create({title:"Upload PDF to acrobat.com",contexts:i,parentId:t,id:"upload",documentUrlPatterns:c}),chrome.contextMenus.create({title:"Upload and export to Word/Excel/PowerPoint/Images",contexts:i,parentId:t,id:"export",documentUrlPatterns:c}),chrome.contextMenus.create({title:"Upload link to acrobat.com",contexts:["link"],parentId:t,id:"upload_link",targetUrlPatterns:r}),chrome.contextMenus.create({title:"Upload image to acrobat.com",contexts:["image"],parentId:t,id:"upload-image"}),chrome.contextMenus.create({title:"Create a Slideshow from a Flickr album",contexts:i,parentId:t,id:"flickr-slideshow",documentUrlPatterns:["*://www.flickr.com/*"]}),chrome.contextMenus.create({title:"Create a contact sheet from Flickr images",contexts:i,parentId:t,id:"flickr-contact-sheet",documentUrlPatterns:["*://www.flickr.com/*"]})))}SETTINGS=SETTINGS||{USE_ACROBAT:!0},chrome.runtime.getPlatformInfo((function(e){"use strict";SETTINGS.OS=e.os})),require(["communicate","util","upload","download-manager","analytics","acro-gstate","acro-actions","acro-web2pdf","session","convert-to-zip"],(function(e,t,n,o,c,a,i,r){"use strict";function l(e){return utilities&&utilities.getTranslation?utilities.getTranslation(e):chrome.i18n.getMessage(e)}chrome.management.getSelf((function(e){!function(){try{0==localStorage.length&&""!=document.cookie&&document.cookie.split(/; */).map(e=>e.split("=")).filter(e=>e&&2==e.length).forEach(e=>localStorage.setItem(e[0],e[1]))}catch(e){}}(),c.s||c.init(e.version,e.installType),i.getVersion((function(e){e!==SETTINGS.READER_VER&&e!==SETTINGS.ERP_READER_VER||(SETTINGS.IS_READER=!0,SETTINGS.IS_ACROBAT=!1,e===SETTINGS.ERP_READER_VER&&(SETTINGS.IS_ERP_READER=!0),e===SETTINGS.ERP_READER_VER?chrome.browserAction.setTitle({title:l("web2pdfConvertButtonToolTipERPReader")}):chrome.browserAction.setTitle({title:l("web2pdfOpenButtonText")})),registerActions(),function(e){(0==e||1==e&&0==t.getNMHConnectionStatus()||e==SETTINGS.READER_VER||e==SETTINGS.ERP_READER_VER)&&chrome.contextMenus.removeAll()}(e),function(e){0!=e&&1!=e&&e!=SETTINGS.READER_VER&&e!=SETTINGS.ERP_READER_VER||chrome.browserAction.setTitle({title:""})}(e),started(c),function(e){var n="https://acrobat.adobe.com/us/en/landing/acrobat-pro-chrome-extension.html";SETTINGS.IS_READER&&(n="https://acrobat.adobe.com/us/en/landing/acrobat-reader-chrome-extension.html"),"false"!==t.getCookie("fte")&&t.createTab(n,(function(){t.setCookie("fte","false",3650),e.event(e.e.FTE_LAUNCH)}))}(c)}))})),acom_analytics=c,communicate=e,utilities=t,SETTINGS.USE_ACROBAT||chrome.contextMenus.onClicked.addListener((function(e,t){var n={filename:t.title,tabId:t.id,menuItem:e.menuItemId,handleResult:"preview"};if("flickr-slideshow"===e.menuItemId||"flickr-contact-sheet"===e.menuItemId)return c.event(n,c.e.FLICKR_CONTEXT_CLICK),void communicate.deferMessage({panel_op:"flickr",tabId:t.id});"upload-image"===e.menuItemId&&(c.setOp("Image"),n.handleResult="image_preview",n.url=e.srcUrl),"upload_link"===e.menuItemId&&(c.setOp("Link"),n.url=e.linkUrl),"upload"===e.menuItemId&&(c.setOp("Link"),n.url=e.linkUrl),"pdf-page"===e.menuItemId&&(c.setOp("PdfPage"),n.url=e.pageUrl),n.filename.length>20&&(n.filename=n.filename.substring(0,19)),e.linkUrl?n.filename=e.linkUrl.split("/").splice(-1)[0].replace(/\?\S*/,""):e.srcUrl&&(n.url=e.srcUrl,n.filename=e.srcUrl.split("/").splice(-1)[0].replace(/\?\S*/,"")),"export"===e.menuItemId&&(n.handleResult="export"),o.proxy(o.do_upload(n))}))})),chrome.runtime.onInstalled.addListener(registerActions);