unlockDevice()
require("TSLib")
require("tsp")
require("AWZ")
require("game_ui")
aoc={}
require("rob")
require("service")
require("newplay")
require("city")
require("map")
require("help")
require("arm")
require("清理文件")
require("fuzhu")
require("ocr")
local sz = require("sz")

function UI(name1,name2,clicks,oder,s)
	clicks = clicks or false
	oder = oder or 1
	s = s or 95
	for i,v in ipairs(aoc[name1][name2]) do
		if isColor(v[1],v[2],v[3],s) then
		else
			return false
		end
	end
	
	if  clicks then
		click(aoc[name1][name2][oder][1],aoc[name1][name2][oder][2])
	end
	nLog(name2)
	return true
end
--多点取色
function UI_pic(n,m,clicks)
	if setting[15] then
		x,y = findMultiColorInRegionFuzzy(aoc[n][m][1],aoc[n][m][2],aoc[n][m][3],aoc[n][m][4],aoc[n][m][5],aoc[n][m][6],aoc[n][m][7], { orient = 6 })
	else	
		x,y = findMultiColorInRegionFuzzy(aoc[n][m][1],aoc[n][m][2],aoc[n][m][3],aoc[n][m][4],aoc[n][m][5],aoc[n][m][6],aoc[n][m][7])
	end
	
	if x > 0 and y > 0 then
		clicks = clicks or false
		if clicks then
			click(x,y)
			nLog("点多色-->"..m)
		else
			nLog("找多色-->"..m)
		end
		return true
	end
end
function click(x,y,times)
	times = times or 1
--	log("准备点击("..x..","..y..")")

	touchDown(1,x, y)
	mSleep(50)
	touchUp(1, x, y)
	mSleep(1000*times)
end

init('0',1);--横屏
toast('剑与家园-希望之光',1)

app = 'com.lilithgame.sgame'


aoc['在地图中']={}
	aoc['在地图中']['在地图界面']={{1219,34,0x9b5200}, {308,673,0x4cbcf2}, {223,698,0xd00501}, {67,692,0xe2ff33}, }
	--1商城,2领地,3地图,4任务
		aoc['在地图中']['发现矿点']={ 0x07b6ff, "0|-12|0x0f86d0,0|-19|0x07abff", 80, 422, 70, 989, 700}
		aoc['在地图中']['矿点顶部']={ 0x12f0ff, "0|3|0x0db9ff", 80, 384, 70, 968, 272}
		aoc['在地图中']['挡住矿的提示']={ 0xffffff, "2|-2|0x1d2828,-129|-15|0xada070,161|-23|0xad9f6d", 90, 217, 83, 1187, 635}
		aoc['在地图中']['活动奖励']={ 0xf9dd96, "9|0|0xd02d21,11|12|0xfce099", 90, 60, 158, 225, 191}
		aoc['在地图中']['活动星星']={ 0xe8e68e, "-11|-26|0x154d55,-30|-29|0xf2f293,-39|-41|0x11575c", 90, 4, 161, 227, 254}
		aoc['在地图中']['城市奖励']={{1069,688,0xf3f491},{1091,667,0xda331d},}
		aoc['在地图中']['声望奖励']={{119,131,0xf4d765},{178,111,0xd9341c},}
		aoc['在地图中']['战争结束']={{1182,131,0xffffff},{1180,128,0x9f0d06},{1175,128,0xffffff},}

