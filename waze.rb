require 'rest-client'
require 'json'

GET_CSRF_URL = "https://www.waze.com/login/get"
SESSION_URL = "https://www.waze.com/login/create"
SESSION_LIST_URL = "https://www.waze.com/Descartes-live/app/Archive/List"
SESSON_DATA_URL = "https://www.waze.com/Descartes-live/app/Archive/Session"
AUTH = {'user_id'=>'JohnDoeSpeedy228','password'=>'gre@tStory92'}

req = RestClient.get(GET_CSRF_URL)
csrfhash = req.cookies
csrfhash['editor_env'] = 'row'
headers = {'X-CSRF-Token'=>csrfhash['_csrf_token']}

log = RestClient::Request.execute(
  method: :post,
  url: SESSION_URL,
  cookies: csrfhash,
  headers: headers,
  payload: AUTH
)

ses = RestClient::Request.execute(
  method: :get,
  url: SESSION_LIST_URL,
  cookies: log.cookies,
  payload: {'minDistance'=>1000,'count'=>50, 'offset'=>0}
)

puts JSON.parse(ses)
