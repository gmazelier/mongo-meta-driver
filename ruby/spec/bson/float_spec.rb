# encoding: utf-8
require "spec_helper"

describe BSON::Float do

  describe "::BSON_TYPE" do

    it "returns 0x01" do
      expect(Float::BSON_TYPE).to eq(1.chr)
    end
  end

  describe "#bson_type" do

    it "returns the BSON_TYPE" do
      expect(1.23332.bson_type).to eq(Float::BSON_TYPE)
    end
  end

  describe "#to_bson" do

    let(:float) do
      1.2332
    end

    let(:encoded) do
      float.to_bson
    end

    let(:expected) do
      [ float ].pack(Float::DOUBLE_PACK)
    end

    it "returns the encoded string" do
      expect(encoded).to eq(expected)
    end

    it_behaves_like "a binary encoded string"
  end

  context "when the class is loaded" do

    let(:registered) do
      BSON::Registry.get(Float::BSON_TYPE)
    end

    it "registers the type" do
      expect(registered).to eq(Float)
    end
  end
end
