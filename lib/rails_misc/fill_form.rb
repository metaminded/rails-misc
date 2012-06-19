class ActionDispatch::IntegrationTest

  MONTH_NAMES = %w{January February March April May June July August September October November December}

  def fill_form(form_name, params, submit)
    params.each do |param_name, val|
      id = "#{form_name}_#{param_name}"
      case val
      when String then fill_in id, with: val
      when Fixnum, Float then fill_in id, with: val.to_s
      when Symbol then select val.to_s, from: id
      when true then check(id)
      when false then uncheck(id)
      when Time then
        select val.year.to_s, from: "#{id}_1i"
        select MONTH_NAMES[val.month], from: "#{id}_2i"
        select val.day.to_s, from: "#{id}_3i"
        select val.hour.to_s, from: "#{id}_4i"
        select val.min.to_s, from: "#{id}_5i"
      when Date then
        select val.year.to_s, from: "#{id}_1i"
        select MONTH_NAMES[val.month], from: "#{id}_2i"
        select val.day.to_s, from: "#{id}_3i"
      when File then attach_file(id, val.to_path)
      when Hash then fill_form(id, val, nil)
      else raise "Don't know what to do with `#{val}` on `#{id}`."
      end
    end
    yield if block_given?
    click_button submit if submit
  end

  def assert_path_is(path)
    assert_equal path, current_path
  end

  def assert_content(content)
    assert page.has_content?(content)
  end

end
