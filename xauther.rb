#encoding: utf-8

require 'oauth'
require 'net/http'

module XAuth
    require 'mechanize'

    def xauth (id, pw)
        @id = id
        @pw = pw
        @token = get_access_token( oauth_verifier: pin )
    end

    def pin
        agent = Mechanize.new
        agent.get( authorize_url )
        agent.page.forms_with(id: 'login_form').each do |form|
            form.field_with(:id => "username_or_email").value = @id
            form.field_with(:id => "session[password]").value = @pw
            form.click_button
        end

        (agent.page/'div[@id="oauth_pin"]')[0].text.to_i
    end

end
OAuth::RequestToken.send(:include, XAuth)
