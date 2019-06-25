class Customer < ApplicationRecord

  def self.search(params)
    where("first_name ILIKE '%#{params[:query]}%'").map { |c| { id: c.id, full_name: c.full_name } }
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
