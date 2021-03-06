module ApplicationHelper
  
  def active_section?(name)
    controller.controller_name == name
  end

  # Returns a common link or if in the options argument is the action (and/or controller) corresponds with the params action
  # returns the link as selected
  #
  # @param [String] text for the link
  # @param [String] link to the desired action
  # @param [Hash] common options for a link_to helper
  # @return [String] html link tag or text decorated as selected link
  def selected_link_to(text, link, options)
    if params[:action] == options[:action]
      content_tag :span, text, :class => "selected_link"
    else
      link_to text, link, options
    end
  end
  
  class WebAppThemeFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    
    # Returns the passed in text fields names labeled in a compact way  
    # 
    # @param [Hash] field_names The Field names to show in a form
    def text_fields_compact( *field_names )
      return unless field_names
      
      field_names.reduce("") do |result, field|
        result.concat labeled_text_field(field, :compact => true)
      end.html_safe
    end
    
    # Returns the passed in text fields names labeled 
    # 
    # @param [Hash] field_names The Field names to show in a form
    def text_fields( *field_names )
      return unless field_names
      
      field_names.reduce("") do |result, field|
        result.concat labeled_text_field(field)
      end.html_safe
    end

    # Returns the text field name labeled
    #
    # @param [String] field_name The field name 
    # @param [Hash] options Options to modify the style, by default :compact => false, :description => nil
    def labeled_text_field( field_name, options = {} )
      return unless field_name
      
      default_options = { compact: false, description: nil } 
      options = default_options.merge options
      
      if options[:compact]
        compact_text_field field_name, options[:description]
      else
        common_text_field field_name, options[:description]
      end
    end
    
    # Returns the password field name labeled
    #
    # @param [String] field_name The field name 
    # @param [Hash] options Options to modify the style, by default :compact => false, :description => nil
    def labeled_password_field( field_name, options = {} )
      return unless field_name
      
      default_options = { compact: false, description: nil } 
      options = default_options.merge options
      
      if options[:compact]
        compact_password_field field_name, options[:description]
      else
        common_password_field field_name, options[:description]
      end
    end
    
    # Returns the text field name labeled
    #
    # @param [String] field_name The field name 
    # @param [Hash] options Options to modify the style, by default :compact => false, :description => nil
    def labeled_file_field( field_name, options = {} )
      return unless field_name
      
      default_options = { compact: false, description: nil } 
      options = default_options.merge options
      
      common_file_field field_name, options[:description]
    end
    
    # Returns the text area name labeled
    #
    # @param [String] field_name The field name 
    # @param [Hash] options Options to modify the style, by default :compact => false, :description => nil
    def labeled_text_area( field_name, options = {} )
      return unless field_name
      
      default_options = { compact: false, description: nil } 
      options = default_options.merge options
      if options[:description]
        description = options[:description]
        options.delete[:description]
      else
        description = nil
      end
      common_text_area field_name, description, options
    end
    
    # Returns the text area name labeled
    #
    # @param [String] field_name The field name 
    # @param [Hash] options Options to modify the style, by default :compact => false, :description => nil
    def labeled_select( field_name, values, options = {} )
      return unless field_name
      
      default_options = { compact: false, description: nil } 
      options = default_options.merge options
      
      common_select field_name, values, options[:description]
    end
    
    private
    
    def compact_text_field( field, description )
      content_tag :div, 
        content_tag(:div, label(field, :class => "label"), :class => "left" ) + 
          content_tag( :div, text_field(field, :class => "text_field"), :class => "right" ) +
          add_description(description),
        :class => 'group wat-cf'
    end
    
    def compact_password_field( field, description )
      content_tag :div, 
        content_tag(:div, label(field, :class => "label"), :class => "left" ) + 
          content_tag( :div, password_field(field, :class => "text_field"), :class => "right" ) +
          add_description(description),
        :class => 'group wat-cf'
    end
    
    def common_text_field( field, description )
      content_tag :div,  
        label(field, :class => 'label') + 
          text_field(field, :class => 'text_field') + 
          add_description(description),
        :class => 'group'
    end
    
    def common_password_field( field, description )
      content_tag :div,  
        label(field, :class => 'label') + 
          password_field(field, :class => 'text_field') + 
          add_description(description),
        :class => 'group'
    end
    
    def common_file_field( field, description, options = {})
      content_tag :div,  
        label(field, :class => 'label') + 
          file_field(field, :class => 'text_field') + 
          add_description(description),
        :class => 'group'
    end
    
    def common_text_area( field, description, options = {} )
      default_options = { class: 'text_area' }
      options = default_options.merge options
      
      content_tag :div,
        label(field, class: 'label') +
          text_area(field, options) +
          add_description(description),
        class: 'group'
    end
    
    def common_select( field, values, description )
      content_tag :div,
        label(field, class: 'label') +
          select(field, values) +
          add_description(description),
        class: 'group'
    end
    
    def add_description( description )
      if description
        content_tag(:span, description, :class => 'description') 
      else
        ""
      end
    end
  end
end