aoc['返回']={}
	aoc['返回']['返回图标']={{36,29,0xf0ef90}}
		aoc['返回']['任务界面']={{210,34,0x0c121c},{210,36,0xffffff},{160,23,0x161c24},{161,23,0xf6f6f6},}
			aoc['返回']['感叹号']={ 0x42ffce, "6|-23|0x39fbca,13|-64|0x00ffdb", 90, 113, 103, 195, 713}
			aoc['返回']['任务蓝色']={ 0x22ffd3, "", 90, 108, 560, 206, 711}
			
			aoc['返回']['有任务下的红点']={ 0x528f26, "45|-33|0xd22e1e", 90, 1077, 206, 1312, 420}
			
			--活跃界面
			aoc['返回']['活跃界面']={{85,268,0xfff380},{90,274,0xfe9121},}
				aoc['返回']['活跃点击']={ 0xffffff, "-2|0|0x548e5b,6|0|0x8df144", 90, 111, 572, 1009, 654}
				aoc['返回']['活跃领取']={ 0xd3311e, "-24|23|0xfde12f", 90, 80, 134, 1011, 275}
				aoc['返回']['活跃领取-银宝箱']={ 0xd32d21, "-4|0|0xfeeca3", 90, 80, 136, 1014, 288}
			aoc['返回']['签到界面']={{482,138,0xdddc9a},{479,138,0xa71e05},}
				aoc['返回']['可以签到']={ 0x90f145, "-55|-21|0x46b554,53|-33|0x1d904c", 90, 105, 626, 1000, 712}
				aoc['返回']['可领龙币']={ 0xd3b862, "16|-13|0xcc2922", 90, 377, 154, 994, 214}
			
				
		aoc['返回']['在世界地图上']={{1274,688,0xf4f394},{1279,694,0x103d46},}
			aoc['返回']['前往']={ 0x28681e, "-2|0|0x51d03d,-2|24|0x99f44a", 90, 197, 8, 1214, 741}
			aoc['返回']['在城堡中']={{124,15,0xf4f190},{124,21,0x102e3b},}
		aoc['返回']['邮件界面']={{154,25,0x111720},{154,23,0xffffff},{160,25,0x141a23},{163,19,0xffffff},}
		aoc['返回']['宝箱界面']={{202,29,0xdedede},{202,30,0x1b1412},{202,39,0xffffff},{195,39,0x221c1b},}
		aoc['返回']['商城界面']={{1130,35,0xf5dc26}, {689,32,0xffffff}, {903,22,0xe7e873}, }
			aoc['返回']['商城']={{150,39,0x100907},{148,39,0xffffff},{152,39,0xfdfdfd},{143,22,0x2c2726},{143,21,0xffffff},}
				aoc['返回']['金币可以购买']={ 0xe9e776, "-10|26|0xedde78,15|19|0xcd8d2c,17|33|0xcaa32c", 90, 327, 361, 1047, 709}
				aoc['返回']['金币可以购买2']={ 0xe9e776, "-10|26|0xedde78,15|19|0xcd8d2c,17|33|0xcaa32c", 90, 81, 354, 1054, 432}
				aoc['返回']['3折稀有']={ 0xe78a10, "-11|0|0xfad955,-75|-17|0xb88130,-1|157|0xad5a10,-54|204|0xf7f6f6", 90, 345, 438, 1047, 710}
				aoc['返回']['最右端']={ 0xb2fdfd, "3|7|0x447fa0,-268|27|0xc8a77f,-456|-10|0xffffa5", 90, 369, 180, 1036, 397}
		aoc['返回']['设置']={{191,26,0x0b131d},{191,27,0xfdfdfd},{161,23,0x0f1720},{161,18,0xffffff},}
	
			aoc['返回']['宝箱红点']={ 0x5a9828, "23|-27|0xd6331d", 90, 1151, 104, 1308, 603}
				aoc['返回']['宝箱翻页']={{1042,444,0xa09970},{1039,382,0xcb2824},}
				aoc['返回']['免费宝箱']={ 0xfeffff, "44|3|0xffffff", 90, 491, 592, 613, 647}
			aoc['返回']['礼包红点']={ 0xcc0424, "2|-20|0xcc0424,10|-25|0xfffe5c", 90, 1098, 52, 1319, 741}
				aoc['返回']['奖励确定']={ 0x29aabe, "-153|-10|0x2c8ab6,153|-6|0x106fa9,-4|-49|0x1f93bd,-5|33|0x50d2ad", 90, 244, 167, 634, 717}
				aoc['返回']['有邮件在']={ 0x1d3d40, "68|35|0x1f3c3f,167|10|0x1c3b3f,345|19|0x142a3b", 90, 852, 94, 1294, 194}
				aoc['返回']['邮件可以删除']={ 0xd7d1de, "0|3|0x383e5f,0|15|0x77426f", 90, 1145, 96, 1301, 722}
				aoc['返回']['邮件不能删除']={ 0x94b4d2, "1|3|0x283038,13|-8|0x2e3841,16|-8|0x95b6d4", 90, 1178, 95, 1296, 276}
				
		aoc['返回']['爵位']={{157,28,0x191e27},{155,28,0xffffff},{149,28,0x33363c},{148,28,0xffffff},}
			aoc['返回']['晋升']={ 0x62dd3c, "7|-4|0x2a6a1e", 90, 1015, 603, 1192, 672}	
		aoc['返回']['英雄']={{163,24,0xffffff},{163,26,0x101620},{163,27,0xffffff},{164,35,0x111921},{166,39,0xffffff},}		
			aoc['返回']['英雄红点']={ 0xd8341d, "0|-10|0xf8d389,-12|2|0xfbdf98,12|2|0xfcea9f", 90, 272, 101, 1087, 158}
			aoc['返回']['英雄界面']={{478,184,0x109b31},{477,170,0xf5eea5},{498,169,0xc2a55e},}
				aoc['返回']['英雄装备']={ 0x2db050, "-5|4|0x3cb84b", 70, 436, 337, 839, 664}
				aoc['返回']['英雄穿戴']={ 0x114f5f, "-2|0|0x249cbc,-13|0|0x124f5e", 90, 972, 196, 1090, 653}
				aoc['返回']['天赋']={{1145,391,0x193610},{1233,364,0xdf3c16},}
				aoc['返回']['天赋学习']={ 0xcc0b00, "3|6|0xffffff,7|12|0xcf1600,22|19|0x229aba", 90, 824, 235, 909, 673}
				aoc['返回']['有装备可穿']={{1167,179,0x427d25},{1234,157,0xd63220},}
				aoc['返回']['英雄未获得']={ 0xfefecd, "", 90, 1024, 99, 1273, 167}
				aoc['返回']['英雄展开']={{300,136,0xaf924c},{300,139,0xfefecd},}
				aoc['返回']['有新装备提示界面']={{1232,157,0xd4321d},{1189,190,0xb6e71b},{1079,194,0xb7e71a},}
				
		aoc['返回']['医院']={{1049,590,0xf1ab35},{669,115,0xf4fff6},}
		aoc['返回']['挑战赛界面']={{710,28,0xf8f8f8},{711,28,0x222a2e},{716,28,0xffffff},}
			aoc['返回']['可以领奖']={ 0x7be940, "7|-19|0xffffff", 90, 816, 430, 962, 666}
			aoc['返回']['活动右侧例表']={ 0xcb2924, "-11|0|0xfadd8f", 90, 1236, 71, 1301, 692}
			aoc['返回']['跨服公会战']={{829,667,0x92ee45}, {229,670,0x94ef47}, }
			aoc['返回']['活动中心可以抽奖']={{356,513,0xffff7c},{491,464,0xd4311c},}
		
		aoc['返回']['宝库界面']={{205,18,0x161c24},{205,22,0xffffff},{205,23,0x161c24},{200,29,0x22272e},{200,31,0xffffff},}
		
		aoc['返回']['公会界面']={{194,31,0x121921},{194,27,0xffffff},{193,26,0x191e26},{182,34,0xffffff},{207,30,0x141a23},}
			
			aoc['返回']['公会奖励红点']={ 0x4a8525, "53|-27|0xcf2b20", 90, 1109, 101, 1298, 754}
			aoc['返回']['赠品界面']={{1202,560,0xcaf010},{1252,529,0xce2a21},}
				aoc['返回']['赠品领取']={ 0x56d242, "-37|-20|0x43ae72,100|12|0x5ee451,109|-16|0x14874b", 90, 100, 152, 1056, 467}
			aoc['返回']['城市界面']={{209,125,0xda0042},{677,125,0xda0042},{475,133,0x79004a},}
				aoc['返回']['全部领取']={ 0x82eb42, "1|-11|0x2d6f1f,-5|-11|0xffffff", 90, 843, 114, 1019, 168}
				aoc['返回']['城市奖励领取']={ 0xf5f99a, "-67|-1|0xffffff,-138|0|0xe1f777,-145|-1|0x73ef0b", 90, 108, 392, 1031, 565}
			
		aoc['返回']['服务器界面']={{1246,252,0xb2e31b},{1174,255,0xffffff},{1113,251,0xace01f},}
			aoc['返回']['服务器例表未展开']={{185,298,0xffffff},{185,297,0x1e4c5e},{179,307,0x44a7c2},}
			aoc['返回']['服务器例表展开']={{189,305,0xffffff},{189,308,0x285a65},{190,311,0x4bb2c8},}
			
		aoc['返回']['魔镜中']={{38,120,0xf1f2f1},{39,117,0x0c2822},{39,101,0xfbfcfb},}
			aoc['返回']['自动前进']={{57,687,0xa5ff3b},{78,681,0xa5ff3b},{71,648,0xa5ff3b},}
			aoc['返回']['魔镜遇怪']={ 0xcd2b22, "0|12|0xffdf9b", 90, 0, 262, 41, 302}
			
