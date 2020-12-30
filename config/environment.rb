# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Segun esto es para que las clases html no afecten a rails
# ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#     html_tag.html_safe
# end