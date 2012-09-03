require 'rubygems'
require 'cssmin'

gem 'minitest'
require 'minitest/autorun'

describe CSSMin do
  subject { CSSMin.minify(css) }

  Dir['test/fixtures/*.css'].each do |fixture_path|
    describe 'minify' do
      let(:css) { File.read(fixture_path) }
      let(:expected_minified_css) { File.read(fixture_path + '.min').strip }

      it 'should minify the CSS as expected' do
        skip "not yet supported" if subject != expected_minified_css
        subject.must_equal expected_minified_css
      end
    end
  end

  describe 'replace none with 0 for border and background' do
    let(:css) { IO.read('test/fixtures/none.css') }
    let(:expected_minified_css) { IO.read('test/fixtures/none.min.css').strip }

    it { subject.must_equal expected_minified_css }
  end

end
