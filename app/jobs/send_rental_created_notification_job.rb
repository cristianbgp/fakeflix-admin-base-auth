class SendRentalCreatedNotificationJob < ApplicationJob
  queue_as :default
 
  def perform(rental)
    User.where(role: "admin").each do |user|
      RentalMailer
        .with(user: user, rental: rental)
        .rental_created
        .deliver_later
    end
  end
 end