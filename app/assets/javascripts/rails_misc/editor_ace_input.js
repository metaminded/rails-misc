// ACE Editor
//= require ace/ace
//= require theme-textmate
//= require mode-html

var copyAce;

$(document).ready(function(){
  var aces = $('*[data-ace-editor-target]');
  aces.each(function() {
    var div = $(this);
    div.parent().css('width', "600px").css('height', '400px').css("position", "relative");
    div.css("position", "absolute").css('left', "0px").css('right', "0px").css('top', "0px").css('bottom', "0px");
    var target = $("#" + div.data('ace-editor-target'));
    target.hide();
    var editor = ace.edit(div.attr('id'));
    editor.setTheme("ace/theme/textmate");
    var HtmlMode = require("ace/mode/html").Mode;
    editor.getSession().setMode(new HtmlMode());
    editor.getSession().setValue(target.val());
    editor.getSession().setUseSoftTabs(true);
    editor.getSession().setTabSize(2);
    $("*[data-ace-insert="+div.data('ace-editor-target')+"]").change(function() {
      editor.insert("{{"+$(this).val()+"}}");
    });

    copyAce = function(){
      var s = editor.getSession().getValue();
      console.log(s);
      target.val(s);
    }
    div.parents("form").submit(copyAce);
  });
});
