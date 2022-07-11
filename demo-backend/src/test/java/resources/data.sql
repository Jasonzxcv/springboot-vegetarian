use vegandb;

-- USER
INSERT INTO `user` ( email, password, userName, status, userPic, registerTime, lastLoginTime) VALUES
('a1kgkms11@gmail.com', '$2a$10$O969pkOXv/LwhDAgvZR/iuI62clH0djrmL8WGtgCTKLdG9XZFbBMW', '呱呱', '正常', 'a010', curdate(), now())
,('nsdk8853@gmail.com', '$2a$10$l0hfgZQLrYGOVRGL8vMqi.hqc64TmRJrSC.V88UrdJtsri9RkR9f6', 'guagua', '正常', 'a010', curdate(), now())
,('nsdf1h32@gmail.com', '$2a$10$uGR2IkaiC.RZsOZtoY7M7ugGapiiwOkFCSEigkix2aSN.u6b1UnWy', 'Jason', '正常', 'a010', curdate(), now())
,('dsddmlm093@gmail.com', '$2a$10$1eCToqRxiCzgsoJoBp8Y..RO4wkwwFOd90nH1PkhGBGBeBl4BFonO', 'John', '正常', 'a010', curdate(), now())
,('sdsdk457@gmail.com', '$2a$10$6oYKJpvvwFkoJxZOi0ogOO4ta1.gds9vP4FlIzMnnK2H.LM5GcAhK', 'David', '正常', 'a010', curdate(), now())
,('dnfjn003@gmail.com', '$2a$10$1N2w5TMU0OOjSB.9kVhb8OQKAZ726.AgyktmxoQnjdrtCkrQ31ziC', 'Jack', '正常', 'a010', curdate(), now())
,('dsnjd25@gmail.com', '$2a$10$DKayHEMjcXVdN1E4jgn7SeesC/ZdJgHZzBzVficD.jyvszCBMd9Sq', 'Anthony', '正常', 'a010', curdate(), now())
,('dkopm023@gmail.com', '$2a$10$8Y6fTr2MiNEH0hwH/wQC1ewCe/i3BUki3NAqCNm/SpQVENtjeY722', 'Michael', '正常', 'a010', curdate(), now())
,('vmdns23@gmail.com', '$2a$10$kmbp2jSux5GWTt7UMeRHge2UaInt6UjQTmSl5nO.Ir6jdRV5hhu6y', '傑森', '正常', 'a010', curdate(), now())
,('fdnfl983@gmail.com', '$2a$10$0RS4K7T9d84dlIY8J7wd3.1L/WFFtQzjMEOKeHmnxWAg93Mv9lFyC', '約翰', '正常', 'a010', curdate(), now())
,('sdj4498@gmail.com', '$2a$10$fKJ.DT6U2lx.dpiAE.6nUedlCWvEkyPFKjeFJ1ioWnLE/uwMJ0xaK', '大衛', '正常', 'a010', curdate(), now())
,('sdsndj12@gmail.com', '$2a$10$r8P1P1pM4.SwzqoCS6ZYWujqbuvku7B98k.iRpEpyJxhl7.ZnnKxq', '傑克', '正常', 'a010', curdate(), now())
,('fdfnkn9@gmail.com', '$2a$10$VdMO7903g7YrTrdI.B4N7.iXJtAflnZTRe08hqSi4pBlJjKdaIYo2', '安東尼', '正常', 'a010', curdate(), now())
,('dkd93@gmail.com', '$2a$10$dAXsizGzNbj2lvUqDyGqTuS1fuKGsAEOwFY/eZ1O1PMWbO2ayk4Wy', '麥可', '正常', 'a010', curdate(), now());

-- business
INSERT INTO business ( email, password,principalName,principalPhone, businessName,located, status, businessPic, createdTime, lastLoginTime, updateTime) VALUES
('delisoys@gmail.com', 'Aa123456','嚴心鏞','0912345678', '善果餐飲集團','台北市中山區','試用中', 'b@01', now(), now() ,now())
,('xiaoxiao@gmail.com', 'Bb123456','劉千瑞','0938978938', '航博瑞樸股份有限公司','台北市大安區' ,'開通中', 'b@02', now(), now(),now())
,('hanlie@gmail.com', 'Cc123456','賴宗成','(07)213-5788', '漢來美食股份有限公司','高雄市前金區','開通中', 'b@03', now(), now(),now())
,('miacucina@gmail.com', 'Dd123456','劉人銘','02-8866-2679', '佐上椿有限公司','台北市內湖區', '未審核', 'b@04', now(), now(),now())
,('vegecreek@gmail.com', 'Ee123456','許淞堡','02-26626766', '蔬河有限公司','台北市文山區', '未審核', 'b@05', now(), now(),now())
,('urban@gmail.com', 'Ff123456','吳逸如','02 8773 7033','二本餐飲股份有限公司','台北市大安區', '未審核', 'b@06', now(), now(),now())
;
update business set password = MD5(password);

-- pos
INSERT INTO pos(businessId,validDate,expiryDate) VALUES
 (6,'未開通',NOW())
