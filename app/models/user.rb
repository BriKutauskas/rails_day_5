class User
  def initialize(first, last, street, city, state, zip, country, email, username, password)
    @first = first
    @last = last
    @street = street
    @city = city
    @state = state
    @zip = zip
    @country = country
    @email = email
    @username = username
    @password = password
    @loggedin = false
  end
  def show_username
    @username
  end
  def show_password
    @password
  end
  def show_fullname
    @first + " " + @last
  end
  def show_address
    "#{@street} \n #{@city}, #{@state}, #{@zip}, #{@country}"
  end
  def show_email
    @email
  end
  def loggedin
    @loggedin = true
  end
  def log
    @loggedin
  end
end
