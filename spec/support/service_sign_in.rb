module ServiceSignIn
  def sign_in(user)
    controller.instance_variable_set(:@current_user, user)
  end
end