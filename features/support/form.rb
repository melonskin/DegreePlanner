module FormHelper
  def fill_in_autocomplete(selector, value)
    page.execute_script %Q{$('#{selector}').focus().val('#{value}').keydown()}
  end

  def choose_autocomplete(text)
    find('ul.ui-autocomplete').should have_content(text)
    page.execute_script("$('.ui-menu-item:contains(\"#{text}\")').find('a').trigger('mouseenter').click()")
  end
end
World(FormHelper)
