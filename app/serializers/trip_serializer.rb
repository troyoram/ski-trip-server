# frozen_string_literal: true

class TripSerializer < ActiveModel::Serializer
  attributes :id, :location, :date, :equipment, :user_id
end
