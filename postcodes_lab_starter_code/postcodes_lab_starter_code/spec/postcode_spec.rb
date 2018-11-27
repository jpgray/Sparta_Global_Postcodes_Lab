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

    it "should return an ordnance survey northings value as integer" do
      expect(@postcodesio.get_result(@response)["northings"]).to be_kind_of Integer
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
      expect(@postcodesio.get_result(@response)["european_electoral_region"]).to be_kind_of String
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.get_result(@response)["primary_care_trust"]).to be_kind_of String
    end

    it "should return a region string" do
      expect(@postcodesio.get_result(@response)["region"]).to be_kind_of String
    end

    it "should return a parish string" do
      expect(@postcodesio.get_result(@response)["parish"]).to be_kind_of String
    end

    it "should return a lsoa string" do
      expect(@postcodesio.get_result(@response)["lsoa"]).to be_kind_of String
    end

    it "should return a msoa string" do
      expect(@postcodesio.get_result(@response)["msoa"]).to be_kind_of String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.get_result(@response)["admin_district"]).to be_kind_of String
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.get_result(@response)["incode"]).to be_kind_of String
      expect(@postcodesio.get_result(@response)["incode"].length).to eq 3
    end

    it "should return a incode string of 3-4 characters" do
      expect(@postcodesio.get_result(@response)["incode"]).to be_kind_of String
      expect(@postcodesio.get_result(@response)["incode"].length).to eq(3).or eq 4
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @postcode_generator = Data_generator.new
      @generated_postcodes = @postcode_generator.generate_postcodes
      @response = @postcodesio.get_multiple_postcodes(@generated_postcodes) #Add in array of postcodes
      @result_array = @postcodesio.get_results_array(@response)
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_status(@response)).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
      expect(@postcodesio.get_result(@response)[0]["query"]).to eq @generated_postcodes[0]
    end

    it "should return the second query as the first postcode in the response" do
      expect(@postcodesio.get_result(@response)[1]["query"]).to eq @generated_postcodes[1]
    end

    context "in the multiple results hash" do

      it "should have a results hash" do
        @result_array.each do |result|
          expect(result).to be_kind_of Hash
        end
      end

      it "should return a postcode between 5-7 in length"  do
        @result_array.each do |result|
          expect(@postcodesio.trim_postcode(result["postcode"]).length).to be_between(5,7)
        end
      end

      it "should return an quality key integer between 1-9" do
        @result_array.each do |result|
          expect(result["quality"]).to be_kind_of Integer
          expect(result["quality"]).to be_between(1, 9)
        end
      end

      it "should return an ordnance survey eastings value as integer" do
        expect(@response_result_to_check["eastings"]).to be_kind_of Integer
      end

      it "should return an ordnance survey eastings value as integer" do
        expect(@response_result_to_check["northings"]).to be_kind_of Integer
      end

      it "should return a country which is one of the four constituent countries of the UK" do
        expect(@response_result_to_check["country"]).to eq("England").or eq("Scotland").or eq("Wales").or eq("Northern Ireland")
      end

      it "should return a string value for NHS authority " do
        expect(@response_result_to_check["nhs_ha"]).to be_kind_of String
      end

      it "should return a longitude float value" do
        expect(@response_result_to_check["longitude"]).to be_kind_of Float
      end

      it "should return a latitude float value" do
        expect(@response_result_to_check["latitude"]).to be_kind_of Float
      end

      it "should return a parliamentary constituency string" do
        expect(@response_result_to_check["parliamentary_constituency"]).to be_kind_of String
      end

      it "should return a european_electoral_region string" do
        expect(@response_result_to_check["european_electoral_region"]).to be_kind_of String
      end

      it "should return a primary_care_trust string" do
        expect(@response_result_to_check["primary_care_trust"]).to be_kind_of String
      end

      it "should return a region string" do
        expect(@response_result_to_check["region"]).to be_kind_of String
      end

      it "should return a parish string" do
        expect(@response_result_to_check["parish"]).to be_kind_of String
      end

      it "should return a lsoa string" do
        expect(@response_result_to_check["lsoa"]).to be_kind_of String
      end

      it "should return a msoa string" do
        expect(@response_result_to_check["msoa"]).to be_kind_of String
      end
      # admin ward and county are not documented however tested below

      it "should return a admin_district string" do
        expect(@response_result_to_check["admin_district"]).to be_kind_of String
      end

      it "should return a incode string of three characters" do
        expect(@response_result_to_check["incode"]).to be_kind_of String
        expect(@response_result_to_check["incode"].length).to eq 3
      end

      it "should return a incode string of 3-4 characters" do
        expect(@response_result_to_check["incode"]).to be_kind_of String
        expect(@response_result_to_check["incode"].length).to eq(3).or eq 4
      end

    end
  end


end
