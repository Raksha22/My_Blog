class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
    # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  
  # def welcome_email(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end
end