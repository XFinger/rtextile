class TextileEditorHelperGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
 
      
  def copy_teh_images
    copy_file 'background.png', 'public/images/textile-editor/background.png'
    copy_file 'blockquote.png', 'public/images/textile-editor/blockquote.png'
    copy_file 'bold.png', 'public/images/textile-editor/bold.png'
    copy_file 'center.png', 'public/images/textile-editor/center.png'
    copy_file 'h1.png', 'public/images/textile-editor/h1.png'
    copy_file 'h2.png', 'public/images/textile-editor/h2.png'
    copy_file 'h3.png', 'public/images/textile-editor/h3.png'
    copy_file 'h4.png', 'public/images/textile-editor/h4.png'
    copy_file 'h5.png', 'public/images/textile-editor/h5.png'
    copy_file 'h6.png', 'public/images/textile-editor/h6.png'
    copy_file 'indent.png', 'public/images/textile-editor/indent.png'
    copy_file 'italic.png', 'public/images/textile-editor/italic.png'
    copy_file 'justify.png', 'public/images/textile-editor/justify.png'
    copy_file 'left.png', 'public/images/textile-editor/left.png'
    copy_file 'list_bullets.png', 'public/images/textile-editor/list_bullets.png'
    copy_file 'list_numbers.png', 'public/images/textile-editor/list_numbers.png'
    copy_file 'omega.png', 'public/images/textile-editor/omega.png'
    copy_file 'outdent.png', 'public/images/textile-editor/outdent.png'
    copy_file 'paragraph.png', 'public/images/textile-editor/paragraph.png'
    copy_file 'right.png', 'public/images/textile-editor/right.png'
    copy_file 'strikethrough.png', 'public/images/textile-editor/strikethrough.png'
    copy_file 'underline.png', 'public/images/textile-editor/underline.png'
  end
  
  def copy_stylesheet
    copy_file 'textile-editor.css', 'public/stylesheets/textile-editor.css'
  end
  def copy_javascript
    copy_file 'textile-editor.js', 'public/javascripts/textile-editor.js'
    copy_file 'textile-editor-config.js', 'public/javascripts/textile-editor-config.js'
  end

end
 
