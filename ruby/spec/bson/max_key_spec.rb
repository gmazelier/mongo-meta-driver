# encoding: utf-8
require "spec_helper"

describe BSON::MaxKey do

  describe "#==" do

    let(:max_key) do
      described_class.new
    end

    context "when the objects are equal" do

      let(:other) do
        described_class.new
      end

      it "returns true" do
        expect(max_key).to eq(other)
      end
    end

    context "when the other object is not a max_key" do

      it "returns false" do
        expect(max_key).to_not eq("test")
      end
    end
  end

  describe "#>" do

    let(:max_key) do
      described_class.new
    end

    it "always returns true" do
      expect(max_key > Integer::MAX_64BIT).to be_true
    end
  end

  describe "#<" do

    let(:max_key) do
      described_class.new
    end

    it "always returns false" do
      expect(max_key < Integer::MAX_64BIT).to be_false
    end
  end

  describe "::BSON_TYPE" do

    it "returns 0xFF" do
      expect(BSON::MaxKey::BSON_TYPE).to eq(127.chr)
    end
  end

  describe "#bson_type" do

    let(:max_key) do
      described_class.new
    end

    it "returns 0xFF" do
      expect(max_key.bson_type).to eq(BSON::MaxKey::BSON_TYPE)
    end
  end

  describe "#to_bson" do

    let(:max_key) do
      described_class.new
    end

    let(:encoded) do
      max_key.to_bson
    end

    it "returns an empty string" do
      expect(encoded).to be_empty
    end
  end

  context "when the class is loaded" do

    let(:registered) do
      BSON::Registry.get(BSON::MaxKey::BSON_TYPE)
    end

    it "registers the type" do
      expect(registered).to eq(described_class)
    end
  end
end
