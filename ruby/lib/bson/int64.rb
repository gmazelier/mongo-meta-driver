# encoding: utf-8
module BSON

  # Represents a $maxKey type, which compares less than any other value in the
  # specification.
  #
  # @see http://bsonspec.org/#/specification
  #
  # @since 2.0.0
  class Int64

    # A boolean is type 0x08 in the BSON spec.
    #
    # @since 2.0.0
    BSON_TYPE = 18.chr.force_encoding(BINARY).freeze

    # Raised if an integer value is out of range to be serialized as 8 bytes.
    #
    # @since 2.0.0
    class OutOfRange < RuntimeError; end

    # Register this type when the module is loaded.
    #
    # @since 2.0.0
    Registry.register(BSON_TYPE, self)
  end
end
