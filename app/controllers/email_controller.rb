class EmailController < ApplicationController
	def email_form
	end

	def email_send
		email = params[:email]
		title = params[:title]
		content = params[:content]

		gmail = Gmail.connect('hspark@sogaeyo.com', '@th0heez')
		gmail.deliver do
			charset = "UTF-8"
			content_transfer_encoding="8bit"
			to email
			subject title
			text_part do
				body content
			end
		end

		gmail.logout
	end
end