aoc['car'] = {}
	aoc['car']['人物定位']={ 0xe7e4eb, 
		"-11|0|0x373d5e,12|0|0x373d5e,18|0|0xffffff,-16|0|0xffffff", 90, 111, 4, 1223, 743}
	aoc['car']['误点城堡']={{847,39,0xe8e0c7},{488,39,0xe9e1c8},}
	aoc['car']['有车']={ 0xeb0000, "0|-4|0xfb0000", 90, 103, 21, 1221, 714}
		aoc['car']['前往']={ 0x52d23d, "2|0|0x28691e,-7|0|0xffffff", 90, 315, 44, 1183, 729}
		aoc['car']['点车子']={
			{ 0x63ddf5, "", 90, 449, 60, 890, 232},
			{ 0x63ddf5, "", 90, 759, 166, 1061, 610},
			{ 0x63ddf5, "", 90, 436, 313, 995, 605},
			{ 0x63ddf5, "", 90, 346, 121, 571, 562},
			}
aoc['car']['正在跑路']={ 0x9becf0, "26|-1|0x99f3fb,14|9|0x99f1f7", 90, 220, 111, 1118, 720}
aoc['car']['拦截']={{1176,511,0xffffff},{1316,486,0xef404d},{1071,515,0xf0edf3},}
aoc['car']['无体力劫车']={{1070,513,0xf2f1f2},{1070,507,0x333c4a},{1154,517,0x62778b},{1298,475,0x526474},}
	aoc['car']['展开']={ 0x21ae95, "-6|0|0x49d0b7", 90, 2, 354, 19, 388}
	aoc['car']['技能']={ 0x13130e, "3|-8|0xf3f38e", 90, 32, 392, 128, 433}
	aoc['car']['回城']={ 0xeefff3, "-35|-1|0xc3a155,72|-4|0xb7985f", 90, 212, 161, 391, 354}
	aoc['car']['使用']={ 0x114d5c, "-2|0|0x2193b1,3|0|0xffffff", 90, 930, 482, 1049, 544}
	aoc['car']['封号']={{696,471,0x44c83c},{693,471,0x23661f},{666,476,0x2a6a1e},{662,476,0x55d43d},}
	
aoc['换服']={}
	aoc['换服']['在地图上']={{1223,32,0x9c5400}, {223,699,0xd70000}, {67,684,0xd9ff24}, }
		aoc['换服']['帐号管理']={{1180,257,0x2d6720},{1183,257,0x173310},{1185,257,0x9eba94},}
		aoc['换服']['设置功能选择']={{283,275,0x29a0bd},{780,277,0x2aa5c0},{782,558,0x29a5c1},}
			--选服,绑定,礼包
		aoc['换服']['聊天按钮']={ 0x13474f, "8|-1|0xedeb92,14|-1|0x114549,22|0|0xd3c781", 90, 0, 0, 1333, 749}
		
		
		
	aoc['换服']['礼包兑换']={{633,413,0x29acbe},{644,180,0xffffff},{640,179,0x0e1d28},}
		aoc['换服']['输入完成']={ 0x007aff, "-26|-3|0x007aff,-19|15|0x007aff", 90, 1, 364, 1321, 735}
	aoc['换服']['兑换成功']={{676,584,0x14545e},{674,584,0xfdfdfd},{666,584,0x14545f},{661,584,0x29a8bd},}

	aoc['换服']['个人主页']={{1172,142,0xcbef0f},{1128,253,0x2d5e18},{1129,361,0x2d611a},{1110,463,0x2c6318},} -- 2,3
	aoc['换服']['设置界面']={{1131,463,0xb9e718},{1232,461,0xbce916},}
	aoc['换服']['设置功能选择']={{272,198,0x3bc0ba},{571,198,0x3cc2b9},{891,199,0x3dc1b9},{239,337,0x39bfbc},{248,507,0x26a6be},}
	aoc['换服']['新手界面']={{981,28,0xf6e12a},{760,33,0xe4c690},{354,13,0xeae877},}


