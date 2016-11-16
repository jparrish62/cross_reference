module SessionHelpers
  def sign_in(user)
    visit user_session_path
    fill_in "Email",     with: user.email
    fill_in "User name", with: user.user_name
    fill_in "Password",  with: user.password
    click_button('Log in')
  end
end
