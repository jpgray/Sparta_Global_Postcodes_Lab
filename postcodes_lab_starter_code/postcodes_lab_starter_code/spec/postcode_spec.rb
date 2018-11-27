require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('KT198JG') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_status(@response)).to eq 200
    end

    it "should have a results hash" do
      expect(@postcodesio.get_result(@response)).to be_kind_of Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_postcode(@response).length).to be_between(5, 7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_result(@response)["quality"]).to be_kind_of Integer
      expect(@postcodesio.get_result(@response)["quality"]).to be_between(1, 9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.get_result(@response)["eastings"]).to be_kind_of Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.get_result(@response)["country"]).to eq("England").or eq("Scotland").or eq("Wales").or eq("Northern Ireland")
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.get_result(@response)["nhs_ha"]).to be_kind_of String
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_result(@response)["longitude"]).to be_kind_of Float
    end

    it "should return a latitude float value" do
      expect(@postcodesio.get_result(@response)["latitude"]).to be_kind_of Float
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.get_result(@response)["parliamentary_constituency"]).to be_kind_of String

    end

    it "should return a european_electoral_region string" do
    end

    it "should return a primary_care_trust string" do
    end

    it "should return a region string" do
    end

    it "should return a parish string" do
    end

    it "should return a lsoa string" do
    end

    it "should return a msoa string" do
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
    end

    it "should return a incode string of three characters" do
    end

    it "should return a msoa string" do
    end

    it "should return a incode string of 3-4 characters" do
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(['KT19 8JG', 'KT18 2DJ']) #Add in array of postcodes
    end

    it "should respond with a status message of 200" do
    end

    it "should return the first query as the first postcode in the response" do
    end

    it "should return the second query as the first postcode in the response" do
    end

    it "should have a results hash" do
    end

    it "should return a postcode between 5-7 in length"  do
    end

    it "should return an quality key integer between 1-9" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return a country which is one of the four constituent countries of the UK" do
    end

    it "should return a string value for NHS authority " do
    end

    it "should return a longitude float value" do
    end

    it "should return a latitude float value" do
    end

    it "should return a parliamentary constituency string" do
    end

    it "should return a european_electoral_region string" do
    end

    it "should return a primary_care_trust string" do
    end

    it "should return a region string" do
    end

    it "should return a parish string" do
    end

    it "should return a lsoa string" do
    end

    it "should return a msoa string" do
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
    end

    it "should return a incode string of three characters" do
    end

    it "should return a msoa string" do
    end

    it "should return a incode string of 3-4 characters" do
    end

    it "should have a results hash" do
    end

    it "should return a postcode between 5-7 in length"  do
    end

    it "should return an quality key integer between 1-9" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return a country which is one of the four constituent countries of the UK" do
    end

    it "should return a string value for NHS authority " do
    end

    it "should return a longitude float value" do
    end

    it "should return a latitude float value" do
    end

    it "should return a parliamentary constituency string" do
    end

    it "should return a european_electoral_region string" do
    end

    it "should return a primary_care_trust string" do
    end

    it "should return a region string" do
    end

    it "should return a parish string" do
    end

    it "should return a lsoa string" do
    end

    it "should return a msoa string" do
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
    end

    it "should return a incode string of three characters" do
    end

    it "should return a msoa string" do
    end

    it "should return a incode string of 3-4 characters" do
    end

  end


end