aoc['城堡']={}
	aoc['城堡']['在城堡中']={{123,18,0xebea8e},{123,21,0x102d35},{1265,696,0x154f57},{1259,696,0xf5f596},}
		aoc['城堡']['点击城堡']={ 0xfe6461, "-4|0|0x872927", 90, 574, 75, 849, 234}
		aoc['城堡']['点击城堡2']={ 0xff7773, "-4|4|0xb45148", 90, 558, 72, 889, 273}
		aoc['城堡']['位置固定']={{1194,254,0x34a926},{299,309,0x4eb7ff},}
			aoc['城堡']['资源位置']={{1175,175,0x9a7145},{580,294,0xffcf3d},{319,252,0x1de7f4},}
			aoc['城堡']['木材']={ 0xf8da9c, "-4|6|0xf6ce8d,6|11|0xd8b37f,-6|12|0x1e4249", 90, 1016, 112, 1277, 330}
			aoc['城堡']['金币']={ 0xffff88, "16|17|0xf1ad2e,-9|25|0xffff94,1|19|0xc57c28", 90, 354, 242, 657, 427}
			aoc['城堡']['泉水']={ 0x00e8fa, "-8|-4|0x0e5356,-10|2|0xadffff", 80, 171, 90, 373, 304}

		aoc['城堡']['等待建造中']={ 0xb8ffff, 
			"10|-6|0x1279a1,10|17|0x215b5f,11|28|0xb9ffff,11|31|0x2b656b,22|34|0xc0ffff", 90, 186, 78, 1214, 717}
			
	aoc['城堡']['建筑展开']={{124,15,0xf5f493},{37,27,0xf4f494},}
		aoc['城堡']['新建筑']={ 0xf4d765, "15|2|0x105f2a,18|2|0x008b3e", 90, 0, 551, 1330, 578}
			aoc['城堡']['新仓库']={ 0x4a5e69, "-1|0|0xeeeff0,31|-2|0x485b68,31|-4|0xffffff,39|-6|0x3f5965", 90, 779, 705, 876, 746}
		
		aoc['城堡']['非主城建筑']={ 0x81b6c4, "76|0|0x2c7482,-62|0|0x488099", 90, 0, 706, 1333, 708}
			aoc['城堡']['仓库文字']={ 0x3d5765, "0|-2|0xffffff,2|-5|0x3f5a66,2|-12|0x415c67,17|-5|0x405866,19|-5|0xffffff", 90, 597, 703, 921, 533}
		aoc['城堡']['主城建筑']={ 0xffffff, "-9|-2|0x716c59,-30|-2|0xd5c78b", 90, 0, 662, 1333, 720}
		--升级模块
		aoc['城堡']['主城升级提示']={{745,118,0xbaff00},{746,123,0xbaff00},}
		aoc['城堡']['主城升提示']={ 0xbaff00, "-15|0|0xbaff00,-21|0|0xb9ff01,-12|-3|0xbaff00", 90, 580, 90, 889, 145}
		aoc['城堡']['繁荣不足']={ 0xff4b4b, "", 90, 526, 432, 635, 484}
		aoc['城堡']['木材不足']={ 0xff4b4b, "", 90, 755, 432, 863, 478}
		aoc['城堡']['建筑提示']={ 0xf4d765, "11|0|0xf4d765", 90, 471, 51, 818, 213}
		aoc['城堡']['建造']={ 0x29681e, "-3|0|0x51d23e", 90, 469, 395, 943, 548}
		aoc['城堡']['建造资源不足']={ 0xfe4a4b, "", 90, 530, 353, 804, 487}
		aoc['城堡']['主城升级中']={ 0xc8ce94, "0|1|0x8eb285,93|1|0x92af86,98|2|0x418370", 90, 519, 103, 925, 349}
		aoc['城堡']['主城等待中']={ 0x071b1e, "0|1|0xd8c690,0|2|0x8fbf93,45|2|0x8ec097,107|2|0x93c28f", 90, 527, 149,913, 288}
		aoc['城堡']['进入主城']={ 0xf6ffd3, "-20|-28|0x306e20,-20|-31|0xfefefe,-20|-41|0x256322,-20|-50|0xf9f9f9", 90, 678, 407, 857, 641}
	
		
	aoc['城堡']['成功为会员']={{841,483,0x82ec42},{527,487,0x42c6b5},{517,448,0x10485a},}
	aoc['城堡']['邮件提醒']={{1283,682,0xeff0a3},{1312,663,0xe44013},}
		aoc['城堡']['邮件红点']={ 0xaa093a, "", 90, 1201, 74, 1327, 744}
	aoc['城堡']['商城红点']={{1284,28,0xa05a00},{1318,12,0xe74310},}
	aoc['城堡']['有任务奖励']={{70,678,0xd5ff1a},{102,659,0xc82327},}
	aoc['城堡']['英雄技能']={ 0xfde29c, "1|-12|0xce2c22,15|-13|0xf4d88f", 90, 74, 250, 222, 498}
	aoc['城堡']['技能提示']={{13,371,0x21a995},{21,281,0xd32f21},}
	aoc['城堡']['技能提示_爵位展开']={{250,372,0x20ad96},{44,134,0xeeed90},{46,217,0xe5df8a},}
		
	aoc['城堡']['资源合并']={{621,64,0x23887c},{621,61,0x43a197},{632,61,0x4f8e93},}
	aoc['城堡']['资源展开']={ 0xea43d5, "-202|-25|0xb2ffac,-413|-19|0xff3c41", 90, 322, 72, 908, 132}
	
		
aoc['地图']={}
aoc['地图']['金币图']={ 0xeadf70, "-7|16|0xeae776,-1|11|0xc68f34,10|18|0xc19336", 90, 118, 19, 1214, 729}
aoc['地图']['金币图2']={ 0xeae676, "4|0|0xeeeb7a,10|11|0xcf9228,-5|16|0xe9ef84", 90,  118, 19, 1214, 729}
aoc['地图']['金币图3']={ 0xc1e99f, "-7|17|0xbfe69c,9|12|0xb5ac69,10|15|0xafba6a", 90,  118, 19, 1214, 729}--浅蓝
	aoc['地图']['前往']={ 0x4ecf3e, "-3|0|0x27671f,-6|0|0xffffff,10|-6|0x216120", 90, 131, 9, 1214, 708}
	aoc['地图']['探索']={ 0x5bd740, "-6|-18|0x205e25,-24|-1|0xe9e677,-2|-22|0xffffff", 90, 287, 100, 1120, 647}
aoc['地图']['正在跑路']={ 0x98f4fc, "26|0|0x97e9e9,13|-9|0x6f8eff,13|8|0x6f8eff", 90, 216, 91, 1223, 711}
aoc['地图']['正在跑路小']={ 0x98f5fe, "2|0|0x6f8eff,11|-7|0x6f8eff,10|6|0x6f8eff", 80, 211, 83, 1120, 724}
	aoc['地图']['跑路错误']={ 0xfa0000, "0|3|0xe40000,3|3|0xe40000,-3|3|0xe40000", 90, 292, 113, 1087, 630}
	aoc['地图']['线路错误红色']={ 0xf66666, "22|-1|0xf66666,11|-9|0xf66666,11|-10|0xffc6c6", 90, 376, 187, 1073, 585}
aoc['地图']['城堡定位']={ 0x393a66, 
		"0|-3|0xe7e9f0,-15|12|0x383865,-14|12|0xacb4cb,14|11|0x383e5e,19|11|0xffffff", 90, 1, 2, 1322, 742}
		
aoc['战斗']={}
	aoc['战斗']['箭雨']={ 0xcc6e11, "12|-3|0xfffbd0,21|-6|0xd87c16,30|-6|0xffffd7", 80, 434, 566, 958, 748}
	aoc['战斗']['英勇跳跃']={ 0xd1390c, "39|-42|0xfffff5,39|-15|0xee6a38,43|-10|0xffffdc,40|8|0xdd5a07", 80, 467, 566, 842, 740}
	aoc['战斗']['攻击目标']={ 0xd3111a, "4|0|0xd3111a", 90, 242, 18, 1167, 588}
	aoc['战斗']['取消']={ 0xffffff, "-2|0|0x5d4218,0|-6|0xffffff,0|-15|0xb07326,0|22|0xefc03d", 90, 200, 481, 1300, 596}
	aoc['战斗']['取消2']={ 0x583f20, "0|-2|0x926020,2|6|0xffffff,8|31|0xf4c746,31|18|0x705517", 90, 200, 486, 1300, 588}
	aoc['战斗']['受伤英雄']={ 0xff4b4b, "18|9|0xfd4b4b,31|2|0xff4b4b,-31|-6|0x516373,62|9|0x667d91", 90, 792, 668, 1137, 693}
	aoc['战斗']['可以出战']={{1239,683,0x48c445},{1242,684,0x256322},{1246,685,0xffffff},}
	aoc['战斗']['不能战斗']={{1235,709,0x8ba9c5},{1239,707,0x445361},{1242,705,0xffffff},}

