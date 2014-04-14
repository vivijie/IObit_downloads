  class Record < ActiveRecord::Base
  belongs_to :mac

  def self.today_downloads(days_ago)
    self.where('created_at >= ? and created_at <= ?', (Time.now - days_ago.day + 8.hour).beginning_of_day - 8.hour, (Time.now - days_ago.day + 8.hour).end_of_day - 8.hour).sum("downloads")
  end

  def self.today_records
    self.where('created_at >= ? and created_at <= ?', (Time.now + 8.hour).beginning_of_day - 8.hour, (Time.now + 8.hour).end_of_day - 8.hour)
  end

  # Count every day downloads at one week.
  def self.day_downloads(time)
    self.where(created_at: self.time_range(time)).sum("downloads")
  end

  def self.time_range(time)
    ((Time.now + 8.hour).beginning_of_week - 8.hour + (time-1).day)..((Time.now + 8.hour).beginning_of_week - 8.hour + time.day)
  end

  def self.week_time_range_to_admin(time)
    ((Time.now + 8.hour).beginning_of_week + (time-1).day).strftime("%b-%d-%A")
  end

  def self.week_downloads(week)
    self.where('created_at >= ? and created_at <= ?', (Time.now + 8.hour).beginning_of_week - 8.hour - 1.day + week.week, (Time.now + 8.hour).end_of_week - 8.hour - 1.day + week.week).sum("downloads")
  end

  
  def self.clean_database_a_month_ago
    self.where('created_at <= ?', Time.now - 1.month).delete_all
  end
end
