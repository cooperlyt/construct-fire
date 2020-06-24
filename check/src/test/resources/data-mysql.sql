

USE CONSTRUCT;

INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (2,'建筑类别与耐火等级、总平面布局、平面布置验收检查记录',2,false);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (3,'建筑保温和外墙装饰、建筑内部装修验收检查记录',3,true);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (4,'防火分隔、防烟分隔、防爆验收检查记录',4,true);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (5,'安全疏散、消防电梯验收检查记录',5,true);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (6,'消火栓系统检查记录',6,true);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (7,'自动喷水灭火系统检查记录',7,true);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (8,'火灾自动报警系统验收检查记录',8, true);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (9,'防烟排烟系统及通风、空调系统防火验收检查记录',9, true);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (10,'消防电气验收检查记录',10, false);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (11,'建筑灭火器验收检查记录',11, true);
INSERT DFCT (ID,NAME,_ORDER,PART ) VALUE  (12,'其他灭火设施验收检查记录',12,true);
-- A2
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (1,'建筑类别与耐火等级',1,2);
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (2,'总平面布局',2,2);
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (3,'平面布置',3,2);
-- A3
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (4,'建筑保温及外墙装饰防火',4,3);
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (5,'建筑内部装修防火',5,3);
-- A4
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (6,'防火分隔',6,4);
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (7,'防烟分隔',7,4);
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (8,'防爆',8,4);

-- A5
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (9,'安全疏散',9,5);
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (10,'消防电梯',10,5);


-- A6
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (11,'消火栓系统',11,6);

-- A7
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (12,'自动喷水灭火系统',12,7);
-- A8
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (13,'火灾自动报警系统',13,8);
-- A9
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (14,'防烟排烟系统及通风、空调系统防火',14,9);

-- A10
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (15,'消防电气',15,10);


-- A11
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (16,'建筑灭火器',16,11);

-- A12
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (17,'泡沫灭火系统',17,12);
INSERT DFCC (ID,NAME, _ORDER, TABLE_ID) VALUE (18,'气体灭火系统',18,12);



-- A2 DFCC-ID-1 建筑类别与耐火等级
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (1,1,'建筑类别',1);
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (2,2,'耐火等级',1);
-- A2 DFCC-ID-2 总平面布局
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (3,3,'防火间距',2);
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (4,4,'消防车道',2);
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (5,5,'消防车登高面',2);
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (6,6,'消防车登高操作场地',2);
-- A2 DFCC-ID-3 平面布置
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (7,7,'消防控制室',3);
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (8,8,'消防水泵房',3);
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (9,9,'民用建筑中其他特殊场所',3);
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (10,10,'工业建筑中其他特殊场所',3);


-- A3 DFCC-ID-4 建筑保温及外墙装饰防火
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (11,11,'建筑外墙和屋面保温',4);
INSERT DFCI(ID,_ORDER,NAME,ITEM_ID) VALUE (12,12,'建筑外墙装饰',4);

-- A3 DFCC-ID-5 建筑内部装修防火
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (13,13,5,'装修情况');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (14,14,5,'纺织织物');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (15,15,5,'木质材料');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (16,16,5,'高分子合成材料');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (17,17,5,'复合材料');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (18,18,5,'其他材料');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (19,19,5,'电气安装与装修');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (20,20,5,'对消防设施影响');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (21,20,5,'对疏散设施影响');

-- A4 DFCC-ID-6 防火分隔
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (31,31,6,'防火分区');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (32,32,6,'防火墙');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (33,33,6,'防火卷帘');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (34,34,6,'防火门、窗');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (35,35,6,'竖向管道井');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (36,36,6,'其他有防火分隔要求的部位');


-- A4 DFCC-ID-7 防烟分隔
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (37,37,7,'防烟分区');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (38,38,7,'分隔设施');

-- A4 DFCC-ID-8 防爆
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (39,39,8,'爆炸危险场所（部位）');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (40,40,8,'泄压设施');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (41,41,8,'电气防爆');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (42,42,8,'防静电、防积聚、防流散等措施');

-- A5 DFCC-ID-9 安全疏散
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (51,51,9,'安全出口');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (52,52,9,'疏散门');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (53,53,9,'疏散走道');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (54,54,9,'避难层（间）');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (55,55,9,'消防应急照明和疏散指示标志');

-- A5 DFCC-ID-10 消防电梯
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (56,56,10,'消防电梯');

-- A6 DFCC-ID-11 消火栓系统
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (110,110,11,'供水水源');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (111,111,11,'消防水池');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (112,112,11,'消防水泵');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (113,113,11,'消防给水设备');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (114,114,11,'消防水箱');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (115,115,11,'管网');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (116,116,11,'室外消火栓及取水口');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (117,117,11,'室内消火栓');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (118,118,11,'水泵结合器');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (119,119,11,'系统功能');