aoc['新手']={}
	aoc['新手']['怪红色']={ 0xfd582b, "", 75, 668, 375, 668, 375}
	aoc['新手']['兵绿色']={ 0x68c115, "", 75, 668, 375, 668, 375}

aoc['新手']['战斗界面中']={{63,13,0x2d6577},{46,34,0x194c46},{53,27,0x184242},{58,25,0xe9e68d},}
	aoc['新手']['战斗准备']={{559,27,0x00fee9},{741,23,0xff6f98},}
	aoc['新手']['寻找英雄']={ 0xffdd77, "39|-2|0xf6c244,16|-21|0xffdd77,19|21|0xfff9c2,29|15|0xe1b538", 80, 111, 3, 1318, 738}
	aoc['新手']['招兵确定']={{694,547,0x4bcfac},{603,513,0x2c9abd},{663,486,0x248eb2},}
	aoc['新手']['战斗胜利']={{883,720,0xaaf74d},{837,701,0x6be041},{825,658,0x3ead56},}
	aoc['新手']['英雄结算画面']={{678,721,0x49ceaf},{627,683,0x2598b9},{761,686,0x1876a4},}
	aoc['新手']['超出队伍']={ 0xff4c4c, "", 90, 1168, 500, 1315, 584}
	aoc['新手']['英雄升级']={{859,652,0xd07024},{961,656,0xd4791b},}
	aoc['新手']['招英雄确定']={{867,658,0x27a5bd},{867,689,0xd1fff6},{869,657,0x12515e},}
	aoc['新手']['招到英雄']={{624,108,0xfefecd},{627,111,0xaf924c},{632,115,0xfefabe},}

	aoc['新手']['任务绿']={ 0xd5ff1f, "-2|12|0xe3ff32", 90, 37, 667, 99, 714}
	aoc['新手']['任务']={{152,19,0xffffff},{153,21,0x0d141d},{191,34,0x0a111b},{193,34,0xffffff},}
		aoc['新手']['领取奖励']={ 0x4ece3f, "-4|0|0x276620,-6|0|0xf1f1f1", 90, 814, 101, 975, 709}
		aoc['新手']['找到目标']={ 0xa0b1aa, "-12|29|0x1f4553,0|9|0xa4b5b4", 80, 832, 105, 1004, 255}
		aoc['新手']['找到目标ios9']={ 0x9bada1, "0|-5|0x94a694,0|6|0xa0b1ab", 80, 832, 105, 1004, 255}
		aoc['新手']['任务激活']={ 0xffffee, "-1|18|0x152836,4|31|0xfefebd", 80, 832, 105, 1004, 255}
		aoc['新手']['任务未激活ios9']={ 0xfafbf3, "1|12|0xffffc7",80, 832, 105, 1004, 255 }
		aoc['新手']['世界地图']={{1265,697,0x174d55},{1257,697,0xf6f694},}
			aoc['新手']['前往']={ 0x96f446, "-1|-31|0x226121,-5|-41|0xffffff", 90, 396, 115, 1040, 719}
	aoc['新手']['地图']={ 0xdb0401, "0|5|0xffffff,1|19|0xf9da20", 90, 180, 664, 248, 732}
		aoc['新手']['黄色感叹号']={ 0xfffc0c, "0|13|0x383e5e,0|19|0xfffc0c,1|29|0xffcd07", 90, 283, 67, 1174, 641}
	aoc['新手']['城堡色']={ 0x683a31, "-16|1|0xfa8d5e,-14|-7|0xf78c5e", 90, 331, 178, 936, 527}	


