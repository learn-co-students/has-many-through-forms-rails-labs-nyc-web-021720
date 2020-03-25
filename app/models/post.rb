class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories

  def unique_users    
    users.uniq
  end

  def categories_attributes=(attributes)
    name_att = attributes.find {|att| att[1].has_key?("name") }[1]
    if name_att["name"].present? then
      new_cat = Category.find_or_create_by(name_att)
      self.categories << new_cat
    end
  end
end