-- A7  DFCC-ID-12 自动喷水灭火系统
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (60,60,12,'供水水源');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (61,61,12,'消防水池');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (62,62,12,'消防水泵');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (63,63,12,'气压给水设备');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (64,64,12,'消防水箱');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (65,65,12,'报警阀组');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (66,66,12,'管网');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (67,67,12,'喷头');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (68,68,12,'水泵结合器');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (69,69,12,'系统功能');

-- A8 DFCC-ID-13 火灾自动报警系统
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (70,70,13,'系统形式');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (71,71,13,'火灾探测器');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (72,72,13,'消防通讯');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (73,73,13,'布线');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (74,74,13,'应急广播及警报装置');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (75,75,13,'火灾报警控制器、联动设备及消防控制室图形显示装置');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (76,76,13,'系统功能');

-- A9 DFCC-ID-14 防烟排烟系统及通风、空调系统防火
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (80,80,14,'系统设置');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (81,81,14,'自然排烟');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (82,82,14,'机械排烟正压送风');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (83,83,14,'排烟风机');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (84,84,14,'管道');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (85,85,14,'防火阀排烟防火阀');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (86,86,14,'系统功能');

-- A10 DFCC-ID-15 消防电气
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (90,90,15,'消防电源');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (91,91,15,'备用发电机');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (92,92,15,'柴油发电机房');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (93,93,15,'变配电房');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (94,94,15,'其他备用电源');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (95,95,15,'消防配电');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (96,96,15,'用电设施');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (97,97,15,'电气火灾监控系统');

-- A11 DFCC-ID-16 建筑灭火器
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (98,98,16,'配置');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (99,99,16,'布置');

-- A12 DFCC-ID-17 泡沫灭火系统
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (100,100,17,'泡沫灭火系统防护区');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (101,101,17,'泡沫储罐');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (102,102,17,'泡沫比例混合、泡沫发生装置');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (103,103,17,'系统功能');

-- A12 DFCC-ID-18 气体灭火系统
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (104,104,18,'防护区');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (105,105,18,'储存装置间');

INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (130,130,18,'灭火剂储存装置');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (131,131,18,'驱动装置');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (132,132,18,'管网');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (133,133,18,'喷嘴');
INSERT DFCI(ID,_ORDER,ITEM_ID,NAME) VALUE (134,134,18,'系统功能');



