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

  def mark_top_ten
    top_ten = TopRanking.new.get_top_ten
    top_ten.each do |read|
      if read[:url] == self.url
        self.rank = 'Hot'
        self.save
      end
    end
    if top_ten[0][:url] == self.url
      self.rank = 'Top'
      self.save
    end
  end
end
