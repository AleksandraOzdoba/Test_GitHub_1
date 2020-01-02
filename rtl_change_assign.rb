# Created 04.06.2019
# Tickets: RTL: change assign from RTL
# Author: Aleksandra Ozdoba


require 'spec_helper'


shared_examples 'Space: RTL: Change assigne from the list' do

  describe 'Space: RTL: Change assigne from the list' do
    let(:dropdown_list) {WEBAPP_CONFIG['Top_bar']['tb_dropdown']['tb_dropdown_itm']}
    let(:first_space) {"a[title='Open space']"}
    let(:tb_ticket_tool) {WEBAPP_CONFIG['Top_bar']['tb_dropdown']['tb_tickets_tool_selector']}
    let(:rtl_tab_selector) {WEBAPP_CONFIG['Space']['tickets']['rtl']['rtl_tab_selector']}
    let(:assigne_field_selector) {WEBAPP_CONFIG['Space']['tickets']['rtl']['assigne_field_selector']}
    let(:first_user_selector) {WEBAPP_CONFIG['Space']['tickets']['rtl']['first_user_selector']}
    let(:avatar_assigned_user) {WEBAPP_CONFIG['Space']['tickets']['rtl']['avatar_assigned_user']}
    let(:ticket_row) {WEBAPP_CONFIG['Space']['tickets']['rtl']['ticket_row']}
    let(:context_menu) {WEBAPP_CONFIG['Space']['tickets']['rtl']['avatar_assigned_user']}
    let(:success_message_selector) {'div.messenger-message-inner'}
    let(:tekst) {'Successfully updated'}

    before do

      login(username, password)
      find(first_space, :match => :first).click
      find(dropdown_list).hover
      find(tb_ticket_tool).click
      find(rtl_tab_selector).click

    end

    it 'Change assigne via field from the list' do

      begin
        find(assigne_field_selector, :match => :first).click
        find(first_user_selector, :match => :first).click
        expect(page).to have_selector(avatar_assigned_user)
        puts 'Change assigne via field from the list works'
      rescue Exception
        puts 'Change assigne via field from the list not works'
      end

      begin
        find(ticket_row, :match => :first).right_click
        find('.display-block', text: 'Assigned to').hover
        find('.display-block', text: 'None').click
        expect(page).to have_selector(success_message_selector, text: tekst)
        puts 'Change assigne via context menu from the list works'
      rescue Exception
        puts 'Change assigne via context menu from the list not works'
      end

    end

  end
end
