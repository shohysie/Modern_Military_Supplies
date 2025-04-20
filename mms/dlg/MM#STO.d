BEGIN ~MM#STO~

IF ~AreaCheck("AR5400")~
THEN BEGIN firstmeet1
	SAY @160	//你好啊，朋友。
	IF ~~ THEN REPLY @170 GOTO firstmeet2	//你好，你在这里做什么呢？
END

IF ~~ THEN BEGIN firstmeet2
	SAY @161	//我在测试来自外域的物品能不能在这边正常使用。这洞里时不时冒出喳喳叫的小玩意袭击普通人，是很好的测试对象。
	IF ~~ THEN REPLY @171 GOTO firstmeet3	//那测试的结果怎样？它们能用吗？
	IF ~~ THEN REPLY @172 EXIT	//那我不打扰你了。
END

IF ~~ THEN BEGIN firstmeet3
	SAY @162	//因为世界的规则有点不一样，有些东西的功能有点偏离，还好大部分都挺正常。
	IF ~~ THEN REPLY @173 GOTO firstmeet4	//我可以看看你有哪些物品吗？我挺感兴趣的，可以出钱买一点。
	IF ~~ THEN REPLY @172 EXIT	//那我不打扰你了。
END

IF ~~ THEN BEGIN firstmeet4
	SAY @163	//我现在没带多少东西。而且你看起来挺落魄的，我送你一些东西吧，不怎么值钱但你应该用得上。等你发达了，到博德之门的巫术杂货店二楼找我。
	IF ~~ THEN DO ~GiveItemCreate("MM#CAN2",[PC],0,0,0)
GiveItemCreate("MM#HLM1",[PC],0,0,0)
GiveItemCreate("MM#BPV2",[PC],0,0,0)
GiveItemCreate("MM#SHD3",[PC],0,0,0)
GiveItemCreate("MM#RSP1",[PC],0,0,0)
ReallyForceSpell(Myself,WIZARD_SHADOW_DOOR)
SetGlobal("MM#MEET","GLOBAL",1)~ EXIT
END

IF ~!AreaCheck("AR5400")
!GlobalGT("trained","LOCALS",0)
!Global("MM#MEET","GLOBAL",3)
!Global("MM#MEET","GLOBAL",5)~ THEN BEGIN meet
	SAY @10	//很高兴见到你，有兴趣看看来自另一个宇宙的武器装备吗？
	IF ~~ THEN REPLY @100 DO ~StartStore("MM#STO",LastTalkedToBy())~ EXIT	//让我看看你的货物。
	IF ~~ THEN REPLY @101 GOTO wddesc	//能介绍一下你的世界吗？
	IF ~~ THEN REPLY @102 GOTO wpdesc	//能介绍一下你的武器装备吗？
	IF ~!NumberOfTimesTalkedTo(0)~ THEN REPLY @103 GOTO repair	//上次在你这买的东西坏了，需要修理。
	IF ~~ THEN REPLY @104 GOTO notice	//怎样才能用好这些枪械？有什么需要注意的吗？
	IF ~~ THEN REPLY @124 EXIT	//下次再说吧，我要走了。
END

IF ~~ THEN BEGIN wddesc
	SAY @11	//我来自一个没有神和魔法的世界，因此我们专精于材料和工艺。我的货物会体现这一点。
	IF ~~ THEN REPLY @100 DO ~StartStore("MM#STO",LastTalkedToBy())~ EXIT	//让我看看你的货物。
	IF ~~ THEN REPLY @102 GOTO wpdesc	//能介绍一下你的武器装备吗？
	IF ~!GlobalGT("MM#MEET","GLOBAL",3)~ THEN REPLY @125 DO ~SetGlobal("challenge","LOCALS",1)~ GOTO challenge	//我想向你挑战，见识一下你们材料和工艺的性能。
	IF ~~ THEN REPLY @124 EXIT	//下次再说吧，我要走了。
END

//挑战
IF ~Global("MM#MEET","GLOBAL",3)~ THEN BEGIN challenge
	SAY @13	//想挑战我吗？那就用点旧货陪你们玩玩吧。
	IF ~~ THEN DO ~CreateCreatureObject("MM#TANK",Myself,0,0,0)
CreateVisualEffectObject("SPPORTAL","MM#TANK")
SetGlobal("MM#MEET","GLOBAL",4)
Deactivate(Myself)~ EXIT
END

