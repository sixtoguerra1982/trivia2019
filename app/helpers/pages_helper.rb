module PagesHelper
  def nameuser(userid)
    User.find(userid)
  end
end
