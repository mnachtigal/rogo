"use strict";!function(e){var a={Feather:function(a){var t=arguments.length<=1||void 0===arguments[1]?"zf":arguments[1];a.attr("role","menubar");var n=a.find("li").attr({role:"menuitem"}),i="is-"+t+"-submenu",s=i+"-item",u="is-"+t+"-submenu-parent";a.find("a:first").attr("tabindex",0),n.each(function(){var a=e(this),t=a.children("ul");t.length&&(a.addClass(u).attr({"aria-haspopup":!0,"aria-expanded":!1,"aria-label":a.children("a:first").text()}),t.addClass("submenu "+i).attr({"data-submenu":"","aria-hidden":!0,role:"menu"})),a.parent("[data-submenu]").length&&a.addClass("is-submenu-item "+s)})},Burn:function(e,a){var t=(e.find("li").removeAttr("tabindex"),"is-"+a+"-submenu"),n=t+"-item",i="is-"+a+"-submenu-parent";e.find("*").removeClass(t+" "+n+" "+i+" is-submenu-item submenu is-active").removeAttr("data-submenu").css("display","")}};Foundation.Nest=a}(jQuery);