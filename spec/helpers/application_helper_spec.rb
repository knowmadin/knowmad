require 'rails_helper'
require 'timecop'

RSpec.describe ApplicationHelper, :type => :helper do
  describe '#knowmad_copyright_footer_text' do
    before { Timecop.freeze }

    it 'displays the title, and formatted date' do
      expect(helper.knowmad_copyright_footer_text).to eq("&copy; Knowmad #{Time.now.year}")
    end

    it 'returns an html_safe string' do
      expect(helper.knowmad_copyright_footer_text.html_safe?).to be true
    end

    after { Timecop.return }
  end
end