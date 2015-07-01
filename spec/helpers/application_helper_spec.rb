require 'rails_helper'
require 'timecop'

describe ApplicationHelper do
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

  describe '#bootstrap_flash' do
    context 'without a flash' do
      before { allow(self).to receive(:flash) { {} } }
      let(:bootstrap_flash) { helper.bootstrap_flash }

      it 'should not return anything without flashes' do
        expect(bootstrap_flash).to eql('')
      end
    end


    it 'should work with a notice' do
      allow(controller).to receive(:flash) { {notice: 'Hello'} }

      element = helper.bootstrap_flash

      expect(element).to have_tag(:div,
        text: '×Hello',
        with: {class: 'alert fade in alert-success'}) {
          with_tag(:button,
            text: '×',
            with: {
              class: 'close',
              'data-dismiss' => 'alert'
            }
          )
        }
    end

    it 'should work with a notice and an extra class' do
      allow(controller).to receive(:flash) { {notice: 'Hello'} }

      element = helper.bootstrap_flash(class: 'extra-class')

      expect(element).to have_tag(:div,
        text: '×Hello',
        with: {class: 'alert fade in alert-success extra-class'}) {
          with_tag(:button,
            text: '×',
            with: {
              class: 'close',
              'data-dismiss' => 'alert'
            }
          )
        }
    end

    it 'should work with a notice and an extra class and an extra attribute' do
      allow(controller).to receive(:flash) { {notice: 'Hello'} }

      element = helper.bootstrap_flash(class: 'extra-class', 'data-no-transition-cache' => true)

      expect(element).to have_tag(:div,
        text: '×Hello',
        with: {
          class: 'alert fade in alert-success extra-class',
          'data-no-transition-cache' => true
        }) {
          with_tag(:button,
            text: '×',
            with: {
              class: 'close',
              'data-dismiss' => 'alert'
            }
          )
        }
    end
  end
end
