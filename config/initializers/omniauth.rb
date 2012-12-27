Rails.application.config.middleware.use OmniAuth::Builder do

  provider :twitter, 'BAC2wJBSw47EpQxVq4WcIQ', 'PYAeMUgfzVUNXlqzanYiHDSV6p1183PnGXEHddzKMCk'
#  provider :facebook, 'APP_ID', 'APP_SECRET', {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
 
end