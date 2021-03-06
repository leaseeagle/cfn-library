require 'aws-sdk'

module Base2

  class AWSCredentials

    def self.get_assume_role_credentials(session_name)

      #check if AWS_ASSUME_ROLE exists
      session_name =  "#{session_name.gsub('_','-')}-#{Time.now.getutc.to_i}"
      if session_name.length > 64
        session_name = session_name[-64..-1]
      end
      assume_role = ENV['AWS_ASSUME_ROLE'] or nil
      if not assume_role.nil?
        return Aws::AssumeRoleCredentials.new(
            role_arn: assume_role,
            role_session_name: session_name
        )
      end

      return nil

    end
  end
end