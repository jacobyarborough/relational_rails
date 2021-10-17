class AddChannelToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscribers, :channel, foreign_key: true
  end
end