aoc['other']={}
	aoc['other']['运送矿点']={{844,497,0x8aef43},{472,492,0x39bebd},}
	aoc['other']['拦劫']={{869,501,0x99f347},{504,493,0x3fc6b6},}
	aoc['other']['成功抢车']={{647,676,0x65df3d},{666,663,0x256520},{567,667,0xe6e4ed},}
	aoc['other']['取消战斗']={{946,533,0x9c1852},{835,593,0xe7c539},{515,592,0x3dc2b8},}
	aoc['other']['直接扫荡']={  0xd7ffff, "10|1|0x000fae,1|9|0x0314ba,37|1|0xffffff", 90, 347, 435, 636, 514}
	aoc['other']['不能直接扫荡_打']={{836,500,0x85ed42},{477,500,0x748da4},{956,221,0x0026ae},}
	aoc['other']['被点确认']={{616,554,0x2dadc1},{628,555,0x3d4362},{631,555,0xffffff},{634,555,0x484e6b},}
	aoc['other']['误攻城堡']={{1274,101,0x0d9639},{1275,80,0xf0e077},{1272,80,0xfefcf2},}
	aoc['other']['公会信息']={{616,75,0xffe200},{652,69,0xffe200},{683,71,0xfde000},{705,70,0xffe200},}
	aoc['other']['误点水泉']={{662,507,0x9af34a},{652,477,0xffffff},}
	aoc['other']['顶号']={{656,464,0xffffff},{667,467,0x26a1bd},}
	aoc['other']['聊天退出']={{29,28,0xe4d38a},{46,10,0xe4d38a},{46,45,0xe4d38a},}
	aoc['other']['暂停界面']={{622,257,0x299dbd},{623,377,0x2aa2bf},{688,526,0x50d3a5},}
	aoc['other']['选择国家界面']={{726,18,0x0a0c10},{726,17,0xffe200},{739,17,0x1a190d},{740,17,0xefd400},}
	aoc['other']['选国界面']={{1051,637,0x259cbc},{1041,637,0xffffff},{1038,637,0x184e5b},
										{1269,609,0x0a6f66},{1270,609,0xcae0df},}
	aoc['国家位置']={{135,247,0x3332ca},{265,176,0x851900},{485,216,0x18e8f0},
					{650,432,0xfcf55f},{316,454,0x7a3bc4},{141,350,0x76c800},}
	--1:深蓝(桑多瑞),2:橙色(葛雷),3:蓝色(利萨姆),4:黄色(达姆斯),5:紫色(莉维塔),6:绿色(夏亚)
	aoc['other']['开始旅程']={{936,609,0x7fea42},{1142,64,0xeec900},{1141,64,0x040612},{1135,64,0xffd800},}
	aoc['英雄位置']={{734,238,0x42292a},{944,232,0xc98052},{1171,233,0xf3bdb9},}
	--1:阿瓦隆,2:安德烈,3:爱微儿
	aoc['other']['启动画面']={{1001,273,0xf7ff91},{948,156,0x6b1c18},{143,48,0xda9545},{1089,133,0xdcd1a0},}
	aoc['other']['误打boss']={{1033,565,0x6e3e20},{1030,565,0xd97b40},{724,567,0x28a5bd},}--1,确认,3取消
	
	aoc['other']['预设未展开']={{1142,76,0x153f35},{1142,81,0xffffff},{1156,84,0x184134},{1156,95,0x429f73},}
	aoc['other']['预设展开']={{1143,95,0xffffff},{1145,86,0x1e4b3c},{1156,86,0x369170},}
		aoc['other']['可以战斗']={{1230,668,0x2caf58},{1234,668,0x2db057},}
		aoc['other']['恢复药']={{825,512,0x5ad83c},{725,512,0xb80003},{504,504,0x14535d},}
		aoc['other']['体力药']={{821,513,0x5cd83d},{725,513,0xfebb0c},{482,502,0x29a5be},}
	aoc['other']['学习技能']={{627,572,0xcc0a00},{623,576,0xffffff},{641,599,0x2b6a1e},}
	aoc['other']['空间已满']={{1137,617,0x3ecc51},{1137,633,0x3ecb49},{1137,686,0x41c94b},}
	aoc['other']['购买物品']={{679,577,0x92f245},{600,527,0xdfea77},}
	aoc['other']['购买3折稀有']={{691,539,0xffffff},{679,550,0x44c740},{604,543,0xf3dd28},{673,571,0x7dea41},}
	aoc['other']['战斗失败']={{845,599,0x85ed42},{490,599,0x40c6ba},{399,568,0xf5f3f5},}
	aoc['other']['死伤较重']={{852,706,0x7eea42},{865,689,0x28681e},{702,138,0xf4eb85},{719,136,0xe92807},}
	aoc['other']['研究会员']={{802,463,0x286c23},{800,463,0x4bca42},{496,463,0x27a6bf},}
	aoc['other']['误加公会']={{787,465,0x25505c},{767,475,0x2da1c0},{492,472,0x27a7be},{502,471,0xffffff},}
	aoc['other']['公会领取成功']={{669,602,0x3cc4ba},{674,578,0xfdfdfd},{676,579,0x12505e},}
	
	aoc['other']['触摸魔镜']={{898,518,0xa0f449},{895,460,0x35a754},}
	aoc['other']['魔镜好东西']={{653,528,0x31b6c0},{568,519,0xe7e2e8},{569,514,0x184560},}
	aoc['other']['得到配方']={{457,605,0x81eb43},{823,608,0x95f146},}
	aoc['other']['宝箱奖励']={{665,544,0x98f447},{577,511,0x45b552},}
	aoc['other']['国家发展宝箱-领取']={{671,565,0xa9f84c},{606,530,0x49c04b},{719,529,0x39bd3e},}
	
	aoc['other']['资源例表']={{709,140,0xf4d765}, {375,298,0xfe4546}, {608,307,0xb8fdb1}, {809,305,0x5e41dc}, }
	aoc['other']['绿色赠品']={{665,510,0x8cef44},{606,483,0x47bf4b},{744,485,0x32b83f},}
	aoc['other']['决战之颠']={{710,692,0x4ace3a},{1091,41,0xd22d0a},{806,45,0xd22d0a},}
	aoc['other']['打开礼物']={ 0xe9e0ef, "-1|-8|0x3b9346,32|0|0x4ac845,159|-21|0x14874b", 90, 690, 621, 897, 678}
	aoc['other']['捡到英雄']={{710,677,0x40c7b9}, {739,656,0x2299bb}, {636,652,0x2c92ba}, }
	
	aoc['other']['遗迹扫荡']={{469,480,0x29a9c1}, {826,501,0x85ec44}, {337,156,0xf2f294}, {334,150,0x0f5a5e}, }
	aoc['other']['遗迹扫荡_无卷']={{846,503,0x90f045}, {491,494,0x70899f}, {333,157,0xebea92}, }
	aoc['other']['战斗失败']={{847,596,0x7ce93f}, {495,598,0x3ec2b9}, {668,142,0x677591}, {662,139,0x828dab}, }

aoc['宝箱']={}
	aoc['宝箱']['未展开']={ 0x20ae95, "-7|0|0x49d0b7,0|2|0x1cb396", 90, 0, 350, 28, 398}
	aoc['宝箱']['展开']={  0x22aa96, "5|0|0x21aa95", 90, 229, 341, 262, 402}
	aoc['宝箱']['宝库']={ 0xfffffe, "5|-1|0xdedd8d,7|33|0x68614b", 90, 10, 265, 188, 337}
	
	aoc['宝箱']['开启10次']={ 0x3dc2bc, "4|-23|0xffffff,2|-23|0x13515e,-2|-23|0x26a2bd", 90, 964, 108, 1230, 400}
	aoc['宝箱']['开启1次']={ 0x3dc1b9, "10|-22|0xffffff,13|-22|0x104d5c,17|-22|0x219abb", 90, 1009, 104, 1203, 714}
	aoc['宝箱']['领取']={{657,600,0x81eb42},{714,567,0x155224},}
	
	aoc['宝箱']['天赋卡使用界面']={{720,171,0xfefefd},{38,28,0x394230},}
		aoc['宝箱']['选择左边英雄']={ 0xe54010, "-6|14|0xaf924c,-13|14|0xcbc899", 90, 63, 392, 1261, 550}
	


