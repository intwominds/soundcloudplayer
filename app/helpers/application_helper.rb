module ApplicationHelper
  def smartnav
    links = ''

    if @current_account.present?
      links += "<div id='log-out'>"
      links += link_to('Logout ' + @current_account.username, login_path, :data => {:method => :delete, :confirm => 'Really logout?'})
      links += "</div>"
    else
      links += "<div id='sign-up'>#{ link_to('Sign up', new_account_path) }</div>"
      links += "<div id='sign-in'>#{ link_to('Sign in', login_path) }</div>"
    end

    links
  end
end
