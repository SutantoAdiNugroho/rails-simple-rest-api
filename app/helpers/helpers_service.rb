# frozen_string_literal: true

class HelpersService
  def openstruct_to_hash(object, hash = {})
    object.each_pair do |key, value|
      hash[key] = value.is_a?(OpenStruct) ? openstruct_to_hash(value) : value
    end
    hash
  end
end