,(5,'未開通',NOW())
,(4,'未開通',NOW())
,(3,'開通中',NOW() + INTERVAL 6 MONTH)
,(2,'開通中',NOW() + INTERVAL 12 MONTH )
,(1,'試用期14日',NOW() + INTERVAL 14 DAY);

-- PosBusiness
INSERT INTO posBusiness(posId,businessId,visitors,turnOver,businessName) VALUES
(1,6,67842,100274896,'Larvata果子云數位科技')
,(2,5,249,298432,'亞惿股份有限公司')
,(3,4,367,367705,'墨宇網頁設計公司')
,(4,3,142,122450,'藝誠網頁設計公司')
,(5,2,2475,5379892,'馬亞科技iWare')
,(6,1,6487,12568,'艾格企業有限公司');

-- product
INSERT INTO product ( productName, category,veganCategory, productPrice,stock,productImage,createdTime,updatedTime ) VALUES
('《UFUMI》純素無麩質米圈圈 紫薯腰果口味~無麩質全素甜甜圈 Q軟口感超好吃！','生鮮','全素',360,3060,'https://media.fastretain.com/cdn-cgi/image/width=640,f=webp/media/magento/3/2/32pvnqi_-_imgur.jpg',now(),now())
,('《吾時吾客》燕麥抹茶拿鐵~抹茶的醇香 優雅的滋味','食品','全素',250,9920,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《UFUMI》純素無麩質米圈圈 黑芝麻口味~無麩質全素甜甜圈 濃濃黑芝麻香超好吃！','生鮮','全素',360,8143,'https://mall.suiis.com/img/10077/1007727l.jpg',now(),now())
,('《INAH 銀那》卡本內蘇維濃 橡木桶釀葡萄汁(無酒精紅酒)~清真認證 國際葡萄酒大賽非酒精類銅獎','生鮮','全素',780,6812,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《AMI 阿米》橘罐 素食狗罐頭(400g)~南瓜、地瓜口味','寵物','全素',200,1155,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《木酢達人》太陽洗衣精(附贈壓頭/1000g/瓶)~6倍濃縮 用量超省','居家百貨','VEGAN',450,1728,'https://purevegan.suiis.com/img/10056/1005607l.jpg',now(),now())
,('《淨覺茶》天然茶籽洗衣素(2.3KG)~ph值6.5微酸性安全配方 自然分解汙垢','居家百貨','VEGAN',450,142,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('設計師媽咪親手作‧可愛小女孩的日常＆外出服~設計師媽媽用愛製作的衣物','書籍影音','VEGAN',420,97,'https://purevegan.suiis.com/img/10056/1005607l.jpg',now(),now())
,('手作潮包日常提案:30個初學者也能完成的肩背包','書籍影音','VEGAN',450,65,'https://media.fastretain.com/cdn-cgi/image/width=640,f=webp/media/magento/7/b/7bc96bbf-b5ad-4878-923f-b92e99df1d14-4225-000003420732e366.jpg',now(),now())
,('【獨享包】《呷七碗》南瓜養生沖調-微鹹~中老年人的代餐養生聖品','食品','全素',28,56,'https://media.fastretain.com/cdn-cgi/image/width=640,f=webp/media/magento/b/j/bj107_-_500g.jpg',now(),now())
,('【獨享包】《逗留時光》堅果+厚豆奶(無加糖/20g/包)~醇濃多層次風味 搭配燕麥更香濃','食品','全素',25,54,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《Q-Link》純手工個性銀牌～著名設計師費德里科德Alzaga 阿根廷設計手工鍛造','飾品','VEGAN',12000,54,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('麥蘆卡蜂蜜 乳化活性20+(250g)~芬芳甘甜、濃醇蜜香','保健','全素',1640,54,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('麥蘆卡蜂蜜 乳化活性25+(250g)~芬芳甘甜、濃醇蜜香','保健','全素',1890,36,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《蓮廚》牛蒡大福丸(3KG)~新鮮牛蒡 風味獨特','生鮮','蛋素',690,44,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《蓮廚》香菇素排骨(3KG)~作為燉料、滷味、油炸鹽酥 魅力無法擋','生鮮','蛋素',690,36,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《《蓮廚》糖醋排骨(3KG)~酸酸甜甜超下飯 大人小孩都愛','生鮮','蛋素',690,28,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《蓮廚》蓮花菇(1.8KG)~大朵香菇 過癮口感','生鮮','蛋素',600,48,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《松珍》雞胸肉(3KG/袋)~運動後補充蛋白質！','生鮮','蛋奶素',770,45,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《松珍》素花枝揚(3KG/袋)~國民夜市小吃經典','生鮮','蛋奶素',910,12,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《自然緣素》鬆餅粉(1KG)~輕鬆DIY點心','量販批發','蛋奶素',200,68,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《松珍》頂級神戶牛排(3KG/袋)~香到隔壁鄰居都上門','生鮮','蛋奶素',1060,68,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《樂卉集》極淨 藍銅胜肽精華液(30ml)~高效保濕','美妝保養','VEGAN',1180,67,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('【Alteya】保加利亞原裝進口 奧圖玫瑰原萃花露(120ml/噴瓶)~頂級奧圖玫瑰 保持肌膚平衡','美妝保養','VEGAN',580,42,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now())
,('《潤覺茶 輕感淨化》茶樹茶籽綠茶潔顏慕斯(200ml)～清爽不緊繃 淨化控油效果佳','美妝保養','VEGAN',350,48,'https://media.etmall.com.tw/nximg/003516/3516565/3516565-1_xxl.jpg?t=18374630690',now(),now());

-- reserve
INSERT INTO reserve (reserveDateTime, adult,child,baby, reserveTime, restaurantId,businessId, userId) VALUES
 (now() , 2,3,1, '2022-07-12' ,10 ,1, 3)
,(now() , 3,0,0, '2022-08-12' ,11 ,1, 2)
,(now() , 4,2,0, '2022-08-02' ,11 ,1, 1)
,(now() , 5,3,0 ,'2022-08-02' ,11 ,1, 4)
,(now() , 11,2,0 ,'2022-08-09' ,10 ,2, 6)
,(now() , 9,4,2, '2022-07-16' ,2 ,2, 5)
,(now() , 8,4,1, '2022-07-19' ,2 ,2, 3)
,(now() , 6,3,3, '2022-07-21' ,2 ,3, 9)
,(now() , 8,2,3, '2022-07-26' ,3 ,4, 11)
,(now() , 4,0,3, '2022-08-12' ,3 ,3, 5)
,(now() , 3,2,0, '2022-08-01' ,3 ,2, 6)
,(now() , 14,3,0, '2022-08-02' ,10 ,2, 7)
,(now() , 2,2,0, '2022-08-04' ,10 ,1, 12)
,(now() , 2,2,0, '2022-08-06' ,4 ,1, 8)
,(now() , 3,0,0, '2022-08-09' ,4 ,2, 10)
,(now() , 4,0,0, '2022-08-09' ,4 ,2, 3)
,(now() , 26,0,0, '2022-08-12' ,10 ,3, 5)
,(now() , 15,0,0, '2022-08-12' ,6 ,4, 4);

-- order
INSERT INTO `order` (userId, payment, status, createdTime,updatedTime) VALUES
 (1, 4520,'未付款' , now(), now())
,(3, 1520,'訂單完成', now(), now())
,(6, 27390,'已出貨', now(), now())
,(5, 155100,'未付款' , now(), now());



-- order_item
INSERT INTO order_item (order_id, product_id, quantity, amount) VALUES
 (   1	,2	,5	,1000)
,(   1	,8	,6	,2520)
,(   1	,5	,5	,1000)
,(   2	,1	,2	,720)
,(   2	,5	,4	,800)
,(   3	,6	,3	,1350)
,(   3	,5	,12	,2400)
,(   3	,4	,2	,1560)
,(   3	,15 ,32	,22080)
,(   4	,5	,8	,1600)
,(   4	,2	,45	,112500)
,(   4	,13 ,25	,41000);


-- restaurant
insert into restaurant (restaurantName,restaurantTel,restaurantAddress,restaurantCategory,restaurantType,restaurantBusinessHours,restaurantScore,imageUrl,createdTime,updatedTime)
VALUES

('中平素食之家','03-4284290','桃園市中壢區新興路210號','中式','全素_奶素_蛋素','週一到週日
10:30–13:30
17:00–20:00
無休息','4.2','test.jpg',now(),now() ),

('九蓮素食','03-4378230','桃園市中壢區中山東路二段513號','中式','全素','週一到週二
11:00–13:30
16:30–19:30
週三休息
週四到週日
11:00–13:30
16:30–19:30','4.5','test.jpg',now(),now()),


 ('可米素食餐館','03-4368509','桃園市中壢區中山東路一段311號','中式','全素','週一休息
週二到週日
11:00 - 20:00','4.2','test.jpg',now(),now()),


 ('靜點咖啡','03-4620060','桃園市中壢區南園二路296巷50號','義式','全素_奶素_蛋素_含五辛','週一二休息
週三到週日
11:00 - 18:00','4.8','',now(),now()),


 ('義式美味素食','03-4553019','桃園市中壢區中華路一段616號','義式','全素','週一
06:00 - 13:00
週二休息
週三到週五
06:00 - 13:00
週六到週日
06:30 - 13:30','4.4','',now(),now()),


 ('得來素蔬食早午餐-中壢福州店','03-4351449','桃園市中壢區福州二街348號','義式','全素','週一
06:00 - 13:00
週二休息
週三到週五
06:00 - 13:00
週六到週日
06:30 - 13:30','4.4','',now(),now()),


 ('素怡園素食自助餐','03-4562163','桃園市中壢區大仁四街20號1樓','自助餐','全素','週一到週五
11:00 - 14:00
16:30 - 19:30
週六
11:00 - 14:00
週日休息','4.5','',now(),now()),


 ('廣田素食店','03-4910680','桃園市中壢區中央西路二段20號','自助餐','全素','週一到週六
10:30 - 14:00
16:30 - 19:00
週日休息','4.4','',now(),now()),


 ('綠野鮮蹤','03-4163090','桃園市中壢區弘揚路85號','自助餐','全素_奶素_蛋素','週一到週日
10:30–13:50
16:30–20:10
無休息','4.5','',now(),now()),


 ('新德素食','03-4936572','桃園市中壢區義民路1號','麵食','全素','週一到週六
10:30–13:30
17:00–19:30
週日休息','4.2','',now(),now()),


('文大叔蔬食麵線','02-25573337','台北市大同區民生西路169之2號','麵食','全素_奶素_蛋素','週一到週二
11:30–20:00
週三四休息
週五到週日
11:30–20:00','4.7','',now(),now()),


('普門茶品','02-86720599','新北市三峽區國際二街11號','中式','全素_蛋素','週二到週日
11:30–14:00
17:30–20:00
週一休息','4.3','',now(),now()),

('韓楓1080素食新潮流','03-5540899','新竹縣竹北市光明五街339號','韓式','全素_蛋素','週三到週日
12:00–14:00
17:00–21:00
週一二休息','4.1','',now(),now()),

('佛光素食館','03-7330699','苗栗縣苗栗市至公路598-15號','簡餐','全素_蛋素','週一到週二
11:30–13:30
17:00–19:30
週四到週日
11:30–13:30
17:00–19:30
週三休息','4.2','',now(),now()),

('江之島 蔬食丼飯','04-71176626','彰化縣彰化市延平路126號','日式','全素','週二到週日
11:30–14:00
17:00–20:30
週一休息','4.8','',now(),now()),


('舒邦印度蔬食餐廳','04-23023025','台中市西區向上路一段95-3號','印度','全素','週三到週一
11:00–14:30
17:00–21:00
週二休息','4.9','',now(),now()),

('蔬食趣','02-28322600','台北市士林區德行東路152號','簡餐','全素_奶素_蛋素','週三到週一
11:00–20:00
週二休息','4.7','',now(),now()),

('梅門六調通','03-25633838','台北市中山區林森北路107巷69號1樓','簡餐','全素','週二到週日
11:00–21:00
週一休息','4.6','',now(),now()),

('草蔬宴義式蔬食','02-37651616','台北市信義區忠孝東路四段553巷18號','美式','全素_奶素_蛋素','週一到週六
11:30–15:00
17:00–21:00
週二三四休息','4.5','',now(),now()),

('讓我想享','03-25794135','台北市松山區南京東路四段52巷8號','美式','全素_奶素','週二到週日
11:00–19:00
週一休息','4.9','',now(),now()),

('菊子日式蔬食','02-27773843','台北市中山區長安東路二段171-9號','日式','全素','週一到週六
11:30–14:00 
17:30–20:30
週日休息','4.4','',now(),now()),

('植日生手作蔬食','02-27484533','台北市松山區南京東路五段250巷11-6號','日式','全素','週二到週日
11:00–15:00 
17:00–20:30
週一休息','4.6','',now(),now()),

('郭家素食壽司','02-27265548','台北市信義區福德街219號','日式','全素_蛋素','週一到週日
06:00–12:00
無休息','4.1','',now(),now()),

('青靜緣','02-29360688','台北市文山區老泉街45巷2號','日式','全素','週二到週三
11:00–20:00
週五到週日
11:00–20:00
週一四休息','4.6','',now(),now()),

('采月居素食日本料理','02-26381529','台北市松山區南京東路五段250巷18弄2號','日式','全素_奶素_蛋素','週三到週日
11:30–14:00
17:00–20:00
週一二休息','4.7','',now(),now()),

('品·印度蔬食餐廳','02-27392799','台北市大安區和平東路三段34號','印度','全素_奶素','週二到週日
11:30–14:30
17:30–20:30
週一休息','4.6','',now(),now()),

('三個傻瓜印度蔬食-南京店','02-87705848','台北市中山區長春路318號','印度','全素','週一到週五
11:30–14:30
17:00–21:30
週六到週日
11:30–21:30
無休息','4.6','',now(),now()),

('誠食健康素食忠孝本店','02-27212388','台北市大安區忠孝東路四段216巷27弄6號','自助餐','全素_奶素_蛋素','週一到週日
11:00–14:15
17:00–20:00
無休息','4.5','',now(),now()),

('慈軒園素食','02-25700715','台北市松山區延吉街59號','自助餐','全素','週一到週六
11:00–14:00
17:00–20:00
週日休息','4.3','',now(),now()),

('東興素食自助餐廳','02-23050184','台北市萬華區萬大路486巷59弄3號','自助餐','全素_奶素','週一到週六
06:00–14:00
週日休息','4.6','',now(),now());


-- 食記文章
INSERT INTO post (title, postedDate, postedText, imgurl,postStatus,postCategory,postAuditDate) VALUES
('【新莊聚餐推薦】廣泰樓小館，港式小點、香酥芋頭鴨、蒜香脆皮雞必點',now(),'【廣泰樓小館】是提供粵式+港式小點的中餐廳，位在新莊區幸福路

特色餐點有 香酥芋頭鴨、蒜香脆皮雞、港式小點等人氣美食

開業大約一年多，裝潢很有質感，打破印象中傳統中餐廳的油膩、老舊感

有方桌和圓桌，適合2-14人的座位區，相當適合家庭、朋友聚餐

不想在店內用餐、也能外帶餐點回家喔~','p01','待審核','植物五辛素',now() )

,('【台北東區美食】熟菜豚屋 復興本店 超好吃韓式烤肉餐廳推薦！生菜免費續加吃到飽',now(), '   台北東區、捷運忠孝復興站這家《熟・菜豚屋》，絕對是我目前在台北吃過，最喜歡的高級韓式燒肉餐廳

將韓國烤肉結合創意料理，從前菜到溫菜、冷菜、海鮮、燒肉，甚至是甜點都非常夠水準，還有專人座上烤肉服務，不用自己動手烤

我們吃完《熟・菜豚屋》後，已經是逢人就推薦的喜歡，完全顛覆對韓式燒肉的想像，《熟・菜豚屋》怎麼可以這麼好吃啊！

熟・菜豚屋 復興本店

推薦指數：★★★★★　5顆星

一句短評：台北好吃高級韓式燒肉推薦！生菜可以無限續點吃到飽

 

《熟・菜豚屋》地址位在台北東區、復興南路巷弄內，較靠近市民大道那側

從捷運忠孝復興站出口出來，約步行400公尺，約5分鐘左右即可抵達；若是開車騎車前往的人，可以先在附近找找路邊停車位，亦有幾家收費停車場可停車

《熟・菜豚屋》是《菜豚屋》的新品牌，我以前吃過《菜豚屋》後就很喜歡

而《熟・菜豚屋》是主打個人套餐的高級韓式燒肉，從食材到服務、用餐環境全部大升級

裝潢空間非常有私人招待所的感覺，低調奢華氣氛營造相當好，無論情侶約會、節日慶生、商務聚餐都很適合

我們毫無疑問地一致給予《熟・菜豚屋》五星推薦，真的是讓人驚艷的好吃

沒有一道菜是不喜歡的，搭配專業又親切的服務、低調奢華的用餐空間，都加深了《熟・菜豚屋》的推薦指數

喜歡吃韓式燒肉、日本料理的人，拜託你一定要收藏《熟・菜豚屋》，找一天犒賞自己一下來吃吧！','p02','待審核','蛋素',now()),

('【桃園食記】漢來蔬食 超好吃推薦！不一樣的素食饗宴 台茂購物中心',now(),'家中有多位長輩茹素

一家人平常也很愛發掘新的素食餐廳

漢來蔬食二姑姑在高雄吃過後便讚不絕口

過年期間特地揪了全家二十來口，衝到桃園台茂品嚐！

漢來蔬食

推薦指數：★★★★☆　4顆星

一句短評：很不一樣的蔬食料理，素食也能吃得津津有味

此行造訪的漢來蔬食台茂店，位在台茂購物中心6樓

從台北開車過台，順暢的話約莫40分鐘就可抵達囉

桃園台茂停車辦法如下，提供給有停車需求的看倌參考

還沒看入場時間早已排滿了人

跟漢來海港吃到飽相比，人氣有過之而無不及

用餐環境整潔又乾淨，也有提供嬰兒座椅，很適合家族聚餐

如同一般港式飲茶店，分為幾種價位

小點$76、中點$96、大點$106、特點$136、頂點$156

其他比較特別的大菜，價格會特別標註在菜單上

需再加一成服務費，屬於中間偏高的價位

咱們一家人真得有夠會吃(咦)

根本就是把單點素食，當成吃到飽在點XD

但漢來蔬食的味道實在不錯，做工細緻同時融入創意構想

印象中每人算起來大概7、800元，屬於中高價位並不便宜

可是真得物有所值，打完食記後好想衝去桃園再吃一次啊' ,'p03','待審核','奶素',now()),

('【屏東市美食推薦】一碗豆腐 文青創新臭豆腐專賣店！菜單甜鹹口味都有素食也能吃',now(),'在發掘屏東美食小吃這件事上，我一直都是跟著在地人推薦吃

屏東田徑場旁的小店《一碗豆腐》，菜單上賣的是創新口味炸豆腐料理，除了招牌臭豆腐外，還有加了芝麻粉的玄玉豆腐、抹茶紅豆的青玉豆腐，讓人好奇炸豆腐做成甜點會是什麼滋味

《一碗豆腐》小小一間路邊攤位，大熱天的平日下午居然坐滿了人，如果不是真的好吃，生意怎能一直這麼好呢

一碗豆腐

推薦指數：★★★★☆　4顆星

一句短評：屏東市臭豆腐推薦，炸豆腐甜點風味更是叫人驚艷

《一碗豆腐》位在屏東市濟南街，屏東縣市田徑場、中山公園運動場旁邊

距離屏東火車站大約1.2公里，步行時間約15分鐘，懶得走的人也能騎Pbike過來

整體來說，我對《一碗豆腐》臭豆腐的喜愛度更勝口味獨特的玄玉豆腐

尤其是酸甜大根泡菜的好表現，把美味度又再往上提升，加點辣椒醬更是好吃極了，風味相當有特色

《一碗豆腐》營業時間從下午開始，一路賣到晚上10點，無論當成下午茶點心，或是宵夜都很不錯呢','p04','發布中','全素',now()),

('【新店大坪林美食】原粹蔬食作 菜單料理講究素食料理，特色飛龍頭咖哩、味噌豆漿拉麵',now(),'《原粹蔬食作》是新北市新店區、捷運大坪林站附近，人氣很高的素食餐廳

菜單設計跳脫以往素食思維，融合日本料理概念，飛龍頭咖哩、味噌豆漿拉麵、咖哩烏龍麵、飯糰、小火鍋等，看起來都蠻好吃的

即使平常不是素食者，都能接受的《原粹蔬食作》的料理，套餐可加飯加麵還附甜點，吃完相當飽呢


原粹蔬食作

推薦指數：★★★★☆　4顆星

一句短評：新店大坪林素食餐廳推薦，融合日式概念的創意素食料理

 

《原粹蔬食作》位在新店北新路巷弄內，這條是單行道

從捷運大坪林站4號出口出來，約步行2分鐘即可抵達，附近亦有不少公車可搭

若是開車、騎車前往的人，就得認真找停車位了，新店大坪林這帶實在太熱鬧，路邊停車沒那麼容易，或者多花點錢停收費停車場

《原粹蔬食作》之前再更靠近大馬路的位置，後來才搬家至目前新地址

內外裝潢設計蠻美的，白天光線充足時肯定又是不同感覺，現今餐廳美美的還是有加分

營業時間從午餐時段開始，下午茶不休息，一路賣到晚餐

雖然店內座位數不少，但還是建議大家先打電話訂位，或是粉絲團訊息也可預約

如果客滿有限制一個半小時的用餐時間，無人候位的話則是一家新店不限時餐廳

《原粹蔬食作》菜單如下，menu價格不用加收一成服務費

套餐價格落在249元-349元間，另有多道單點小品，看起來都蠻好吃的

菜單附照片圖文並茂，內含哪些餐點都寫得很清楚，雖然沒有飲料但有甜點

米飯湯品可續一次，麵食類也有提供事前加麵加湯服務，食量大的人記得在點餐時告知，吃完真的非常飽啊

《原粹蔬食作》的餐點調味都不會太重，對我們來說稍微清爽了些

但可以理解的是，講求品嚐食材原味的精神，讓素食料理吃來沒有太多負擔

在新店大坪林一帶想找家舒適的蔬食餐廳，我還是會推薦《原粹蔬食作》啦，畢竟套餐價格不貴，食材工法也有講究
','p05','待審核','蛋奶素',now()),

('【萬華西門町美食】從心茶館 守舊時尚中式早午餐！好吃素食飯糰、包子饅頭、鍋煮奶茶',now(),'位在萬華區、西門町商圈的《從心茶館》，是我們無意間發現的素食美食

以茶館作包裝，販售好吃的飯糰、包子饅頭、豆漿、費工奶茶、現泡茶、鍋煮鮮奶茶、鍋燒意麵，雖然是全素食但美味度可一點都沒打折

尤其是五彩經典飯糰裡那顆銷魂紅茶葉滷蛋，獲得我們一致推薦，光為了這顆滷蛋來《從心茶館》都行啊


從心茶館

推薦指數：★★★★☆　4顆星

一句短評：萬華西門町早餐推薦，好吃的手作飯糰還有特色鍋煮奶茶

 

《從心茶館》位在康定路上，公車站牌「祖師廟(康定)」旁邊

從捷運西門站、龍山寺站出口出來，均約是步行10分鐘的距離，這帶萬華還是自行開車、騎車前往較為方便

《從心茶館》早上七點就開門營業，平日賣到下午兩點、週末假日賣到下午四點

屬於一間萬華西門町早午餐店，如同店門上印的「守舊時尚的中式早午餐」，以茶樓重新定義早午餐

《從心茶館》菜單如下，價錢算是中價位，不能說很便宜

但我們吃完皆覺得物有所值，重點還是在於味道和食材，有下功夫仍願意讓客人多花點錢

飯糰、包子饅頭、全豆豆漿、費工奶茶、現泡茶、紫砂壺現泡茶、鍋煮鮮奶茶，和最新推出的鍋燒意麵

最特別的是茶飲是用職人方式現場沖煮，並非大量沖泡的桶裝供應，對應價格我覺得不算貴，老闆製程很用心呀

蔬菜香鬆、脆酸菜、烤牛蒡天婦羅、紅茶葉滷蛋、老油條、甜玉米

內餡包的滿滿滿，要邊吃邊捏才不會鬆散開來，用料實在對應價格便不覺得貴了

最好吃首推紅茶葉滷蛋，滷得夠味飄散著清新紅茶香，我們愛到相互搶食這顆蛋，不知道可不可以加價「增蛋」啊

烤牛蒡天婦羅味道也很棒，我平常沒有很愛酸菜，但《從心茶館》的酸菜不會臭，完全吃得出老闆選用好的原物料，飯糰真的好好吃
','p06','待審核','蛋奶素',now()),

('【台東池上美食】舒食男孩二號店 臺東慢食評鑑二星推薦！在地食材無菜單素食料理',now(),'私以為台東美食最迷人之處，在於大量在地食材的應用

宜人氣候下種出的稻米、蔬菜水果，無需華麗功法、過度調味，食材原味直球對決就很好吃了

《舒食男孩二號店》是台東池上火車站附近，人氣相當高的素食餐廳，無菜單料理每人380元，從沙拉到甜點都叫人滿意，十分推薦

舒食男孩二號店

推薦指數：★★★★★　5顆星

一句短評：台東池上火車站附近美食推薦，在地食材製作的好吃素食

 

《舒食男孩》原本開在關山，二號店為分店

但現在已合併經營，所以要吃到美味素食，只能來《舒食男孩二號店》這間

距離池上火車站步行約5分鐘路程，附近最知名的台東景點為《伯朗大道》、《金城武樹》

騎腳踏車旅行之前、之後，都能至《舒食男孩二號店》吃午餐、晚餐；離我們這次住宿的《青庭民宿》，也是走路可到的距離

《舒食男孩二號店》一定要開在台東，才會這麼好吃

新鮮直送的蔬菜水果，搭配宜人氣候、池上悠閒，讓人能好好靜下心來品味舒食料理，感謝大自然的恩惠

若來到《伯朗大道》騎腳踏車，不妨來《舒食男孩二號店》吃個飯，即使是葷食者也會喜歡的舒食美食','p07','未通過','奶素',now()),

('【台北食記】御蓮齋 素食吃到飽buffet推薦！多達200道料理，素食外燴婚宴一應俱全',now(),'
素食飲食已經變成一股時代趨勢

就算不是因為宗教信仰，許多國內外名人基於身體健康、環保愛地球也開始吃素囉

雖然說周花花不是一個素食主義者，不可否認的，吃素食蔬食的好處非常多呢

《御蓮齋》的前身為《蓮齋香》，一直都是台北素食吃到飽界的指標

主廚藉由精湛手藝，將素食搖身一變成為多樣化異國美食，就算是葷食者也會一吃愛上，太讓人驚艷了啦！


御蓮齋-素食婚宴外燴推薦

推薦指數：★★★★☆ 4顆星

一句短評：台北素食吃到飽推薦！菜色豐富適合家族聚餐，想吃什麼隨你拿

 

《御蓮齋》位在南京東路五段，捷運南京三民站2號出口一出來就是了，交通超級無敵方便

雖然在B1地下室，但在大樓外就有顯眼招牌，不用擔心找不到入口啦

新鮮直送的蔬菜水果，搭配宜人氣候、池上悠閒，讓人能好好靜下心來品味舒食料理，感謝大自然的恩惠

若來到《伯朗大道》騎腳踏車，不妨來《舒食男孩二號店》吃個飯，即使是葷食者也會喜歡的舒食美食

看完這篇食記是不是瞬間餓了呢？

雖然是受邀參加記者會活動，但我當場就決定下次家族聚餐要訂在這，菜色太豐富而且很好吃耶！

絕對是我目前在台北吃過，最喜歡的素食自助餐吃到飽，推薦給大家啦！

最後提醒大家，文章內看到的素食餐點，都可以再向《御蓮齋》詢問，是否提供外燴服務

想訂購素食外燴的人，也請記得先打電話確認，以免撲空唷','p08','未通過','植物五辛素',now());

-- forum

INSERT INTO forum (forumId, forumTitle, forumContent, forumCategory ,forumCreateTime, forumUpdateTime) VALUES ('1', '台灣茶吸管 100% 可自然分解', '我們致力於維護人類身體健康、保護環境降低污染的使命，盡心鑽研生物可分解、天然植物纖維的材質，取自大地回歸自然循環；取材農產廢棄回收再利用，融合成為閃耀的新星材料!! 我們傾心鑽研，如何使用最天然的物料，發現植物澱粉與纖維便是我們最好的來源，可食用性的植物經技術轉換型態，成為日常用品！茶吸管 本身就是食物，轉變成用來飲食的工具，當然也再健康不過了。 帶來方便，不需習慣其他任何的飲食習慣、工具，又可以為自己的健康保障，甚至保護你以為遙不可及的環境。 總以為保護環境離自己好遠，但其實只是換個身邊常常在使用的日常用品，就可以做到如此之多。','環保', '2022-01-14', '2022-02-10');

INSERT INTO forum (forumId, forumTitle, forumContent, forumCategory ,forumCreateTime, forumUpdateTime) VALUES ('2', '少吃肉更長壽 醫師：這3種植物有完全蛋白質', '2020年美國醫學會雜誌(JAMA)研究發現，在飲食中把20%吃肉的蛋白質轉為吃植物性的蛋白質，能夠降低10%死亡率和心血管疾病致死率，少吃點肉真的能長壽！對此有醫師提醒，如果想要吃植物性蛋白增肌減脂，選擇也要正確，在植物性蛋白中，只有大豆蛋白，毛豆和黑豆是完全蛋白。

三樹金鶯診所體重管理主治醫師蕭捷健在臉書粉專「減重醫師 蕭捷健」發文指出，用蛋白質來取代澱粉，對身體有諸多好處，不過很多人會選擇吃很多的動物性蛋白質，事實上，大家應該要多吃的是植物性蛋白。

蕭捷健表示，根據美國醫學會雜誌 （JAMA）在2020年發表了一篇花了16年，追蹤41萬人所做出來的世代研究，發現：以20%的植物性蛋白取代動物蛋白，就可以降低10%的總死亡率和心血管疾病致死率。
尤其以植物性蛋白取代紅肉，男性的總死亡率下降3%，女性下降15%；以植物性蛋白取代雞蛋，男性的總死亡率下降24%，女性下降21%。用植物性蛋白取代白肉，對死亡率則是沒有影響。看來，雞蛋還是不能多吃啊。','養身', '2022-01-14', '2022-02-10');

INSERT INTO forum (forumId, forumTitle, forumContent, forumCategory ,forumCreateTime, forumUpdateTime) VALUES ('3', '愛心素食分享公益活動', '正德社福文教機構創辦人常律法師於全國各地廣設愛心廚房，自105年8月起，已設立22家愛心廚房，讓弱勢民眾及街友免費享用素食餐點，受到各業界的肯定與支持。
正德竹北分院附設愛心廚房日前舉辦一場「愛心素食分享公益活動」，由協辦單位公益團體暨活動報導平台邀請素食小夜市知名素食餐車「張張蔬食大阪燒」及 「凰阿ㄚ瑪蔬食本舖」2位老闆前來愛心廚房備餐，料理美味的「創意大阪燒」及「素食松露沙爹」分享給食客，另外，新竹縣銀髮族協會成員也一同與愛心廚房將民眾捐贈物資分送給食客。
來自台中北屯的「張張蔬食大阪燒」老闆張姐表示，能來愛心廚房幫助有需要的朋友很開心；而位於竹北的「凰阿ㄚ瑪蔬食本舖」郭老闆回憶說道，和正德竹北分院其實有一段淵源，幾年前在找工作時曾經來正德應徵，當時看到正德持續不斷幫助弱勢，覺得非常佩服，也期許有機會一定要用自己拿手的餐點來協助更多食客，他非常感謝正德給予機會服務大眾。
愛心廚房自成立以來，即提供乾淨明亮的用餐空間，廣受各界的好評與讚賞，讓弱勢民眾及街友免費享用素食餐點，除了減少社會經濟問題也解決飢民用餐問題。','公益', '2022-01-14', '2022-02-10');

INSERT INTO forum (forumId, forumTitle, forumContent, forumCategory ,forumCreateTime, forumUpdateTime) VALUES ('4', '素食者的飲食規劃與注意事項', '維生素B12只存在於動物性食物（包含蛋、與奶），嚴格素食者（不吃蛋、奶者）必須補充維生素B12，尤其是素食的懷孕女性、以及產後餵哺母乳的素食女性，補充維生素B12是必須的。因為嬰幼兒若缺乏維生素B12，會導致永久性的神經組織損傷。

素食者必須攝取較多比例的豆類（富含植物性蛋白質）食物，而且需要遵循「少油、少鹽、少糖」的原則，同時，即使是有益健康的食物，也不可吃過多，要以體重來控制攝食的熱量，才不會造成體重過重與肥胖。

麵包是許多婦女的最愛，但市購的麵包常是高油、高鹽，有些含糖量還很高，當然不利於健康。現在有許多「製麵包機」的品牌，喜歡吃麵包的婦女，可以利用「製麵包機」自己做麵包，但記得要「少油、少鹽、少糖」，才能吃得健康。','健康', '2022-01-14', '2022-02-10');

INSERT INTO forum (forumId, forumTitle, forumContent, forumCategory ,forumCreateTime, forumUpdateTime) VALUES ('5', '吃素= 環保？真正堅持的意義與本質', '近年來，考慮養生、環保意識而選擇吃素的人變多了，然而吃素就確定真的比吃肉還環保嗎？以下分享兩則我親身在生活中體驗的例子。以前我特愛一家素食店的南瓜湯麵，在冷颼颼地冬天，來一碗澄黃色澤、噴發熱氣的南瓜湯麵，特別令人感覺幸福，我幾乎每天都帶著幸福的心情去報到，直到有一天老闆見我吃得正馨香找我聊天，言語間卻充滿了對非素者的道德批評：
「你知道我為什麼要開這間店嗎 ? 就是為了拯救你們這些不環保的非素者。」

「你們就是不知道愛地球 ! 都不懂得吃素。」

「動物好可憐喔你還要吃它嗎？怎麼這麼沒有同理心？」
部分吃素人士缺少同理心的硬性說服，也讓我回想起自己以前的文章《關於情緒｜靈性的逃避、虛榮與自我欺騙》，裡頭提到某些人對自身定義的環保方式執著，並且會大肆抨擊與批評不環保的人。令人奇怪的是，為何對動物的同理心卻無法發揮至自己的同胞身上呢?每人的生命經驗都不相同，也因為經驗不同而有不同的選擇理由，而生命轉折的時間點也不相同，強迫式地說服只會造成別人的反感，因而更加不願意與之親近，更遑論接受。部分人士甚至會將吃素跟環保、宗教限制、或是可交換福報等等自我安慰因素綁在一起。過於簡單的邏輯將「吃素=救地球」綁在一起，卻看不到其他因素的可能。','環保', '2022-01-14', '2022-02-10');
