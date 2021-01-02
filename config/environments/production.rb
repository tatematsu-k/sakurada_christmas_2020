Jets.application.configure do
  # Example:
  # config.function.memory_size = 2048

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # Docs: http://rubyonjets.com/docs/email-sending/
  # config.action_mailer.raise_delivery_errors = false
  if ENV["SECURITY_GROUP_IDS"] && ENV["SUBNET_IDS"]
    config.function.vpc_config = {
      security_group_ids: ENV["SECURITY_GROUP_IDS"].split(","),
      subnet_ids: ENV["SUBNET_IDS"].split(","),
    }
  end
end
