module ApplicationHelper
  ALERT_TYPES = [:success, :info, :warning, :danger]

  # >> puts Benchmark.measure { Time.now.year }
  # 0.000000   0.000000   0.000000 (  0.000026)
  # It's .02ms, I'd rather never to wory about this, or overengineer it.
  def knowmad_copyright_footer_text
    "&copy; Knowmad #{Time.now.year}".html_safe
  end

  # stolen from bootstrap rails
  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      normalized_type = normalized_type(type)
      next if message.blank? || normalized_type.nil?

      tag_class = options.extract!(:class)[:class]
      tag_options = {
        class: "alert fade in alert-#{normalized_type} #{tag_class}"
      }.merge(options)

      close_button = content_tag(:button, raw('&times;'), type: 'button', class: 'close', 'data-dismiss' => 'alert')

      Array(message).each do |msg|
        text = content_tag(:div, close_button + msg.html_safe, tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def normalized_type(type)
    normalized_type = case type = type.to_sym
    when :notice then :success
    when :alert  then :danger
    when :error  then :danger
    else
      type
    end

    normalized_type if ALERT_TYPES.include?(normalized_type)
  end
end
