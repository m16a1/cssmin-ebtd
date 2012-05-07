require 'rubygems'
require 'cssmin'

gem 'minitest'
require 'minitest/autorun'

def run_test_from_fixture(fixture_path)
  let(:css) { File.read(fixture_path) }
  let(:expected_minified_css) { File.read(fixture_path + '.min').strip }

  it { subject.must_equal expected_minified_css }
end

describe CSSMin do
  subject { CSSMin.minify(css) }

  describe 'preserving significant whitespace in a media query' do
    run_test_from_fixture('test/fixtures/media-test.css')
  end

  describe 'preserving significant whitespace in multiple media queries' do
    run_test_from_fixture('test/fixtures/media-multi.css')
  end

  #describe 'run all the tests' do
    #Dir['test/fixtures/*.css'].each do |css|
      #it {
        #input = File.read(css)
        #expected = File.read(css + ".min").strip
        #CSSMin.minify(input).must_equal expected
      #}
    #end
  #end

end