//挑战胜利
IF ~Global("MM#MEET","GLOBAL",5)~ THEN BEGIN sendtank
	SAY @14	//干的不错，虽然你们打败的是一百年前的老古董。这个送你当纪念吧。
	IF ~~ THEN DO ~GiveItemCreate("MM#TANK",[PC],0,0,0)
SetGlobal("MM#MEET","GLOBAL",6)~ EXIT
END

IF ~~ THEN BEGIN wpdesc
	SAY @15	//你想听哪种装备的介绍？
	IF ~~ THEN REPLY @110 GOTO wp01	//手枪。
	IF ~~ THEN REPLY @111 GOTO wp02	//冲锋枪。
	IF ~~ THEN REPLY @112 GOTO wp03	//步枪。
	IF ~~ THEN REPLY @113 GOTO wp04	//霰弹枪。
	IF ~~ THEN REPLY @114 GOTO wp05	//狙击枪。
	IF ~~ THEN REPLY @115 GOTO wp06	//机枪。
	IF ~~ THEN REPLY @116 GOTO wp07	//枪弹。
	IF ~~ THEN REPLY @117 GOTO wp08	//刺刀。
	IF ~~ THEN REPLY @118 GOTO wp09	//手榴弹。
	IF ~~ THEN REPLY @119 GOTO wp10	//地雷。
	IF ~~ THEN REPLY @120 GOTO wp11	//护甲。
	IF ~~ THEN REPLY @121 GOTO wp12	//无人兵器。
	IF ~~ THEN REPLY @122 GOTO wp13	//这些装备会不会坏掉？
	IF ~~ THEN REPLY @100 DO ~StartStore("MM#STO",LastTalkedToBy())~ EXIT	//让我看看你的货物。
	IF ~~ THEN REPLY @124 EXIT	//下次再说吧，我要走了。
END

IF ~~ THEN BEGIN wp01
	SAY @20	//手枪是一只手就能用的火器。它很轻巧，不过大部分手枪的子弹穿透力和射程有限，对上穿着重甲的人可能效果不太好，当然也有例外。
	IF ~~ THEN GOTO wp01a
END

IF ~~ THEN BEGIN wp01a
	SAY @21	//我这里卖的都是非自动手枪，只能一枪一枪打不能点射扫射。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp02
	SAY @23	//冲锋枪的子弹和手枪一样，穿透力和射程有限，但火力凶猛可以把人扫成筛子，近战强大无比。
	IF ~~ THEN GOTO wp02a
END

IF ~~ THEN BEGIN wp02a
	SAY @24	//冲锋枪可以进行长短点射和扫射，对单个或多个敌人实施连续射击。微型冲锋枪单手就能拿，其它的要两只手。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp03
	SAY @26	//步枪发射的子弹穿透力强，近距离容易把没穿甲的敌人身体打穿导致威力不能完全发挥；对上厚重的铠甲倒是刚好可以让减速变形的子弹在敌人身体里发飚。
	IF ~~ THEN GOTO wp03a
END

IF ~~ THEN BEGIN wp03a
	SAY @27	//我这里有栓动、半自动和自动步枪。栓动步枪得手动上弹，半自动步枪是自动上弹，两者都必须一枪一枪打；自动步枪可以进行长短点射，对单个或多个敌人实施连续射击。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp04
	SAY @30	//霰弹枪可以一枪打出很多颗小钢珠，容易把人打得很惨。不过它打不太远，而且子弹穿透力比手枪还弱，比较适合用来对付没穿铠甲的敌人。它还可以用来开锁。
	IF ~~ THEN GOTO wp04a
END

IF ~~ THEN BEGIN wp04a
	SAY @31	//霰弹枪并不能一打一大片。当然自动霰弹枪是可以点射扫射的，只是价格方面会贵一点啦。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp05
	SAY @33	//狙击枪是一种很精准的步枪，它有个瞄准镜可以远远瞄准了再打，敌人被打死都不知道你在哪儿呢。
	IF ~~ THEN GOTO wp05a
END

IF ~~ THEN BEGIN wp05a
	SAY @34	//不过使用狙击枪你得架起来瞄准，出手没那么快，也没法开完枪就马上跑路。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp06
	SAY @36	//机枪可以看成能长时间连续发射进行封锁和压制的步枪。这玩意正式亮相的第一天就打死了六万人呢，信不信由你。
	IF ~~ THEN GOTO wp06a
