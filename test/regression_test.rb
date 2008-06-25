require File.dirname(__FILE__) + '/test_helper'

class RegressionTest < FasterXSTest
  def test_content_nil_regressions
    expected = {"asdf"=>{"jklsemicolon"=>{}}}
    assert_equal expected, FasterXmlSimple.xml_in("<asdf><jklsemicolon /></asdf>")
    assert_equal expected, FasterXmlSimple.xml_in("<asdf><jklsemicolon /></asdf>", 'forcearray'=>['asdf'])
  end

  def test_s3_regression
    str = File.read("test/fixtures/test-7.xml")
    assert_nil FasterXmlSimple.xml_in(str)["AccessControlPolicy"]["AccessControlList"]["__content__"]
  end

  def test_xml_simple_transparency
    assert_equal XmlSimple.xml_in("<asdf />"), FasterXmlSimple.xml_in("<asdf />")
  end

  def test_suppress_empty_variations
    str = "<asdf><fdsa /></asdf>"

    assert_equal Hash.new, FasterXmlSimple.xml_in(str)["asdf"]["fdsa"]
    assert_nil FasterXmlSimple.xml_in(str, 'suppressempty'=>nil)["asdf"]["fdsa"]
    assert_equal '', FasterXmlSimple.xml_in(str, 'suppressempty'=>'')["asdf"]["fdsa"]
    assert !FasterXmlSimple.xml_in(str, 'suppressempty'=>true)["asdf"].has_key?("fdsa")
  end

  def test_empty_string_doesnt_crash
    assert_raise(XML::Parser::ParseError) do
      silence_stderr do
        FasterXmlSimple.xml_in('')
      end
    end
  end

  def test_keeproot_false
    str = "<asdf><fdsa>1</fdsa></asdf>"
    expected = {"fdsa"=>"1"}
    assert_equal expected, FasterXmlSimple.xml_in(str, 'keeproot'=>false)
  end

  def test_keeproot_false_with_force_content
    str = "<asdf><fdsa>1</fdsa></asdf>"
    expected = {"fdsa"=>{"__content__"=>"1"}}
    assert_equal expected, FasterXmlSimple.xml_in(str, 'keeproot'=>false, 'forcecontent'=>true)
  end

  def test_group_tag
    str = "<a>
            <c>
            <b>1</b>
            <b>2</b>
            </c>
          </a>"
    expected = { "a" => { 'c' => ["1", "2"] }}
    assert_equal expected, FasterXmlSimple.xml_in(str, 'grouptags' => { 'c' => 'b'})

  end

  def test_compress_whitespace
    str = "<a><b>   a    b   </b></a>"
    expected = { "a" => { 'b' => " a b "}}
    assert_equal expected, FasterXmlSimple.xml_in(str, 'compress_whitespace' => ['b'])

  end


  def test_cdata
    str = "<a> <b><![CDATA[ a ]]></b> </a>"
    expected = {  "a" => { "b" => " a "}}
    assert_equal expected, FasterXmlSimple.xml_in(str)

  end
  
  def test_remove_comment
    str = %Q(<r>
  <a>a</a>
  <!--<b>b</b>-->
  <titles>
    <title>1</title>
    <title>2</title>
    <!--<title>3</title>-->
  </titles>
</r>)
    expected = {"r" => {"a" => "a", "titles"=>{"title"=>["1", "2"]}} }
    assert_equal expected, FasterXmlSimple.xml_in(str)
  end
end