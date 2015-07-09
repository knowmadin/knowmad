/**
 *
 *  jQuery ghostWriter Plugin for adding subdomain in forms
 *
 *  Version: 1.0.0
 *
 *  Author: GODPOD (Ravi Rajendra)
 *
 *  URL: https://github.com/godpod/ghostInput
 *
**/
(function($) {
    $.fn.ghostInput = function(options) {
        var o = $.extend({
            ghostText: ".ghosttext",
            ghostPlaceholder: "Add subdomain",
            ghostTextClass: "ghost-text",
            ghostHiddenClass: ""
        }, options);
        return this.each(function(i, element){
            var $element = $(element);
            if($element.ghostInputValidate)
                return true;
            $element.ghostInputValidate = true;
            var r = $element.attr("id") || "";
            o.ghostPlaceholder = $element.attr("placeholder") || o.ghostPlaceholder;
            $element.attr("placeholder")?$element.removeAttr("placeholder"):"";
            o.ghostText = $element.attr("data-ghost-text") || o.ghostText;
            o.ghosttextspan = $("<label />").text(o.ghostPlaceholder);
            o.ghostHiddenLabel = $("<label />").css({"visibility":"hidden"}).addClass(o.ghostHiddenClass);
            o.ghostBox = $("<label />").attr("for", r).addClass(o.ghostTextClass).append(o.ghostHiddenLabel).append(o.ghosttextspan);
            $element.parent().prepend(o.ghostBox);
            o.ghostBox.click(function() {
                $element.focus();
            });
            $element.bind("keyup keydown keypress change",function() {
                setTimeout(function() {
                    var t = "" == $.trim($element.val()) ? o.ghostPlaceholder: o.ghostText;
                    o.ghostHiddenLabel.text($element.val());
                    o.ghosttextspan.text(t)
                }, 0)
            });
            return true;
        });
    };
})(window.jQuery);
jQuery("[rel=ghostInput]").ghostInput();