aoc['入盟']={}
	aoc['入盟']['聊天选项']={{954,692,0xeeec90},{1085,691,0x104147},{1161,697,0x154c54},{1280,681,0xe2e593},}--排行,联盟,世界,邮件

	aoc['返回']['公会']={{206,34,0xffffff},{206,33,0x181e26},{206,30,0xe7e7e7},{212,34,0xffffff},}
		aoc['返回']['搜索']={{1176,198,0xbcea15},{1181,304,0x518e26},{1184,406,0x529126},}	--2
			aoc['返回']['搜索激活']={{1176,197,0x4e8b26},{1180,301,0xb6e71a},{1179,405,0x4f8b26},}
		
	aoc['入盟']['加入']={{986,209,0x2c9dbd},{629,69,0xffe200},{682,71,0xfde000},{682,73,0x3c2615},}
		aoc['入盟']['改名']={{488,519,0x40c6ba},{811,519,0x89ed42},{631,202,0xffffff},}
		aoc['入盟']['入会成功']={{941,267,0xffecc9},{941,258,0xf47348},{988,244,0xda2e3f},}

aoc['声望']={}
	aoc['声望']['声望界面']={ 0xb41b04, "554|52|0xfacd04,761|-92|0xf2f294", 90, 95, 2, 1332, 268}
		aoc['声望']['未开奖励']={ 0x9f7015, "8|-17|0xff644b,32|-26|0xc21e2b", 90, 191, 587, 1336, 711}
		

--转国临时使用不做更新用
aoc['地图']['侧边']={{10,372,0x20ad96},}
aoc['地图']['王国']={0xf7f79a, "11|-6|0xf7f68f,65|0|0xffffff", 90, 11, 532, 155, 600}
aoc['返回']['转国界面']={{1280,168,0xb6e51b},{1280,268,0x539128},{1278,363,0x548f26},}
		--click(1236,39)--click(1216,443)
--取色列表
aoc['返回']['银翼之国桑多瑞']={{551,24,0x3633c3},{659,61,0x132078},{915,15,0x0b156a},}
aoc['返回']['纯白之帆利萨姆']={{557,33,0x0dffea},{689,25,0xffffff},{686,22,0x003745},}
aoc['地图']['移民按钮']={ 0xffffff, "-2|0|0x134d5c", 90, 827, 277, 946, 341}
--取色列表
aoc['other']['移民按钮']={{824,476,0x2bacbe},{448,473,0x2ba4bf},}

aoc['聊天']={}
	aoc['聊天']['聊天界面']={{29,31,0xe4d38a},{45,16,0xe4d38a},{44,48,0xe4d38a},{1239,28,0x14494d},}
	aoc['聊天']['聊天界面2']={{45,11,0xe4d38a},{45,27,0x14494d},{29,28,0xe4d38a},{40,46,0x14494d},}
	aoc['聊天']['聊天界面_世界频道']={ 0x8dd068, "18|-14|0xffffff,-53|48|0x8dd068,-49|-39|0x8dd068,-9|10|0x8dd068", 90, 6, 74, 151, 645}
	aoc['聊天']['聊天界面_世界频道_界面']={{30,27,0xe4d38a},{683,22,0xffffff},{1259,32,0xe4d38a},}
	aoc['聊天']['聊天界面_世界频道_界面_发言位置']={ 0x14494d, "-14|0|0x14494d,-8|0|0xf9f9f9,22|-1|0xf9f9f9,3|-20|0x14494d", 90, 3, 195, 128, 749}
	aoc['聊天']['聊天界面_世界频道_界面_发送']={ 0xffffff, "-15|-12|0x007aff,10|9|0x007aff", 90, 993, 677, 1183, 740}
	



--弹窗处理-----------
function other()
	yijicw = yijicw or 0

	if UI('other','运送矿点',true,1)then
	elseif UI('other','拦劫',true,1)then
	elseif UI('other','成功抢车',true,1)then
		return true
	elseif UI('other','取消战斗',true,3)then
		yijicw = yijicw + 1
		if yijicw%2 == 0 then
			click(560,151,2)		---点击银矿
		end
	elseif UI('other','误打boss',true,3)then
	elseif UI('other','被点确认',true,1)then
	elseif UI('other','误点水泉',true,1)then
	elseif UI('新手','招英雄确定',true,1)then
	elseif UI('other','误攻城堡',false,1)then
		click(40,40)
	elseif UI('other','误加公会',true,3)then
		click(40,40)
		click(h/2,w/2+50)
	elseif UI('other','公会信息',false,1)then
		click(40,40)
	elseif UI('other','顶号',false,1)then
		UI('other','顶号',true,1)
	elseif UI('other','聊天退出',true,1)then
	elseif UI('other','暂停界面',true,2)then
	elseif UI('other','死伤较重',true,1)then
	elseif UI('other','研究会员',true,3)then
	elseif setting[12] and UI('other','购买物品',true,1)then
	elseif setting[12] and UI('other','购买3折稀有',true,1)then
	elseif UI('other','学习技能',true,1)then
		click(40,40)
		click(276,236)
	elseif UI('other','公会领取成功',true,1)then
	elseif UI('other','战斗失败',false,1)then
		zdsb = zdsb or 1
		zdsb = zdsb + 1
		UI('other','战斗失败',true,zdsb%2+1)
	elseif UI('other','遗迹扫荡',true,1)then
		UI('other','遗迹扫荡',true,2)
	elseif UI('新手','英雄升级',true,1)then
	elseif UI('other','遗迹扫荡_无卷',true,1)then
	elseif UI('新手','英雄结算画面',true,1)then
	elseif UI('新手','战斗胜利',true,1)then
	elseif UI('other','触摸魔镜',true,1)then	
	elseif UI('other','魔镜好东西',true,1)then
	elseif UI('other','得到配方',true,1)then	
	elseif UI('other','宝箱奖励',true,1)then	
	elseif UI('other','国家发展宝箱-领取',true,1)then
	elseif UI_pic('other','打开礼物',true)then
	elseif UI('other','选择国家界面')then
		国家选择 = tonumber(values.world)+1
		click(aoc['国家位置'][国家选择][1],aoc['国家位置'][国家选择][2])
		UI('other','选国界面',true,1)
	elseif UI('other','开始旅程',false,2)then
		英雄选择 = tonumber(values.hero)+1
		click(aoc['英雄位置'][英雄选择][1],aoc['英雄位置'][英雄选择][2])
		UI('other','开始旅程',true,1)
		delay(8)
	elseif UI('新手','招兵确定',true,1)then
	elseif UI_pic('宝箱','展开',true)then
	elseif UI('other','绿色赠品',true,1)then
	elseif UI('other','捡到英雄',true,1)then
	elseif UI('other','启动画面',false,1)then
		启动画面 = 启动画面 or 1
		启动画面 = 启动画面 + 1
		if 启动画面 > 30 then
			closeX(app)
			启动画面 = 0
		end
	else
		other_click_mun = other_click_mun  or 1
		other_click_mun = other_click_mun + 1
		if other_click_mun%10 ==0 then
			click(h/2,w/2)
		else
			click(40,40)
		end
	end
	
