require("tsp")
require("阿波罗")
local sz = require("sz")



Facebook_url = 'http://onlyonelife.online/Public/facebook/?service=Facebook.add'
function upFacebook(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = Facebook_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)

	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 30, headers_send, post_escaped)
	

	if status_resp == 200 then
		toast('上传成功')
		return true
	end
end


init('0',0)
app_name = '暴风影音'
bid_app = 'com.baofengyingyin.iphoneversion'


function play()
	计时 = os.time()
	超时 = 10
	while (os.time()-计时<超时) do
		if active(bid_app,5)then

		end
		mSleep(1000*2)
	end
end


while true do
	if abl()then
		log('一键新机')
		get_idfa(bid_app)
		delay(1)

		if VPN()then
			up ={}
			up.mail = idfa
			up.fristname = app_name
			up.lastname = bid_app
			up.password = 'ATM-暴风影音'
			up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
			up.map = 'ATM'
			upFacebook(up)
			play()
		end
		close_VPN()
	
		delay(2)
	end
end













