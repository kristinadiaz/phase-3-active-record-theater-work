class Audition < ActiveRecord::Base
  belongs_to :roles

  def call_back
    self.hired = true
    self.save
  end
end