class UserPassword
  def create_user_password
    "Fup#{Date.today.strftime("%Y")[2..3]}" + "#{rand.to_s[2..6]}"
  end
end
