# frozen_string_literal: true

module ApplicationHelper
  def nav_tab(title, url, options = {})
    current_page = options.delete(:current_page) || ''

    css_class = title == current_page ? 'text-secondary' : 'text-light'

    options[:class] = if options[:class]
                        options[:class] += " #{css_class}"
                      else
                        css_class
                      end

    link_to title, url, options
  end

  def currently_at(current_page = '')
    render partial: 'shared/header', locals: { current_page: }
  end

  def full_title(page_title = '')
    base_title = t('shared.header.title')
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
end
