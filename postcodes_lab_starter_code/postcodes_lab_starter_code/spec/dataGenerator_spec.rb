describe Postcodesio do

  before(:all) do
    @postcode_generator = Data_generator.new
  end

  it "should produce a single postcode string" do
    expect(@postcode_generator.generate_postcode).to be_kind_of String
  end

  it "should produce a postcode with between 6 and 8 characters" do
    expect(@postcode_generator.generate_postcode.length).to be_between(6, 8)
  end

  it "should produce an array" do
    expect(@postcode_generator.generate_postcodes).to be_kind_of Array
  end

  it "should produce an array with between 2 and 10 postcodes" do
    expect(@postcode_generator.generate_postcodes.length).to be_between(2, 10)
  end

end
