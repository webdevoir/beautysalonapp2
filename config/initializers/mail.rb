ActionMailer::Base.smtp_settings = {
  address: "smtp.mandrillapp.com",
  port: 587,
  enable_starttls_auto: true,
  user_name: "anthony.candaele@webmove.be",
  password: "h3oMZz55JINaEp0WT6J1Yg",
  authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
