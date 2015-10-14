# defines class: username, body, created at

class Bubble
 attr_accessor :username, :body, :created_at


  def initialize(hash_o_attrs)
    @username   = hash_o_attrs[:username]
    @body       = hash_o_attrs[:body]
    @created_at = hash_o_attrs[:created_at]
  end

  def formatted_string
    @formatted_string = "Username: #{@username}\nPost: #{@body}\nTime:#{@created_at}"
  end

end
