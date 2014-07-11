class Spreadsheet
  include Mongoid::Document

  field :spreadsheet_id,    type: String
  field :spreadsheet_title, type: String
  field :refresh_token,     type: String
  field :expires_at,        type: Time
  field :access_token,      type: String

  validates :access_token, uniqueness: true

  def add_tokens(tokens = {})
    self['access_token']   = tokens.fetch('token')
    self['refresh_token']  = tokens.fetch('refresh_token')
    self['expires_at']     = tokens.fetch('expires_at')
  end

  def add_spreadsheet_credentials(credentials = {})
    #binding.pry
    self['spreadsheet_id']    = credentials['id']
    self['spreadsheet_title'] = credentials['title']
  end

  def access_token
    self['access_token']
  end

end