end

function awz_re_name(txt)
	if values.oneormore == '0' then
		if setting[16] then
			reName(getOnlineName()..'/'..txt)
		else
			reName(txt)
		end
	end
end



aoc['造兵']={}
aoc['造兵']['兵好']={ 0x175c62, "", 90, 1067, 305, 1180, 384}
aoc['造兵']['收兵位置']={
	{ 1085, 313,1153, 370},
	{ 980, 424, 1052, 480},
	{ 847, 491, 918, 545},
	{ 729, 531, 803, 587},
	{ 612, 542, 696, 606}
	}
兵营位置={
	[5]={760,646,0x0e367f},
	[6]={648,666,0x143c6f},
	[7]={883,594,0xa1a8a5},
	[8]={1010,557,0x345e99},
	[9]={1127,426,0x301e13},
	}


aoc['返回']['医院']={{1049,590,0xf1ab35},{669,115,0xf4fff6},}
	aoc['返回']['医院空']={{209,169,0x07182e},{255,172,0x07192e},}
	aoc['返回']['医院满队']={ 0xff4b4b, "", 90, 436, 405, 562, 442}
aoc['返回']['兵营界面']={{1038,601,0xbd7982},{1029,635,0xfcca2b},}	
	aoc['返回']['兵营满队']={ 0xff0000, "", 90, 414, 437, 543, 472}
	aoc['返回']['军队已满']={ 0x21fe9e, "", 90, 446, 377, 869, 437}
	
	aoc['返回']['军队可升级']={ 0xa5c29b, "2|0|0x183211,5|0|0x2b601e", 90, 1119, 349, 1172, 371}
	aoc['返回']['军队升级按钮']={{980,615,0x53db8c},{971,574,0xffffff},{1006,558,0x0c4743},}
	
aoc['返回']['研究院']={{609,146,0xfffdff},{688,667,0xfcfbfd},}
	aoc['返回']['研究空']={ 0xffffff, "0|-6|0x071e34,-19|39|0xffffff,24|33|0xfafefe", 90, 315, 201, 1237, 372}
	aoc['返回']['研究蓝']={ 0xffffff, "-1|-5|0x0baedf,-27|15|0xfdffff,-19|40|0xffffff", 90, 315, 201, 1237, 372}
	aoc['返回']['研究']={{830,511,0x56d53d},{495,505,0x29a5bd},}
	aoc['返回']['加入研究院']={{846,532,0x9bf348},{522,526,0x3dc3b9},}
	aoc['返回']['研究完成']={ 0x80ff15, "0|4|0xffff84", 90, 643, 149, 758, 246}

研究院位置 = { 734, 305 }
科技位置={
	[0]={188,401},
	[1]={440,400},
	[2]={686,402},
	[3]={933,406},
	[4]={1178,414},
	[5]={1153,421},
}

aoc['返回']['战争学院界面']={{1260,18,0x1a444f},{1253,24,0xf0f092},{1249,25,0x1a3935},}
	aoc['other']['战争学院胜利']={{663,710,0x8df043},{567,669,0xf7f7f9},{567,660,0x47ac5f},}
	aoc['返回']['战争攻击']={{1152,677,0xda7e3f},}
	aoc['返回']['战争打完']={{1143,690,0x110c15},{1195,691,0x100d15},}
	aoc['返回']['下一章']={{1295,345,0x737b7f},{1296,418,0xdfdf9c},}
	aoc['other']['战力不足']={{839,473,0x27a8bf},{841,473,0x14535e},{522,481,0x3f6935},{521,481,0xffffff},}
	

			

--awzNew()
--reName(newName)
轮回 = 0
主线 = tonumber(values.game_main)
iphonename = getDeviceName()
imei = sz.system.serialnumber()
awz_mun,idfa = getTrueName_awz()

while (true) do
	log(主线)
	if 主线 == 0 then		--创号
		if getAllmun() < tonumber(values.game_mun)+1 then
			if awzNew()then
				if new_account()then
					awz_re_name('创建完成')
				end
			end
		else
			toast("创号完成", 2)
			主线 = 主线 + 1
			轮回 = 0
		end
	elseif 主线 == 1 then		--换服
		if service()then
			awz_re_name('换服成功')
		end
	elseif 主线 == 2 then		--新手
		if newplay()then
			awz_re_name('过完新手')
		else
			awz_re_name('过完超时')
		end
	elseif 主线 == 3 then		--礼包
		if gift()then
			awz_re_name('领券成功')
		else
			awz_re_name('领券超时')
		end
	elseif 主线 == 4 then		--升城
		if city()then
			awz_re_name('-需要会员')
		else
			awz_re_name('-木材不足')
		end
	elseif 主线 == 5 then		--开图
		if map() then
			awz_re_name('-开地图')
		else
			awz_re_name('-开图超时')
		end
	elseif 主线 == 6 then		--主线
		city()
		auto_get()
		awz_re_name('主线轮回')
	elseif 主线 == 7 then		--采矿
		采矿数量 = 0
		city()
		auto_get()
		awz_re_name('矿('..采矿数量)
	elseif 主线 == 8 then		--遗迹 
		if auto_fire()then
			awz_re_name('-遗迹')
		end
	elseif 主线 == 9 then		--遗迹 
		auto_get()
		awz_re_name('矿>'..采矿数量)
	elseif 主线 == 10 then		--劫车
		战争学院()
		awz_re_name('战争学院')
	elseif 主线 == 11 then		--清理
		清理()
		dialog('清理完成', 0)
		lua_exit()
	elseif 主线 == 12 then		--辅助打野
		help()
	elseif 主线 == 13 then		--造兵
		arm()
		awz_re_name('-造兵')
	elseif 主线 == 14 then		--全部
		if auto_all()then
			awz_re_name('-清理任务')
		end	
	elseif 主线 == 15 then		--全部
		if ad()then
			awz_re_name('广告成功')
		else
			awz_re_name('广告超时')
		end
	end
	
	if values.oneormore == '1' then
		log('单机版')
	else
		轮回 = 轮回 + 1
		delay(2)
		if 主线 ~= 0 then
			awz_next()
			awz_mun,idfa = getTrueName_awz()
		end
		toast(轮回,1)
		delay(2)
	end
	
	清理()
end











































