END

IF ~~ THEN BEGIN wp06a
	SAY @37	//轻机枪可以端起来一边打一边移动，但这样打起来不会很准。通用机枪和重机枪都必须使用脚架，准备攻击和转移阵地都需要时间。
	IF ~~ THEN GOTO wp06b
END

IF ~~ THEN BEGIN wp06b
	SAY @38	//机枪可以进行长短点射和扫射，最适合对付大量的敌军炮灰。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp07
	SAY @41	//枪弹是用火药推动的金属块，飞行速度非常快，眼睛完全看不见。和一穿俩眼的弓弩不同，枪弹有很高概率在人身体里翻滚变形碎裂，带来难以预料的后果，比如额外伤害、流血、残废、昏迷等等。
	IF ~~ THEN GOTO wp07a
END

IF ~~ THEN BEGIN wp07a
	SAY @42	//枪弹的形式有好几种：单发形式的子弹，以及含多发枪弹的弹匣、弹鼓还有弹带。消耗子弹可以单发射击；消耗弹匣可以进行短点射，对单个敌人多次攻击；消耗弹鼓可以进行长点射，对一定角度范围内的多个敌人进行连续攻击；消耗弹带可以扫射更大范围内的敌人。
	IF ~~ THEN GOTO wp07b
END

IF ~~ THEN BEGIN wp07b
	SAY @43	//各种枪支持的攻击模式不一样，有的只能单发射击，有的可以扫射，需要配备适合的弹药。发射不适合的弹药是没有效果的。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp08
	SAY @45	//刺刀是给枪械使用的近战肉搏附件，需要手动换上，然后就可以把枪当成短矛来刺击，对刺不动的对手还可以用枪托砸。和其它远程武器类似，太长的枪械在被敌人靠近时会很吃亏，但短枪就没有这个问题。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp08a
	SAY @46	//现在购买步枪还免费附赠一套附魔刺刀，欲购从速！
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp09
	SAY @48	//手榴弹对准人或者空地扔就行了，当心误伤。有普通手榴弹也有特种手榴弹，使用前请详细阅读说明书。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp10
	SAY @50	//地雷可以预先埋设在地上，路过会触发爆炸，当心误伤。有的地雷还能直接对敌人发射，具体请详细阅读说明书。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp11
	SAY @52	//我这里有一批双防服，主要功能是防御子弹，对冷兵器也有一定的防御能力。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp12
	SAY @54	//无人兵器能在不需要操纵者本人到场的情况下进行侦查、攻击甚至自爆。你把无人兵器当成可遥控的魔像就好。
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp13
	SAY @16	//我会教你一些简单维修技能，也会附送零件包，轻微的损坏你可以自己搞定。要是损坏太严重，就拿过来给我修吧，只收配件费用。
	IF ~~ THEN GOTO wpdesc
END

//使用心得
IF ~~ THEN BEGIN notice
	SAY @60	//枪械的基本使用原理很简单，使用瞄准具三点一线，保持姿势稳定。威力越大的枪械后坐力越大，开枪时要用正确的姿势把枪抵住。
	IF ~~ THEN REPLY @105 GOTO notice1	//看起来和十字弓有点像。如果我对十字弓掌握得非常好，还需要专门学习使用枪械吗？
END

IF ~~ THEN BEGIN notice1
	SAY @61	//十字弓的使用经验帮助不大，你需要从头开始熟悉枪械。我可以免费给你培训一下初步使用技巧，然后更多训练就要收费了。
	IF ~~ THEN GOTO notice2
END

IF ~~ THEN BEGIN notice2
	SAY @62	//注意那些全自动枪械，连发的后坐力会让你很难连续命中，需要把枪口压住，这很需要经验技巧。特别是那些射速快威力大的自动枪械，掌握技巧能让更多子弹打中敌人。
	IF ~!HasItem("MM#qtn",Myself)~ THEN REPLY @106 GOTO train	//我需要进行枪械培训。
	IF ~HasItem("MM#qtn",Myself)~ THEN REPLY @107 GOTO quintain	//我要怎样知道自己掌握到什么程度了呢？
	IF ~~ THEN REPLY @124 EXIT	//下次再说吧，我要走了。
END

