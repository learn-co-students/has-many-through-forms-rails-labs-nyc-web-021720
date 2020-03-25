class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user

  def user_attributes=(attributes)
    name_att = attributes["username"]
    if name_att.present? then
      self.user = User.find_or_create_by(username: name_att)
    end
  end
end
