class Project < ApplicationRecord
  validates :name, presence: { message: "is forgetten to be entered" } # this would allow us to validate if the user has added a name into the field
end