//培训	
IF ~~ THEN BEGIN train
	SAY @63	//让我来看看你的水准，好决定给你安排什么样的训练。
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",0))~ THEN GOTO train0
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",1))~ THEN GOTO train1
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",2))~ THEN GOTO train2
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",3))~ THEN GOTO train3
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",4))~ THEN GOTO train4
	IF ~TriggerOverride(LastTalkedToBy(),GlobalGT("MM#PRF","Locals",4))~ THEN GOTO train5
END

IF ~~ THEN BEGIN train0
	SAY @64	//你没有掌握任何的枪械使用技巧，我可以免费培训你到专长（1星）的水平。
	IF ~~ THEN REPLY @108 DO ~ReallyForceSpellRES("MM#PRF0I",LastTalkedToBy())
AdvanceTime(ONE_HOUR)
StartCutSceneMode()
StartCutScene("MM#train")~ EXIT	//好的，现在就开始训练吧。
	IF ~~ THEN REPLY @124 EXIT	//下次再说吧，我要走了。
END

IF ~~ THEN BEGIN train1
	SAY @65	//你使用枪械已经有专长（1星）的水平，我可以让你更进一步，但需要一天和1000金币。
	IF ~PartyGoldGT(999)~ THEN REPLY @108 DO ~ReallyForceSpellRES("MM#PRF1I",LastTalkedToBy())
RestParty()
TakePartyGold(1000)
DestroyGold(1000)
AdvanceTime(EIGHT_HOURS)
StartCutSceneMode()
StartCutScene("MM#train")~ EXIT	//好的，现在就开始训练吧。
	IF ~!PartyGoldGT(1999)~ THEN REPLY @109 EXIT	//稍等，我去取些钱来。
	IF ~~ THEN REPLY @124 EXIT	//下次再说吧，我要走了。
END

IF ~~ THEN BEGIN train2
	SAY @66	//你使用枪械已经有专精（2星）的水平，我可以让你更进一步，但需要两天和2000金币。
	IF ~PartyGoldGT(1999)~ THEN REPLY @108 DO ~ReallyForceSpellRES("MM#PRF2I",LastTalkedToBy())
RestParty()
TakePartyGold(2000)
DestroyGold(2000)
AdvanceTime(SIXTEEN_HOURS)
StartCutSceneMode()
StartCutScene("MM#train")~ EXIT	//好的，现在就开始训练吧。
	IF ~!PartyGoldGT(1999)~ THEN REPLY @109 EXIT	//稍等，我去取些钱来。
	IF ~~ THEN REPLY @124 EXIT	//下次再说吧，我要走了。
END

IF ~~ THEN BEGIN train3
	SAY @67	//你使用枪械已经有大师（3星）的水准，我没法给予更多的帮助，接下来你得在战斗中自行积累经验。
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN train4
	SAY @68	//你使用枪械已经有宗师（4星）的水准，我没法给予更多的帮助，接下来你得在战斗中自行积累经验。
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN train5
	SAY @69	//你使用枪械已经有大宗师（5星）的水准，已经不需要再训练了，哪怕这些枪械的原产地也没有多少人能比你用得好了。
	IF ~~ THEN EXIT
END

IF ~GlobalGT("trained","LOCALS",0)~ THEN BEGIN train6
	SAY @70	//你用枪的水平现在已经提升了。如果还有需要培训的队员，让他来找我。
	IF ~~ THEN DO ~SetGlobal("trained","LOCALS",0)~ EXIT
END

IF ~~ THEN BEGIN quintain
	SAY @71	//手中持枪，子弹上膛，这时看你的十字弓熟练度就可以。
	IF ~~ THEN GOTO wpdesc
END

