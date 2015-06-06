class Event < ActiveRecord::Base

  has_many :event_topics
  has_many :topics, through: :event_topics

  validates :name, length: {minimum: 1, maximum: 200}
  validates :starts_at, presence: true

  def self.for_topics(topics)
    if topics.empty?
      self.none
    else
      self.joins(:event_topics).where("event_topics.topic_id in (?)", 
                                      topics.collect(&:id))
    end
  end

  def self.requiring_topic(topic)
    join_name = "topic_#{topic.id.to_i}"
    self.joins("join event_topics as #{join_name} on #{join_name}.event_id = events.id")
      .where("#{join_name}.topic_id = ?", topic.id)
  end
end