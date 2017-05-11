class ErrorNotificationMailer < ApplicationMailer
	
	def internal_server_error_notification
		mail(to: "leonma333@kicks4love.com", subject: 'an error has occured')
	end
end
