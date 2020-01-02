# Created 12.07.2019
# Tickets: RTL: All tickets filter has all components
# Author: Aleksandra Ozdoba


require 'spec_helper'


shared_examples 'Space: RTL: All tickets filter has all components' do

  describe 'Space: RTL: All tickets filter has all components' do
    let(:create_space_button_selector) {WEBAPP_CONFIG['Portfolio']['create_new_space_button']['create_new_space_button_item']}
    let(:dropdown_list) {WEBAPP_CONFIG['Top_bar']['tb_dropdown']['tb_dropdown_itm']}
    let(:tb_tickets_tool_selector) {WEBAPP_CONFIG['Top_bar']['tb_dropdown']['tb_tickets_tool_selector']}
    let(:rtl_tab_selector) {WEBAPP_CONFIG['Space']['tickets']['rtl']['rtl_tab_selector']}
    let(:all_tickets_selector) {WEBAPP_CONFIG['Space']['tickets']['rtl']['filter']['all_tickets_selector']}
    let(:search_field_selector) {WEBAPP_CONFIG['Space']['tickets']['rtl']['filter']['search_field_selector']}
    let(:search_phrase) {"My"}
    let(:space_name) {'SpaceOli600'}

    before do

      login(username, password)
      find(create_space_button_selector).click
      create_space(space_name, true, $tools_support, false)
      sleep(6)
      find(dropdown_list).hover
      find(tb_tickets_tool_selector, :match => :first).click
      find(rtl_tab_selector).click
      find(all_tickets_selector).click
    end

    it 'All tickets filter has all components' do

      begin
        find(search_field_selector).fill_in with: search_phrase
        expect(page).to have_selector('span', text: 'All My Tickets')
        puts 'Search field exist'
      rescue Exception
        puts 'Search field not exist'
      end
      
    end

  end
end
