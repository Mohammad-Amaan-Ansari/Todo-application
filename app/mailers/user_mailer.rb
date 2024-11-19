class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    if Rails.env.production?
      @url = 'https://todo-application-7fa0.onrender.com'
    else
      @url = 'http://127.0.0.1:3000'
    end
    attachments.inline['Todo_Application.jpg'] = File.read(Rails.root.join('app/assets/images/Todo_Application.jpg'))

    mail(to: @user.email, subject: 'Welcome to MyApp')
  end
end
# @url = 'http://127.0.0.1:3000'
# @url = 'https://todo-application-7fa0.onrender.com'




