class Link < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  scope :sort, -> { order(id: :asc) }
  
  include ActiveModel::Validations

  validates :url, :presence => true

  validates_each :url do |record, attribute, value|
    return if value.blank?
    begin
      uri = URI.parse(value)
      resp = uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      resp = false
    end
    unless resp == true
      record.errors[attribute] << "is not a valid url"
    end
  end

  def clear_rank
    self.rank = ''
    self.save
  end

  def marks_the_top_read
    
  end
end
