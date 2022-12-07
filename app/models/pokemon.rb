class Pokemon < ApplicationRecord
    validates :name, presence: true
    validates :hp, numericality: { only_integer: true }
    validates :total, numericality: { only_integer: true }
end
