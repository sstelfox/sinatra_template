
class Auth < TestCase
  def test_root_redirect
    get '/'

    assert(last_response.redirect?)
    assert_redirect('/login')
  end
end