//修理
IF ~~ THEN BEGIN repair
	SAY @16	//是要修哪个？
	IF ~HasItem("MM#RVL1B",LastTalkedToBy())~ THEN REPLY @1001 GOTO repairrvl1
	IF ~HasItem("MM#RVL2B",LastTalkedToBy())~ THEN REPLY @1002 GOTO repairrvl2
	IF ~HasItem("MM#RVL3B",LastTalkedToBy())~ THEN REPLY @1003 GOTO repairrvl3
	IF ~HasItem("MM#PST1B",LastTalkedToBy())~ THEN REPLY @1011 GOTO repairpst1
	IF ~HasItem("MM#PST2B",LastTalkedToBy())~ THEN REPLY @1012 GOTO repairpst2
	IF ~HasItem("MM#PST3B",LastTalkedToBy())~ THEN REPLY @1013 GOTO repairpst3
	IF ~HasItem("MM#PST4B",LastTalkedToBy())~ THEN REPLY @1014 GOTO repairpst4
	IF ~HasItem("MM#PST5B",LastTalkedToBy())~ THEN REPLY @1015 GOTO repairpst5
	IF ~HasItem("MM#PST6B",LastTalkedToBy())~ THEN REPLY @1016 GOTO repairpst6
	IF ~HasItem("MM#PST7B",LastTalkedToBy())~ THEN REPLY @1017 GOTO repairpst7
	IF ~HasItem("MM#PST8B",LastTalkedToBy())~ THEN REPLY @1018 GOTO repairpst8
	IF ~HasItem("MM#MCR1B",LastTalkedToBy())~ THEN REPLY @2001 GOTO repairmcr1
	IF ~HasItem("MM#MCR2B",LastTalkedToBy())~ THEN REPLY @2002 GOTO repairmcr2
	IF ~HasItem("MM#MCR3B",LastTalkedToBy())~ THEN REPLY @2003 GOTO repairmcr3
	IF ~HasItem("MM#MCR4B",LastTalkedToBy())~ THEN REPLY @2004 GOTO repairmcr4
	IF ~HasItem("MM#MCR5B",LastTalkedToBy())~ THEN REPLY @2005 GOTO repairmcr5
	IF ~HasItem("MM#MCR6B",LastTalkedToBy())~ THEN REPLY @2006 GOTO repairmcr6
	IF ~HasItem("MM#MCR7B",LastTalkedToBy())~ THEN REPLY @2007 GOTO repairmcr7
	IF ~HasItem("MM#SBM1B",LastTalkedToBy())~ THEN REPLY @2011 GOTO repairsbm1
	IF ~HasItem("MM#SBM2B",LastTalkedToBy())~ THEN REPLY @2012 GOTO repairsbm2
	IF ~HasItem("MM#SBM3B",LastTalkedToBy())~ THEN REPLY @2013 GOTO repairsbm3
	IF ~HasItem("MM#SBM4B",LastTalkedToBy())~ THEN REPLY @2014 GOTO repairsbm4
	IF ~HasItem("MM#SBM5B",LastTalkedToBy())~ THEN REPLY @2015 GOTO repairsbm5
	IF ~HasItem("MM#SBM6B",LastTalkedToBy())~ THEN REPLY @2016 GOTO repairsbm6
	IF ~HasItem("MM#BLT1B",LastTalkedToBy())~ THEN REPLY @3001 GOTO repairblt1
	IF ~HasItem("MM#BLT2B",LastTalkedToBy())~ THEN REPLY @3002 GOTO repairblt2
	IF ~HasItem("MM#BLT3B",LastTalkedToBy())~ THEN REPLY @3003 GOTO repairblt3
	IF ~HasItem("MM#BLT4B",LastTalkedToBy())~ THEN REPLY @3004 GOTO repairblt4
	IF ~HasItem("MM#BLT5B",LastTalkedToBy())~ THEN REPLY @3005 GOTO repairblt5
	IF ~HasItem("MM#SLF1B",LastTalkedToBy())~ THEN REPLY @3011 GOTO repairslf1
	IF ~HasItem("MM#SLF2B",LastTalkedToBy())~ THEN REPLY @3012 GOTO repairslf2
	IF ~HasItem("MM#SLF3B",LastTalkedToBy())~ THEN REPLY @3013 GOTO repairslf3
	IF ~HasItem("MM#SLF4B",LastTalkedToBy())~ THEN REPLY @3014 GOTO repairslf4
	IF ~HasItem("MM#AST1B",LastTalkedToBy())~ THEN REPLY @3021 GOTO repairast1
	IF ~HasItem("MM#AST2B",LastTalkedToBy())~ THEN REPLY @3022 GOTO repairast2
	IF ~HasItem("MM#AST3B",LastTalkedToBy())~ THEN REPLY @3023 GOTO repairast3
	IF ~HasItem("MM#AST4B",LastTalkedToBy())~ THEN REPLY @3024 GOTO repairast4
	IF ~HasItem("MM#AST5B",LastTalkedToBy())~ THEN REPLY @3025 GOTO repairast5
	IF ~HasItem("MM#AST6B",LastTalkedToBy())~ THEN REPLY @3026 GOTO repairast6
	IF ~HasItem("MM#AST7B",LastTalkedToBy())~ THEN REPLY @3027 GOTO repairast7
	IF ~HasItem("MM#SHT1B",LastTalkedToBy())~ THEN REPLY @4001 GOTO repairsht1
	IF ~HasItem("MM#SHT2B",LastTalkedToBy())~ THEN REPLY @4002 GOTO repairsht2
	IF ~HasItem("MM#SHT3B",LastTalkedToBy())~ THEN REPLY @4003 GOTO repairsht3
	IF ~HasItem("MM#SHT4B",LastTalkedToBy())~ THEN REPLY @4004 GOTO repairsht4
	IF ~HasItem("MM#SHT5B",LastTalkedToBy())~ THEN REPLY @4005 GOTO repairsht5
	IF ~HasItem("MM#SNP1B",LastTalkedToBy())~ THEN REPLY @5001 GOTO repairsnp1
	IF ~HasItem("MM#SNP2B",LastTalkedToBy())~ THEN REPLY @5002 GOTO repairsnp2
	IF ~HasItem("MM#SNP3B",LastTalkedToBy())~ THEN REPLY @5003 GOTO repairsnp3
	IF ~HasItem("MM#SNP4B",LastTalkedToBy())~ THEN REPLY @5004 GOTO repairsnp4
	IF ~HasItem("MM#SNP5B",LastTalkedToBy())~ THEN REPLY @5005 GOTO repairsnp5
	IF ~HasItem("MM#SNP6B",LastTalkedToBy())~ THEN REPLY @5006 GOTO repairsnp6
	IF ~HasItem("MM#SNP7B",LastTalkedToBy())~ THEN REPLY @5007 GOTO repairsnp7
	IF ~HasItem("MM#LMC1B",LastTalkedToBy())~ THEN REPLY @6001 GOTO repairlmc1
	IF ~HasItem("MM#LMC2B",LastTalkedToBy())~ THEN REPLY @6002 GOTO repairlmc2
	IF ~HasItem("MM#LMC3B",LastTalkedToBy())~ THEN REPLY @6003 GOTO repairlmc3
	IF ~HasItem("MM#LMC4B",LastTalkedToBy())~ THEN REPLY @6004 GOTO repairlmc4
	IF ~HasItem("MM#LMC5B",LastTalkedToBy())~ THEN REPLY @6005 GOTO repairlmc5
	IF ~HasItem("MM#GMC1B",LastTalkedToBy())~ THEN REPLY @6011 GOTO repairgmc1
	IF ~HasItem("MM#GMC2B",LastTalkedToBy())~ THEN REPLY @6012 GOTO repairgmc2
	IF ~HasItem("MM#GMC3B",LastTalkedToBy())~ THEN REPLY @6013 GOTO repairgmc3
	IF ~HasItem("MM#GMC4B",LastTalkedToBy())~ THEN REPLY @6014 GOTO repairgmc4
	IF ~HasItem("MM#HMC1B",LastTalkedToBy())~ THEN REPLY @6021 GOTO repairhmc1
	IF ~HasItem("MM#HMC2B",LastTalkedToBy())~ THEN REPLY @6021 GOTO repairhmc2
	IF ~HasItem("MM#HMC3B",LastTalkedToBy())~ THEN REPLY @6021 GOTO repairhmc3	
	IF ~HasItem("MM#UMC1A",LastTalkedToBy())~ THEN REPLY @6021 GOTO repairuav1
	IF ~HasItem("MM#UMC3A",LastTalkedToBy())~ THEN REPLY @6021 GOTO repairuav3
	IF ~HasItem("MM#DOG1A",LastTalkedToBy())~ THEN REPLY @6021 GOTO repairdog1
	IF ~HasItem("MM#DOG2A",LastTalkedToBy())~ THEN REPLY @6021 GOTO repairdog2	
	IF ~~ THEN REPLY @123 EXIT	//我想想还是算了。
