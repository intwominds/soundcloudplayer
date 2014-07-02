module ApplicationHelper
  def smartindex
    links = ''

    unless @current_account.present?
      links += "<div id='sign-up'>#{ link_to('Sign up', new_account_path) }</div>"
      links += "<div id='sign-in'>#{ link_to('Sign in', login_path) }</div>"
    end

    links
  end
end
