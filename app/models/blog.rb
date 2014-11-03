class Blog < ActiveRecord::Base
  has_attached_file :photo, :styles => {thumb: "100x100#", :medium => "260x195#", :large => "850x260#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true  

  def self.filter_category(category)
    category.present? ? where( "category LIKE ?", "%#{category}%") : where(nil)
  end

  def self.category_count
    Blog.group(:category).count
  end
end