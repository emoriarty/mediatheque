module UsersHelper
  
  class UsersFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    
    def text_fields( *field_names )
      return unless field_names
      
      field_names.reduce("") do |result, field|
        result.concat content_tag(:div, 
          content_tag(:div, label(field, :class => "label"), :class => "left" ) + content_tag( :div, text_field(field, :class => "text_field"), :class => "right" ), 
          :class => "group wat-cf")
        result
      end.html_safe
    end
  end
  
end