END

IF ~~ THEN BEGIN repairrvl1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#RVL1b")
DestroyItem("MM#RVL1b")
GiveItemCreate("MM#RVL1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairrvl2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#RVL2b")
DestroyItem("MM#RVL2b")
GiveItemCreate("MM#RVL2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairrvl3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#RVL3b")
DestroyItem("MM#RVL3b")
GiveItemCreate("MM#RVL3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairpst1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#PST1b")
DestroyItem("MM#PST1b")
GiveItemCreate("MM#PST1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairpst2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#PST2b")
DestroyItem("MM#PST2b")
GiveItemCreate("MM#PST2",LastTalkedToBy(),1,0,0)~ EXIT
END


IF ~~ THEN BEGIN repairpst3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#PST3b")
DestroyItem("MM#PST3b")
GiveItemCreate("MM#PST3",LastTalkedToBy(),1,0,0)~ EXIT
END


IF ~~ THEN BEGIN repairpst4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#PST4b")
DestroyItem("MM#PST4b")
GiveItemCreate("MM#PST4",LastTalkedToBy(),1,0,0)~ EXIT
END


IF ~~ THEN BEGIN repairpst5
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#PST5b")
DestroyItem("MM#PST5b")
GiveItemCreate("MM#PST5",LastTalkedToBy(),1,0,0)~ EXIT
END


