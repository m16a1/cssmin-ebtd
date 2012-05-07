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

  describe 'empty media classes' do
    it { skip "not yet supported" }
    #run_test_from_fixture('test/fixtures/media-empty-class.css')
  end

  describe 'removing redundant zeros' do
    run_test_from_fixture('test/fixtures/zeros.css')
  end

  describe 'webkit transform' do
    it { skip "not yet supported" }
    #run_test_from_fixture('test/fixtures/webkit-transform.css')
  end

  describe 'preserving strings in comments' do
    it { skip("not yet supported") }
    #run_test_from_fixture('test/fixtures/string-in-comment.css')
  end

  describe 'star underscore hacks' do
    run_test_from_fixture('test/fixtures/star-underscore-hacks.css')
  end

  describe 'special comments' do
    it { skip("not yet supported") }
    #run_test_from_fixture('test/fixtures/special-comments.css')
  end

  describe 'pseudo' do
    it { skip("not yet supported") }
    #run_test_from_fixture('test/fixtures/pseudo.css')
  end

  describe 'pseudo' do
    it { skip("not yet supported") }
    #run_test_from_fixture('test/fixtures/pseudo-first.css')
  end
end
