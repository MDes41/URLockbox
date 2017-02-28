class Link < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  scope :hot, -> {
    select('links.url as url')
      .joins('join reads on reads.link_id = links.id')
      .where('reads.created_at > ?', Time.now - 1.day)
      .group("links.url")
      .order('count("reads".id) DESC').limit(10)
  }

  scope :sort, -> { order(id: :desc) }
  
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
end