-- A2 DFCI-ID-1  建筑类别
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (1,1,1,1,'核对建筑的规模（面积、高度、层数）和性质，查阅相应资料','符合消防技术标准和消防设计文件要求');
-- A2 DFCI-ID-2  耐火等级
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (2,2,2,1,'核对建筑耐火等级，查阅相应资料，查看建筑主要构件燃烧性能和耐火极限','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (3,3,2,1,'查阅相应资料，查看钢结构构件防火处理','符合消防技术标准和消防设计文件要求');

-- A2 DFCI-ID-3  防火间距
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (4,4,3,1,'测量消防设计文件中有要求的防火间距','符合消防技术标准和消防设计文件要求');

-- A2 DFCI-ID-4  消防车道
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (5,5,4,1,'查看设置位置，车道的净宽、净高、转弯半径、树木等障碍物','符合消防技术标准和消防设计文件要求，且严禁擅自改变用途或被占用，应便于使用');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (6,6,4,2,'查看设置形式，坡度、承载力、回车场等','符合消防技术标准和消防设计文件要求，且严禁擅自改变用途或被占用，应便于使用');

-- A2 DFCI-ID-5  消防车登高面
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (7,7,5,1,'查看登高面的设置，是否有影响登高救援的裙房，首层是否设置楼梯出口，登高面上各楼层消防救援口的设置','符合消防技术标准和消防设计文件要求，且严禁擅自改变用途或被占用，应便于使用');

-- A2 DFCI-ID-6  消防车登高操作场地
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (8,8,6,1,'查看设置的长度、宽度、坡度、承载力，是否有影响登高救援的树木、架空管线等','符合消防技术标准和消防设计文件要求');

-- A2 DFCI-ID-7  消防控制室
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (9,9,7,1,'查看设置位置、防火分隔、安全出口，测试应急照明','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (10,10,7,1,'查看管道布置、防淹措施','无与消防设施无关的电气线路及管路穿越');

-- A2 DFCI-ID-8  消防水泵房
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (11,11,8,1,'查看设置位置、防火分隔、安全出口，测试应急照明','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (12,12,8,1,'查看防淹措施','符合消防技术标准和消防设计文件要求');

-- A2 DFCI-ID-9  民用建筑中其他特殊场所
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (13,13,9,1,'查看歌舞娱乐放映游艺场所，儿童活动场所，锅炉房，空调机房，厨房、手术室等设备用房设置位置、防火分隔','符合消防技术标准和消防设计文件要求');

-- A2 DFCI-ID-10  工业建筑中其他特殊场所
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (14,14,10,1,'查看高火灾危险性部位、中间仓库以及总控制室、员工宿舍、办公室、休息室等场所的设置位置、防火分隔','符合消防技术标准和消防设计文件要求');


-- A3 DFCI-ID-11  建筑外墙和屋面保温
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (15,15,11,1,'核查建筑的外墙及屋面保温系统的设置位置、设置形式，查阅报告，核对保温材料的燃烧性能','符合消防技术标准和消防设计文件要求');
-- A3 DFCI-ID-12  建筑外墙装饰
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (16,16,12,2,'查阅有关防火性能的证明文件','符合消防技术标准和消防设计文件要求');

-- A3 DFCI-ID-13 装修情况
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (17,17,13,1,'现场核对装修范围、使用功能','符合消防技术标准和消防设计文件要求');

-- A3 DFCI-ID-14 纺织织物
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (18,18,14,1,'查看有关防火性能的证明文件、施工记录','符合消防技术标准和消防设计文件要求');

-- A3 DFCI-ID-15 木质材料
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (19,19,15,1,'查看有关防火性能的证明文件、施工记录','符合消防技术标准和消防设计文件要求');

-- A3 DFCI-ID-16 高分子合成材料
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (20,20,16,1,'查看有关防火性能的证明文件、施工记录','符合消防技术标准和消防设计文件要求');

-- A3 DFCI-ID-17 复合材料
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (21,21,17,1,'查看有关防火性能的证明文件、施工记录','符合消防技术标准和消防设计文件要求');


-- A3 DFCI-ID-18 其他材料
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (22,22,18,1,'查看有关防火性能的证明文件、施工记录','符合消防技术标准和消防设计文件要求');



-- A3 DFCI-ID-19 电气安装与装修
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (23,23,19,1,'查看用电装置发热情况和周围材料的燃烧性能和防火隔热、散热措施','符合消防技术标准和消防设计文件要求');

-- A3 DFCI-ID-20 对消防设施影响
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (24,24,20,1,'查看影响消防设施的使用功能','不应影响消防设施的使用功能');

-- A3 DFCI-ID-21 对疏散设施影响

INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (424,424,20,1,'查看安全出口、疏散出口、疏散走道数量、测量疏散宽度','不应妨碍疏散走道的正常使用，不应减少安全出口、疏散出口或疏散走道的设计疏散所需净宽度和数量');




-- A4 DFCI-ID-31 防火分区
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (25,25,31,1,'核对防火分区位置、形式及完整性','符合消防技术标准和消防设计文件要求');

-- A4 DFCI-ID-32 防火墙
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (26,26,32,1,'查看设置位置及方式，查看防火封堵情况','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (27,27,32,1,'核查墙的燃烧性能','符合消防技术标准和消防设计文件要求');

-- A4 DFCI-ID-33 防火卷帘
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (28,28,33,2,'查看设置类型、位置和防火封堵严密性，测试手动、自动控制功能','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (29,29,33,2,'抽查防火卷帘，并核对其证明文件','与消防产品市场准入证明文件一致');
-- A4 DFCI-ID-34 防火门、窗
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (30,30,34,2,'查看设置位置、类型、开启方式，核对设置数量，检查安装质量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (31,31,34,2,'测试常闭防火门的自闭功能，常开防火门、窗的联动控制功能','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (32,32,34,2,'抽查防火门、防火窗、闭门器、防火玻璃等，并核对其证明文件','与消防产品市场准入证明文件一致');
-- A4 DFCI-ID-35 竖向管道井
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (33,33,35,1,'查看设置位置和检查门的设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (34,34,35,1,'查看井壁的耐火极限、防火封堵严密性','符合消防技术标准和消防设计文件要求');

-- A4 DFCI-ID-36 其他有防火分隔要求的部位
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (35,35,36,1,'查看窗间墙、窗槛墙、玻璃幕墙、防火墙两侧及转角处洞口等的设置、分隔设施和防火封堵','符合消防技术标准和消防设计文件要求');

-- A4 DFCI-ID-37 防烟分区
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (36,36,37,2,'核对防烟分区设置位置、形式及完整性','符合消防技术标准和消防设计文件要求');

-- A4 DFCI-ID-38 分隔设施
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (37,37,38,3,'核对防烟分区设置位置、形式及完整性','符合消防技术标准和消防设计文件要求');


-- A4 DFCI-ID-39 爆炸危险场所（部位）
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (38,38,39,2,'查看设置形式、建筑结构、设置位置、分隔措施','符合消防技术标准和消防设计文件要求');

-- A4 DFCI-ID-40 泄压设施
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (39,39,40,1,'查看泄压设施的设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (40,40,40,3,'核对泄压口面积、泄压形式','符合消防技术标准和消防设计文件要求');
-- A4 DFCI-ID-41 电气防爆
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (41,41,41,2,'核对防爆区电气设备的类型、标牌和合格证明文件','符合消防技术标准和消防设计文件要求');

-- A4 DFCI-ID-42 防静电、防积聚、防流散等措施
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (42,42,42,1,'查看设置形式','符合消防技术标准和消防设计文件要求');




-- A5 DFCI-ID-51 安全出口
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (50,50,51,1,'查看设置形式、位置和数量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (51,51,51,1,'查看疏散楼梯间、前室的防烟措施','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (52,52,51,1,'查看管道穿越疏散楼梯间、前室处及门窗洞口等防火分隔设置情况','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (53,53,51,1,'查看地下室、半地下室与地上层共用楼梯的防火分隔','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (54,54,51,1,'测量疏散宽度、建筑疏散距离、前室面积','符合消防技术标准和消防设计文件要求');

-- A5 DFCI-ID-52 疏散门
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (55,55,52,1,'查看疏散门的设置位置、形式和开启方向','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (56,56,52,1,'测量疏散宽度','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (57,57,52,1,'测试逃生门锁装置','符合消防技术标准和消防设计文件要求');
-- A5 DFCI-ID-53 疏散走道
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (58,58,53,2,'查看设置位置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (59,59,53,1,'查看排烟条件','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (60,60,53,1,'测量疏散宽度、疏散距离','符合消防技术标准和消防设计文件要求');

-- A5 DFCI-ID-54 避难层（间）
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (61,61,54,1,'查看设置位置、形式、平面布置和防火分隔','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (62,62,54,3,'测量有效避难面积','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (63,63,54,1,'查看防烟条件','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (64,64,54,1,'查看疏散楼梯、消防电梯设置','符合消防技术标准和消防设计文件要求');

-- A5 DFCI-ID-55 消防应急照明和疏散指示标志
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (65,65,55,2,'查看类别、型号、数量、安装位置、间距','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (66,66,55,1,'查看设置场所，测试应急功能及照度','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (67,67,55,2,'查看特殊场所设置的保持视觉连续的灯光疏散指示标志或蓄光疏散指示标志','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (68,68,55,2,'抽查消防应急照明、疏散指示、消防安全标志，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A5 DFCI-ID-56 消防电梯

INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (71,71,56,1,'查看设置位置、数量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (72,72,56,1,'查看前室门的设置形式，测量前室的面积','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (73,73,56,1,'查看井壁及机房的耐火性能和防火构造等，测试消防电梯的联动功能','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (74,74,56,2,'查看消防电梯载重量、电梯井的防水排水，测试消防电梯的速度、专用对讲电话和专用的操作按钮','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (75,75,56,2,'查看轿厢内装修材料','应为不燃材料');



-- A6 DFCI-ID-110 供水水源
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (80,80,110,1,'查看天然水源的水量、水质、枯水期技术措施、消防车取水高度、取水设施（码头、消防车道）','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (81,81,110,2,'查验市政供水的进水管数量、管径、供水能力','符合消防技术标准和消防设计文件要求');
-- A6 DFCI-ID-111 消防水池
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (82,82,111,2,'查看设置位置、水位显示与报警装置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (83,83,11,1,'核对有效容量','符合消防技术标准和消防设计文件要求');


-- A6 DFCI-ID-111 消防水池
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (84,84,111,2,'查看设置位置、水位显示与报警装置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (85,85,11,1,'核对有效容量','符合消防技术标准和消防设计文件要求');
-- A6 DFCC-ID-112 消防水泵
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (90,90,112,2,'查看工作泵、备用泵、吸水管、出水管及出水管上的泄压阀、水锤消除设施、截止阀、信号阀等的规格、型号、数量，吸水管、出水管上的控制阀状态','符合消防技术标准和消防设计文件要求，吸水管、出水管上的控制阀锁定在常开位置，并有明显标识');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (91,91,112,2,'查看吸水方式','自灌式引水或其他可靠的引水措施');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (92,92,112,2,'测试水泵手动和自动启停','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (93,93,112,1,'测试主、备电源切换和主、备泵启动、故障切换','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (94,94,112,3,'查看消防水泵启动控制装置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (95,95,112,2,'测试水锤消除设施后的压力','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (96,96,112,2,'抽查消防泵组，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A6 DFCC-ID-113 消防给水设备
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (97,97,113,2,'查查看气压罐的调节容量，稳压泵的规格、型号数量，管网连接','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (98,98,113,2,'测试稳压泵的稳压功能','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (99,99,113,2,'抽查消防气压给水设备、增压稳压给水设备等，并核对其证明文件','与消防产品市场准入证明文件一致');
-- A6 DFCC-ID-114 消防水箱
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (100,100,114,2,'查看设置位置、水位显示与报警装置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (101,101,114,2,'核对有效容量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (102,102,114,2,'查看确保水量的措施，管网连接','符合消防技术标准和消防设计文件要求');

-- A6 DFCC-ID-115 管网
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (103,103,115,2,'核实管网结构形式、供水方式','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (104,104,115,1,'查看管道的材质、管径、接头、连接方式及采取的防腐、防冻措施','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (105,105,115,2,'查看管网组件：闸阀、截止阀、减压孔板、减压阀、柔性接头、排水管、泄压阀等的设置','符合消防技术标准和消防设计文件要求');

-- A6 DFCC-ID-116 室外消火栓及取水口
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (106,106,116,2,'查看数量、设置位置、标识','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (107,107,116,2,'测试压力、流量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (108,108,116,2,'消防车取水口','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (109,109,116,3,'抽查室外消火栓、消防水带、消防枪等，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A6 DFCC-ID-117 室内消火栓

INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (110,110,117,2,'查看同层设置数量、间距、位置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (111,111,117,1,'查看消火栓规格、型号','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (112,112,117,2,'查看栓口设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (113,113,117,3,'查看标识、消火栓箱组件','标识明显、组件齐全');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (114,114,117,2,'抽查室内消火栓、消防水带、消防枪、消防软管卷盘等，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A6 DFCC-ID-118 水泵结合器
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (115,115,118,2,'查看数量、设置位置、标识，测试充水情况','标识明显、组件齐全');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (116,116,118,2,'抽查水泵接合器，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A6 DFCC-ID-119 系统功能
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (120,120,119,1,'测试压力、流量（有条件时应测试在模拟系统最大流量时最不利点压力）','流量、压力符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (121,121,119,2,'测试压力开关或流量开关自动启泵功能','应能启动水泵，水泵不能自动停止');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (122,122,119,3,'测试消火栓箱启泵按钮报警信号','应有反馈信号显示');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (123,123,119,1,'测试控制室直接启动消防水泵功能','应能启动水泵，有反馈信号显示');


-- A7 DFCC-ID-60 供水水源
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (124,124,60,1,'查看天然水源的水量、水质、枯水期技术措施、消防车取水高度、取水设施（码头、消防车道）','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (125,125,60,2,'查验市政供水的进水管数量、管径、供水能力','符合消防技术标准和消防设计文件要求');

-- A7 DFCC-ID-61 消防水池
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (126,126,61,2,'查看设置位置、水位显示与报警装置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (127,127,61,1,'核对有效容量','符合消防技术标准和消防设计文件要求');

-- A7 DFCC-ID-62 消防水泵
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (130,130,62,2,'查看工作泵、备用泵、吸水管、出水管及出水管上的泄压阀、水锤消除设施、截止阀、信号阀等的规格、型号、数量，吸水管、出水管上的控制阀状态','符合消防技术标准和消防设计文件要求，吸水管、出水管上的控制阀锁定在常开位置，并有明显标识');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (131,131,62,2,'查看吸水方式','自灌式引水或其他可靠的引水措施');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (132,132,62,2,'测试水泵启停','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (133,133,62,1,'测试主、备电源切换和主、备泵启动、故障切换','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (134,134,62,3,'查看消防水泵启动控制装置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (135,135,62,2,'测试水锤消除设施后的压力','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (136,136,62,2,'抽查消防泵组，并核对其证明文件','符合消防技术标准和消防设计文件要求');
-- A7 DFCC-ID-63 气压给水设备
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (137,137,63,2,'查看气压罐的调节容量，稳压泵的规格、型号数量，管网连接','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (138,138,63,2,'测试稳压泵的稳压功能','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (139,139,63,2,'抽查消防气压给水设备、增压稳压给水设备等，并核对其证明文件','与消防产品市场准入证明文件一致');
-- A7 DFCC-ID-64 消防水箱
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (140,140,64,2,'查看设置位置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (141,141,64,2,'核对容量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (142,142,64,2,'查看补水措施','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (143,143,64,3,'查看确保水量的措施，管网连接','符合消防技术标准和消防设计文件要求');

-- A7 DFCC-ID-65 报警阀组
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (150,150,65,2,'查看设置位置及组件','位置正确，组件齐全并符合产品要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (151,151,65,1,'测试系统流量、压力','系统流量、压力符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (152,152,65,2,'查看水力警铃设置是否在有人值守位置，测试水力警铃喷嘴压力及警铃声强','位置正确，水力警铃喷嘴处压力及警铃声强符合消防技术标准要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (153,153,65,2,'测试雨淋阀','打开手动试水阀或电磁阀，雨淋阀组动作可靠');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (154,154,65,3,'查看控制阀状态','锁定在常开位置');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (155,155,65,1,'测试压力开关动作后，消防水泵及联动设备的启动，信号反馈','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (156,156,65,2,'排水设施设置情况','房间内装有便于使用的排水设施');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (157,157,65,2,'抽查报警阀，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A7 DFCC-ID-66 管网
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (160,160,66,2,'核实管网结构形式、供水方式','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (161,161,66,2,'查看管道的材质、管径、接头、连接方式及采取的防腐、防冻措施','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (162,162,66,3,'查看管网排水坡度及辅助排水设施','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (163,163,66,3,'查看系统中的末端试水装置、试水阀、排气阀','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (164,164,66,2,'查看管网组件：闸阀、单向阀、电磁阀、信号阀、水流指示器、减压孔板、节流管、减压阀、柔性接头、排水管、排气阀、泄压阀等的设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (165,165,66,2,'测试干式系统、预作用系统的管道充水时间','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (166,166,66,3,'查看配水支管、配水管、配水干管设置的支架、吊架和防晃支架','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (167,167,66,3,'抽查消防闸阀、球阀、蝶阀、电磁阀、截止阀、信号阀、单向阀、水流指示器、末端试水装置等，并核对其证明文件','与消防产品市场准入证明文件一致');
-- A7 DFCC-ID-67 喷头
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (170,170,67,1,'查看设置场所、规格、型号、公称动作温度、响应指数','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (171,171,67,2,'查看喷头安装间距，喷头与楼板、墙、梁等障碍物的距离','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (172,172,67,3,'查看有腐蚀性气体的环境和有冰冻危险场所安装的喷头','应采取防护措施');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (173,173,67,3,'查看有碰撞危险场所安装的喷头','应加设防护罩');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (174,174,67,3,'查看备用喷头','各种不同规格的喷头均应有备用品，其数量不应小于安装总数的1％，且每种备用喷头不应少于10个');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (175,175,67,2,'抽查喷头，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A7 DFCC-ID-68 水泵结合器
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (176,176,68,2,'查看数量、设置位置、标识，测试充水情况','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (177,177,68,3,'抽查水泵结合器，并核对其证明文件','与消防产品市场准入证明文件一致');


-- A7 DFCC-ID-69 系统功能
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (180,180,69,3,'测试报警阀、水力警铃动作情况','报警阀动作，水力警铃应鸣响');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (181,181,69,3,'测试水流指示器动作情况','应有反馈信号显示');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (182,182,69,1,'测试压力开关动作情况','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (183,183,69,1,'测试雨淋阀动作情况','并有反馈信号显示');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (184,184,69,1,'测试消防水泵的远程手动、压力开关连锁启动情况','应启动消防水泵，并应有反馈信号显示');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (185,185,69,2,'测试干式系统加速器动作情况','应有反馈信号显示');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (186,186,69,2,'测试其他联动控制设备启动情况','应有反馈信号显示');


-- A8 DFCC-ID-70 系统形式
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (187,187,70,1,'查看系统的设置形式','符合消防技术标准和消防设计文件要求');

-- A8 DFCC-ID-71 火灾探测器
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (190,190,71,1,'测试其报警功能','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (191,191,71,3,'查看设置位置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (192,192,71,2,'查看规格、选型，短路隔离器的设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (193,193,71,2,'核对同区域数量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (194,194,71,2,'抽查火灾探测器、可燃气体探测器、手动火灾报警按钮、消火栓按钮等，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A8 DFCC-ID-72 消防通讯
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (200,200,72,2,'测试消防电话通话功能','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (201,201,72,3,'查看消防电话设置位置、核对数量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (202,202,72,2,'测试外线电话','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (203,203,72,3,'抽查消防电话，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A8 DFCC-ID-73 布线
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (204,204,73,2,'查看其线缆选型、敷设方式及相关防火保护措施','符合消防技术标准和消防设计文件要求');

-- A8 DFCC-ID-74 应急广播及警报装置
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (205,205,74,2,'功能实验','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (206,206,74,3,'查看设置位置、核对同区域数量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (207,207,74,3,'抽查消防应急广播设备、火灾警报装置，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A8 DFCC-ID-75 火灾报警控制器、联动设备及消防控制室图形显示装置
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (210,210,75,2,'查看设备选型、规格','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (211,211,75,3,'查看设备布置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (212,212,75,1,'查看设备的打印、显示、声报警、光报警功能','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (213,213,75,1,'查看对相关设备联动控制功能','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (214,214,75,1,'消防电源及主、备切换、压力开关连锁启动情况','符合消防技术标准和消防设计文件要求，自动切换功能正常');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (215,215,75,3,'消防电源监控器的安装','符合消防技术标准和消防设计文件要求，自动切换功能正常');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (216,216,75,2,'抽查消防联动控制器、火灾报警控制器、消防控制室图形显示装置、火灾显示盘、消防电气控制装置、消防电动装置、消防设备应急电源等，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A8 DFCC-ID-76 系统功能
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (217,217,76,2,'故障报警','显示位置准确，有声、光报警并打印');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (218,218,76,1,'探测器报警、手动报警','显示位置准确，有声、光报警并打印，启动相关联动设备，有反馈信号');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (219,219,76,1,'测试设备联动控制功能','联动逻辑关系和联动执行情况符合消防技术标准和消防设计文件要求。');

-- A9 DFCC-ID-80 系统设置
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (220,220,80,1,'查看系统的设置形式','符合消防技术标准和消防设计文件要求。');
-- A9 DFCC-ID-81 自然排烟
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (221,221,81,2,'查看设置位置','符合消防技术标准和消防设计文件要求。');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (222,222,81,2,'查看外窗开启方式，测量开启面积','符合消防技术标准和消防设计文件要求。');
-- A9 DFCC-ID-82 机械排烟正压送风
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (223,223,82,2,'查看设置位置、数量、形式','符合消防技术标准和消防设计文件要求。');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (224,224,82,2,'电动、手动开启和复位','符合消防技术标准和消防设计文件要求。');
-- A9 DFCC-ID-83 排烟风机
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (230,220,83,2,'查看设置位置和数量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (231,221,83,3,'查看种类、规格、型号','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (232,222,83,2,'查看供电情况','有主备电源，自动切换正常');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (233,223,83,1,'测试功能','启停控制正常，有信号反馈，复位正常');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (234,224,83,2,'抽查排烟风机，并核对其证明文件','与消防产品市场准入证明文件一致');
-- A9 DFCC-ID-84 管道
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (235,225,84,1,'管道布置、材质及保温材料','管道布置、材质及保温材料	符合消防技术标准和消防设计文件要求');
-- A9 DFCC-ID-85 防火阀排烟防火阀
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (240,240,85,2,'查看设置位置、型号','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (241,241,85,3,'查验同层设置数量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (242,242,85,3,'测试功能','关闭和复位正常');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (243,243,85,3,'抽查防火阀、排烟防火阀，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A9 DFCC-ID-86 系统功能
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (244,244,86,1,'测试远程直接启动风机','正常启停，并有信号反馈');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (245,245,86,2,'测试风机的联动启动、电动防火阀，电动排烟窗，排烟、送风口的联动功能','动作正确');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (246,246,86,2,'联动测试，查看风口气流方向，实测风速，楼梯间、前室、合用前室余压','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (247,247,86,2,'测试风口、防火阀、排烟窗等信号反馈','符合消防技术标准和消防设计文件要求');


-- A10 DFCC-ID-90 消防电源
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (248,248,90,1,'查验消防负荷等级、供电形式','符合消防技术标准和消防设计文件要求');

-- A10 DFCC-ID-91 备用发电机
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (250,250,91,2,'查验备用发电机规格、型号及功率','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (251,251,91,3,'查看设置位置及燃料配备','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (252,252,91,2,'测试应急启动发电机','启动时间符合消防技术标准和消防设计文件要求，且运行正常');

-- A10 DFCC-ID-92 柴油发电机房
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (253,253,92,1,'查看设置位置、耐火等级、防火分隔、疏散门等建筑防火要求','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (254,254,92,1,'测试应急照明','正常照度');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (255,255,92,1,'查看储油间的设置','符合消防技术标准和消防设计文件要求');

-- A10 DFCC-ID-93 变配电房
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (256,256,93,1,'查看设置位置、耐火等级、防火分隔、疏散门等建筑防火要求','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (257,257,93,1,'测试应急照明','正常照度');

-- A10 DFCC-ID-94 其他备用电源
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (258,258,94,2,'EPS或UPS等','符合消防技术标准和消防设计文件要求');

-- A10 DFCC-ID-95 消防配电
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (260,260,95,1,'查看消防用电设备是否设置专用供电回路','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (261,261,95,1,'查看消防用电设备的配电箱及末端切换装置及断路器设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (262,262,95,1,'查看配电线路敷设及防护措施','符合消防技术标准和消防设计文件要求');

-- A10 DFCC-ID-96 用电设施
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (264,264,96,1,'查看架空线路与保护对象的间距','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (265,265,96,1,'开关、灯具等装置的发热情况和隔热、散热措施','符合消防技术标准和消防设计文件要求');

-- A10 DFCC-ID-97 电气火灾监控系统
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (266,266,97,3,'电气火灾监控系统的设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (267,267,97,3,'抽查电气火灾监控探测器、电气火灾监控设备，并核对其证明文件','与消防产品市场准入证明文件一致');


-- A11 DFCC-ID-98 配置
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (268,268,98,1,'查看灭火器类型、规格、灭火级别和配置数量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (269,269,98,2,'抽查灭火器，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A11 DFCC-ID-99 布置
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (270,270,99,1,'测量灭火器设置点距离','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (271,271,99,2,'查看灭火器设置点位置、摆放和使用环境','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (272,272,99,2,'查看设置点的设置数量','符合消防技术标准和消防设计文件要求');

-- A12 DFCC-ID-100 泡沫灭火系统防护区
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (273,273,100,1,'查看保护对象的设置位置、性质、环境温度，核对系统选型','符合消防技术标准和消防设计文件要求');
-- A12 DFCC-ID-101 泡沫储罐
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (280,280,101,3,'查看设置位置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (281,281,101,2,'查验泡沫灭火剂种类和数量、摆放和使用环境','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (282,282,101,3,'抽查泡沫灭火剂，并核对其证明文件','与消防产品市场准入证明文件一致');
-- A12 DFCC-ID-102 泡沫比例混合、泡沫发生装置
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (283,283,102,1,'查看其规格、型号','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (284,284,102,3,'查看设置位置及安装','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (285,285,102,2,'抽查泡沫灭火设备，并核对其证明文件','与消防产品市场准入证明文件一致');

-- A12 DFCC-ID-103 系统功能
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (286,286,103,2,'查验喷泡沫试验记录，核对中、低倍泡沫灭火系统泡沫混合液的混合比和发泡倍数','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (287,287,103,2,'查验喷泡沫试验记录，核对中、低倍泡沫灭火系统泡沫混合液的混合比和泡沫供给速率','符合消防技术标准和消防设计文件要求');


-- A12 DFCC-ID-104 防护区
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (290,290,104,2,'查看保护对象设置位置、划分、用途、环境温度、通风及可燃物种类','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (291,291,104,3,'估算防护区几何尺寸、开口面积','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (292,292,104,2,'查看防护区围护结构耐压、耐火极限和门窗自行关闭情况','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (293,293,104,3,'查看疏散通道、标识和应急照明','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (294,294,104,3,'查看出入口处声光警报装置设置和安全标志','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (295,295,104,3,'查看排气或泄压装置设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (296,296,104,3,'查看专用呼吸器具配备','符合消防技术标准和消防设计文件要求');

-- A12 DFCC-ID-105 储存装置间
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (300,300,105,2,'查看设置位置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (301,301,105,2,'查看通道、应急照明设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (302,302,105,3,'查看其他安全措施','符合消防技术标准和消防设计文件要求');


-- A12 DFCC-ID-130 灭火剂储存装置
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (303,303,130,3,'查看储存容器数量、型号、规格、位置、固定方式、标志','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (304,304,130,3,'查验灭火剂充装量、压力、备用量','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (305,305,130,3,'抽查气体灭火剂，并核对其证明文件','与消防产品市场准入证明文件一致');
-- A12 DFCC-ID-131 驱动装置
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (310,310,131,2,'查看集流管的材质、规格、连接方式和布置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (311,311,131,3,'查看选择阀及信号反馈装置规格、型号、位置和标志','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (312,312,131,2,'查看驱动装置规格、型号、数量和标志，驱动气瓶的充装量和压力','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (313,313,131,3,'查看驱动气瓶和选择阀的应急手动操作处标志','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (314,314,131,2,'抽查气体灭火设备，并核对其证明文件','与消防产品市场准入证明文件一致');
-- A12 DFCC-ID-132 管网
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (315,315,132,2,'查看管道及附件材质、布置规格、型号和连接方式','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (316,316,132,3,'查看管道的支、吊架设置','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (317,317,132,3,'其他防护措施','符合消防技术标准和消防设计文件要求');

-- A12 DFCC-ID-133 喷嘴
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (318,318,133,2,'查看规格、型号和安装位置、方向','符合消防技术标准和消防设计文件要求');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (319,319,133,3,'核对设置数量','符合消防技术标准和消防设计文件要求');


-- A12 DFCC-ID-134 系统功能
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (325,325,134,3,'测试主、备电源切换','自动切换正常');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (326,326,134,3,'测试灭火剂主、备用量切换','切换正常');
INSERT DFCL (ID,_ORDER,PARENT,LEVEL,NAME, _REQUIRE) VALUE (327,327,134,1,'模拟自动启动系统','电磁阀、选择阀动作正常，有信号反馈');