IF ~~ THEN BEGIN repairpst6
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#PST6b")
DestroyItem("MM#PST6b")
GiveItemCreate("MM#PST6",LastTalkedToBy(),1,0,0)~ EXIT
END


IF ~~ THEN BEGIN repairpst7
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#PST7b")
DestroyItem("MM#PST7b")
GiveItemCreate("MM#PST7",LastTalkedToBy(),1,0,0)~ EXIT
END


IF ~~ THEN BEGIN repairpst8
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#PST8b")
DestroyItem("MM#PST8b")
GiveItemCreate("MM#PST8",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairmcr1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#MCR1b")
DestroyItem("MM#MCR1b")
GiveItemCreate("MM#MCR1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairmcr2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#MCR2b")
DestroyItem("MM#MCR2b")
GiveItemCreate("MM#MCR2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairmcr3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#MCR3b")
DestroyItem("MM#MCR3b")
GiveItemCreate("MM#MCR3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairmcr4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#MCR4b")
DestroyItem("MM#MCR4b")
GiveItemCreate("MM#MCR4",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairmcr5
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#MCR5b")
DestroyItem("MM#MCR5b")
GiveItemCreate("MM#MCR5",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairmcr6
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#MCR6b")
DestroyItem("MM#MCR6b")
GiveItemCreate("MM#MCR6",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairmcr7
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#MCR7b")
DestroyItem("MM#MCR7b")
GiveItemCreate("MM#MCR7",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsbm1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SBM1b")
DestroyItem("MM#SBM1b")
GiveItemCreate("MM#SBM1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsbm2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SBM2b")
DestroyItem("MM#SBM2b")
GiveItemCreate("MM#SBM2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsbm3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SBM3b")
DestroyItem("MM#SBM3b")
GiveItemCreate("MM#SBM3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsbm4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SBM4b")
DestroyItem("MM#SBM4b")
GiveItemCreate("MM#SBM4",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsbm5
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SBM5b")
DestroyItem("MM#SBM5b")
GiveItemCreate("MM#SBM5",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsbm6
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SBM6b")
DestroyItem("MM#SBM6b")
GiveItemCreate("MM#SBM6",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairblt1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#BLT1b")
DestroyItem("MM#BLT1b")
GiveItemCreate("MM#BLT1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairblt2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#BLT2b")
DestroyItem("MM#BLT2b")
GiveItemCreate("MM#BLT2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairblt3
	SAY @19
	IF ~~ THEN DO ~GiveItemCreate("MM#BLT3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairblt4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#BLT4b")
DestroyItem("MM#BLT4b")
GiveItemCreate("MM#BLT4",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairblt5
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#BLT5b")
DestroyItem("MM#BLT5b")
GiveItemCreate("MM#BLT5",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairslf1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SLF1b")
DestroyItem("MM#SLF1b")
GiveItemCreate("MM#SLF1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairslf2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SLF2b")
DestroyItem("MM#SLF2b")
GiveItemCreate("MM#SLF2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairslf3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SLF3b")
DestroyItem("MM#SLF3b")
GiveItemCreate("MM#SLF3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairslf4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SLF4b")
DestroyItem("MM#SLF4b")
GiveItemCreate("MM#SLF4",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairast1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#AST1b")
DestroyItem("MM#AST1b")
GiveItemCreate("MM#AST1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairast2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#AST2b")
DestroyItem("MM#AST2b")
GiveItemCreate("MM#AST2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairast3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#AST3b")
DestroyItem("MM#AST3b")
GiveItemCreate("MM#AST3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairast4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#AST4b")
DestroyItem("MM#AST4b")
GiveItemCreate("MM#AST4",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairast5
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#AST5b")
DestroyItem("MM#AST5b")
GiveItemCreate("MM#AST5",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairast6
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#AST6b")
DestroyItem("MM#AST6b")
GiveItemCreate("MM#AST6",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairast7
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#AST7b")
DestroyItem("MM#AST7b")
GiveItemCreate("MM#AST7",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsht1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SHT1b")
DestroyItem("MM#SHT1b")
GiveItemCreate("MM#SHT1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsht2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SHT2b")
DestroyItem("MM#SHT2b")
GiveItemCreate("MM#SHT2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsht3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SHT3b")
DestroyItem("MM#SHT3b")
GiveItemCreate("MM#SHT3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsht4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SHT4b")
DestroyItem("MM#SHT4b")
GiveItemCreate("MM#SHT4",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsht5
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SHT5b")
DestroyItem("MM#SHT5b")
GiveItemCreate("MM#SHT5",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsnp1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SNP1b")
DestroyItem("MM#SNP1b")
GiveItemCreate("MM#SNP1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsnp2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SNP2b")
DestroyItem("MM#SNP2b")
GiveItemCreate("MM#SNP2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsnp3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SNP3b")
DestroyItem("MM#SNP3b")
GiveItemCreate("MM#SNP3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsnp4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SNP4b")
DestroyItem("MM#SNP4b")
GiveItemCreate("MM#SNP4",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsnp5
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SNP5b")
DestroyItem("MM#SNP5b")
GiveItemCreate("MM#SNP5",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsnp6
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SNP6b")
DestroyItem("MM#SNP6b")
GiveItemCreate("MM#SNP6",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairsnp7
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#SNP7b")
DestroyItem("MM#SNP7b")
GiveItemCreate("MM#SNP7",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairlmc1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#LMC1b")
DestroyItem("MM#LMC1b")
GiveItemCreate("MM#LMC1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairlmc2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#LMC2b")
DestroyItem("MM#LMC2b")
GiveItemCreate("MM#LMC2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairlmc3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#LMC3b")
DestroyItem("MM#LMC3b")
GiveItemCreate("MM#LMC3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairlmc4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#LMC4b")
DestroyItem("MM#LMC4b")
GiveItemCreate("MM#LMC4",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairlmc5
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#LMC5b")
DestroyItem("MM#LMC5b")
GiveItemCreate("MM#LMC5",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairgmc1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#GMC1b")
DestroyItem("MM#GMC1b")
GiveItemCreate("MM#GMC1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairgmc2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#GMC2b")
DestroyItem("MM#GMC2b")
GiveItemCreate("MM#GMC2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairgmc3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#GMC3b")
DestroyItem("MM#GMC3b")
GiveItemCreate("MM#GMC3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairgmc4
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#GMC4b")
DestroyItem("MM#GMC4b")
GiveItemCreate("MM#GMC4",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairhmc1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#HMC1b")
DestroyItem("MM#HMC1b")
GiveItemCreate("MM#HMC1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairhmc2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#HMC2b")
DestroyItem("MM#HMC2b")
GiveItemCreate("MM#HMC2",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairhmc3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#HMC3b")
DestroyItem("MM#HMC3b")
GiveItemCreate("MM#HMC3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairuav1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(200)
TakePartyItem("MM#UAV1A")
DestroyItem("MM#UAV1A")
GiveItemCreate("MM#UAV1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairuav3
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(300)
TakePartyItem("MM#UAV3A")
DestroyItem("MM#UAV3A")
GiveItemCreate("MM#UAV3",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairdog1
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(500)
TakePartyItem("MM#DOG1A")
DestroyItem("MM#DOG1A")
GiveItemCreate("MM#DOG1",LastTalkedToBy(),1,0,0)~ EXIT
END

IF ~~ THEN BEGIN repairdog2
	SAY @18
	IF ~~ THEN DO ~TakePartyGold(1000)
TakePartyItem("MM#DOG2A")
DestroyItem("MM#DOG2A")
GiveItemCreate("MM#DOG2",LastTalkedToBy(),1,0,0)~ EXIT
END
