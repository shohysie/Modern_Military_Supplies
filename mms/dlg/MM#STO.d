BEGIN ~MM#STO~

IF ~AreaCheck("AR5400")~
THEN BEGIN firstmeet1
	SAY @160	//��ð������ѡ�
	IF ~~ THEN REPLY @170 GOTO firstmeet2	//��ã�����������ʲô�أ�
END

IF ~~ THEN BEGIN firstmeet2
	SAY @161	//���ڲ��������������Ʒ�ܲ������������ʹ�á��ⶴ��ʱ��ʱð�������е�С����Ϯ����ͨ�ˣ��ǺܺõĲ��Զ���
	IF ~~ THEN REPLY @171 GOTO firstmeet3	//�ǲ��ԵĽ������������������
	IF ~~ THEN REPLY @172 EXIT	//���Ҳ��������ˡ�
END

IF ~~ THEN BEGIN firstmeet3
	SAY @162	//��Ϊ����Ĺ����е㲻һ������Щ�����Ĺ����е�ƫ�룬���ô󲿷ֶ�ͦ������
	IF ~~ THEN REPLY @173 GOTO firstmeet4	//�ҿ��Կ���������Щ��Ʒ����ͦ����Ȥ�ģ����Գ�Ǯ��һ�㡣
	IF ~~ THEN REPLY @172 EXIT	//���Ҳ��������ˡ�
END

IF ~~ THEN BEGIN firstmeet4
	SAY @163	//������û�����ٶ����������㿴����ͦ���ǵģ�������һЩ�����ɣ�����ôֵǮ����Ӧ���õ��ϡ����㷢���ˣ�������֮�ŵ������ӻ����¥���ҡ�
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
	SAY @10	//�ܸ��˼����㣬����Ȥ����������һ�����������װ����
	IF ~~ THEN REPLY @100 DO ~StartStore("MM#STO",LastTalkedToBy())~ EXIT	//���ҿ�����Ļ��
	IF ~~ THEN REPLY @101 GOTO wddesc	//�ܽ���һ�����������
	IF ~~ THEN REPLY @102 GOTO wpdesc	//�ܽ���һ���������װ����
	IF ~!NumberOfTimesTalkedTo(0)~ THEN REPLY @103 GOTO repair	//�ϴ���������Ķ������ˣ���Ҫ����
	IF ~~ THEN REPLY @104 GOTO notice	//���������ú���Щǹе����ʲô��Ҫע�����
	IF ~~ THEN REPLY @124 EXIT	//�´���˵�ɣ���Ҫ���ˡ�
END

IF ~~ THEN BEGIN wddesc
	SAY @11	//������һ��û�����ħ�������磬�������ר���ڲ��Ϻ͹��ա��ҵĻ����������һ�㡣
	IF ~~ THEN REPLY @100 DO ~StartStore("MM#STO",LastTalkedToBy())~ EXIT	//���ҿ�����Ļ��
	IF ~~ THEN REPLY @102 GOTO wpdesc	//�ܽ���һ���������װ����
	IF ~!GlobalGT("MM#MEET","GLOBAL",3)~ THEN REPLY @125 DO ~SetGlobal("challenge","LOCALS",1)~ GOTO challenge	//����������ս����ʶһ�����ǲ��Ϻ͹��յ����ܡ�
	IF ~~ THEN REPLY @124 EXIT	//�´���˵�ɣ���Ҫ���ˡ�
END

//��ս
IF ~Global("MM#MEET","GLOBAL",3)~ THEN BEGIN challenge
	SAY @13	//����ս�����Ǿ��õ�ɻ�����������ɡ�
	IF ~~ THEN DO ~CreateCreatureObject("MM#TANK",Myself,0,0,0)
CreateVisualEffectObject("SPPORTAL","MM#TANK")
SetGlobal("MM#MEET","GLOBAL",4)
Deactivate(Myself)~ EXIT
END

//��սʤ��
IF ~Global("MM#MEET","GLOBAL",5)~ THEN BEGIN sendtank
	SAY @14	//�ɵĲ�����Ȼ���Ǵ�ܵ���һ����ǰ���ϹŶ���������㵱����ɡ�
	IF ~~ THEN DO ~GiveItemCreate("MM#TANK",[PC],0,0,0)
SetGlobal("MM#MEET","GLOBAL",6)~ EXIT
END

IF ~~ THEN BEGIN wpdesc
	SAY @15	//����������װ���Ľ��ܣ�
	IF ~~ THEN REPLY @110 GOTO wp01	//��ǹ��
	IF ~~ THEN REPLY @111 GOTO wp02	//���ǹ��
	IF ~~ THEN REPLY @112 GOTO wp03	//��ǹ��
	IF ~~ THEN REPLY @113 GOTO wp04	//����ǹ��
	IF ~~ THEN REPLY @114 GOTO wp05	//�ѻ�ǹ��
	IF ~~ THEN REPLY @115 GOTO wp06	//��ǹ��
	IF ~~ THEN REPLY @116 GOTO wp07	//ǹ����
	IF ~~ THEN REPLY @117 GOTO wp08	//�̵���
	IF ~~ THEN REPLY @118 GOTO wp09	//���񵯡�
	IF ~~ THEN REPLY @119 GOTO wp10	//���ס�
	IF ~~ THEN REPLY @120 GOTO wp11	//���ס�
	IF ~~ THEN REPLY @121 GOTO wp12	//���˱�����
	IF ~~ THEN REPLY @122 GOTO wp13	//��Щװ���᲻�ỵ����
	IF ~~ THEN REPLY @100 DO ~StartStore("MM#STO",LastTalkedToBy())~ EXIT	//���ҿ�����Ļ��
	IF ~~ THEN REPLY @124 EXIT	//�´���˵�ɣ���Ҫ���ˡ�
END

IF ~~ THEN BEGIN wp01
	SAY @20	//��ǹ��һֻ�־����õĻ������������ɣ������󲿷���ǹ���ӵ���͸����������ޣ����ϴ����ؼ׵��˿���Ч����̫�ã���ȻҲ�����⡣
	IF ~~ THEN GOTO wp01a
END

IF ~~ THEN BEGIN wp01a
	SAY @21	//���������Ķ��Ƿ��Զ���ǹ��ֻ��һǹһǹ���ܵ���ɨ�䡣
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp02
	SAY @23	//���ǹ���ӵ�����ǹһ������͸����������ޣ����������Ϳ��԰���ɨ��ɸ�ӣ���սǿ���ޱȡ�
	IF ~~ THEN GOTO wp02a
END

IF ~~ THEN BEGIN wp02a
	SAY @24	//���ǹ���Խ��г��̵����ɨ�䣬�Ե�����������ʵʩ���������΢�ͳ��ǹ���־����ã�������Ҫ��ֻ�֡�
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp03
	SAY @26	//��ǹ������ӵ���͸��ǿ�����������װ�û���׵ĵ�������򴩵�������������ȫ���ӣ����Ϻ��ص����׵��Ǹպÿ����ü��ٱ��ε��ӵ��ڵ��������﷢쮡�
	IF ~~ THEN GOTO wp03a
END

IF ~~ THEN BEGIN wp03a
	SAY @27	//��������˨�������Զ����Զ���ǹ��˨����ǹ���ֶ��ϵ������Զ���ǹ���Զ��ϵ������߶�����һǹһǹ���Զ���ǹ���Խ��г��̵��䣬�Ե�����������ʵʩ���������
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp04
	SAY @30	//����ǹ����һǹ����ܶ��С���飬���װ��˴�úܲҡ���������̫Զ�������ӵ���͸������ǹ�������Ƚ��ʺ������Ը�û�����׵ĵ��ˡ�������������������
	IF ~~ THEN GOTO wp04a
END

IF ~~ THEN BEGIN wp04a
	SAY @31	//����ǹ������һ��һ��Ƭ����Ȼ�Զ�����ǹ�ǿ��Ե���ɨ��ģ�ֻ�Ǽ۸�����һ������
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp05
	SAY @33	//�ѻ�ǹ��һ�ֺܾ�׼�Ĳ�ǹ�����и���׼������ԶԶ��׼���ٴ򣬵��˱���������֪�������Ķ��ء�
	IF ~~ THEN GOTO wp05a
END

IF ~~ THEN BEGIN wp05a
	SAY @34	//����ʹ�þѻ�ǹ��ü�������׼������û��ô�죬Ҳû������ǹ��������·��
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp06
	SAY @36	//��ǹ���Կ����ܳ�ʱ������������з�����ѹ�ƵĲ�ǹ����������ʽ����ĵ�һ��ʹ������������أ��Ų������㡣
	IF ~~ THEN GOTO wp06a
END

IF ~~ THEN BEGIN wp06a
	SAY @37	//���ǹ���Զ�����һ�ߴ�һ���ƶ��������������������׼��ͨ�û�ǹ���ػ�ǹ������ʹ�ýżܣ�׼��������ת����ض���Ҫʱ�䡣
	IF ~~ THEN GOTO wp06b
END

IF ~~ THEN BEGIN wp06b
	SAY @38	//��ǹ���Խ��г��̵����ɨ�䣬���ʺ϶Ը������ĵо��ڻҡ�
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp07
	SAY @41	//ǹ�����û�ҩ�ƶ��Ľ����飬�����ٶȷǳ��죬�۾���ȫ����������һ�����۵Ĺ���ͬ��ǹ���кܸ߸������������﷭���������ѣ���������Ԥ�ϵĺ������������˺�����Ѫ���зϡ����Եȵȡ�
	IF ~~ THEN GOTO wp07a
END

IF ~~ THEN BEGIN wp07a
	SAY @42	//ǹ������ʽ�кü��֣�������ʽ���ӵ����Լ����෢ǹ���ĵ�ϻ�����Ļ��е����������ӵ����Ե�����������ĵ�ϻ���Խ��ж̵��䣬�Ե������˶�ι��������ĵ��Ŀ��Խ��г����䣬��һ���Ƕȷ�Χ�ڵĶ�����˽����������������ĵ�������ɨ�����Χ�ڵĵ��ˡ�
	IF ~~ THEN GOTO wp07b
END

IF ~~ THEN BEGIN wp07b
	SAY @43	//����ǹ֧�ֵĹ���ģʽ��һ�����е�ֻ�ܵ���������еĿ���ɨ�䣬��Ҫ�䱸�ʺϵĵ�ҩ�����䲻�ʺϵĵ�ҩ��û��Ч���ġ�
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp08
	SAY @45	//�̵��Ǹ�ǹеʹ�õĽ�ս�ⲫ��������Ҫ�ֶ����ϣ�Ȼ��Ϳ��԰�ǹ���ɶ�ì���̻����Դ̲����Ķ��ֻ�������ǹ���ҡ�������Զ���������ƣ�̫����ǹе�ڱ����˿���ʱ��ܳԿ�������ǹ��û��������⡣
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp08a
	SAY @46	//���ڹ���ǹ����Ѹ���һ�׸�ħ�̵����������٣�
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp09
	SAY @48	//���񵯶�׼�˻��߿յ��Ӿ����ˣ��������ˡ�����ͨ����Ҳ���������񵯣�ʹ��ǰ����ϸ�Ķ�˵���顣
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp10
	SAY @50	//���׿���Ԥ�������ڵ��ϣ�·���ᴥ����ը���������ˡ��еĵ��׻���ֱ�ӶԵ��˷��䣬��������ϸ�Ķ�˵���顣
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp11
	SAY @52	//��������һ��˫��������Ҫ�����Ƿ����ӵ����������Ҳ��һ���ķ���������
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp12
	SAY @54	//���˱������ڲ���Ҫ�����߱��˵���������½�����顢���������Ա���������˱������ɿ�ң�ص�ħ��ͺá�
	IF ~~ THEN GOTO wpdesc
END

IF ~~ THEN BEGIN wp13
	SAY @16	//�һ����һЩ��ά�޼��ܣ�Ҳ�ḽ�����������΢����������Լ��㶨��Ҫ����̫���أ����ù��������ްɣ�ֻ��������á�
	IF ~~ THEN GOTO wpdesc
END

//ʹ���ĵ�
IF ~~ THEN BEGIN notice
	SAY @60	//ǹе�Ļ���ʹ��ԭ��ܼ򵥣�ʹ����׼������һ�ߣ����������ȶ�������Խ���ǹе������Խ�󣬿�ǹʱҪ����ȷ�����ư�ǹ��ס��
	IF ~~ THEN REPLY @105 GOTO notice1	//��������ʮ�ֹ��е�������Ҷ�ʮ�ֹ����յ÷ǳ��ã�����Ҫר��ѧϰʹ��ǹе��
END

IF ~~ THEN BEGIN notice1
	SAY @61	//ʮ�ֹ���ʹ�þ��������������Ҫ��ͷ��ʼ��Ϥǹе���ҿ�����Ѹ�����ѵһ�³���ʹ�ü��ɣ�Ȼ�����ѵ����Ҫ�շ��ˡ�
	IF ~~ THEN GOTO notice2
END

IF ~~ THEN BEGIN notice2
	SAY @62	//ע����Щȫ�Զ�ǹе�������ĺ���������������������У���Ҫ��ǹ��ѹס�������Ҫ���鼼�ɡ��ر�����Щ���ٿ���������Զ�ǹе�����ռ������ø����ӵ����е��ˡ�
	IF ~!HasItem("MM#qtn",Myself)~ THEN REPLY @106 GOTO train	//����Ҫ����ǹе��ѵ��
	IF ~HasItem("MM#qtn",Myself)~ THEN REPLY @107 GOTO quintain	//��Ҫ����֪���Լ����յ�ʲô�̶����أ�
	IF ~~ THEN REPLY @124 EXIT	//�´���˵�ɣ���Ҫ���ˡ�
END

//��ѵ	
IF ~~ THEN BEGIN train
	SAY @63	//�������������ˮ׼���þ������㰲��ʲô����ѵ����
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",0))~ THEN GOTO train0
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",1))~ THEN GOTO train1
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",2))~ THEN GOTO train2
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",3))~ THEN GOTO train3
	IF ~TriggerOverride(LastTalkedToBy(),Global("MM#PRF","Locals",4))~ THEN GOTO train4
	IF ~TriggerOverride(LastTalkedToBy(),GlobalGT("MM#PRF","Locals",4))~ THEN GOTO train5
END

IF ~~ THEN BEGIN train0
	SAY @64	//��û�������κε�ǹеʹ�ü��ɣ��ҿ��������ѵ�㵽ר����1�ǣ���ˮƽ��
	IF ~~ THEN REPLY @108 DO ~ReallyForceSpellRES("MM#PRF0I",LastTalkedToBy())
AdvanceTime(ONE_HOUR)
StartCutSceneMode()
StartCutScene("MM#train")~ EXIT	//�õģ����ھͿ�ʼѵ���ɡ�
	IF ~~ THEN REPLY @124 EXIT	//�´���˵�ɣ���Ҫ���ˡ�
END

IF ~~ THEN BEGIN train1
	SAY @65	//��ʹ��ǹе�Ѿ���ר����1�ǣ���ˮƽ���ҿ����������һ��������Ҫһ���1000��ҡ�
	IF ~PartyGoldGT(999)~ THEN REPLY @108 DO ~ReallyForceSpellRES("MM#PRF1I",LastTalkedToBy())
RestParty()
TakePartyGold(1000)
DestroyGold(1000)
AdvanceTime(EIGHT_HOURS)
StartCutSceneMode()
StartCutScene("MM#train")~ EXIT	//�õģ����ھͿ�ʼѵ���ɡ�
	IF ~!PartyGoldGT(1999)~ THEN REPLY @109 EXIT	//�Եȣ���ȥȡЩǮ����
	IF ~~ THEN REPLY @124 EXIT	//�´���˵�ɣ���Ҫ���ˡ�
END

IF ~~ THEN BEGIN train2
	SAY @66	//��ʹ��ǹе�Ѿ���ר����2�ǣ���ˮƽ���ҿ����������һ��������Ҫ�����2000��ҡ�
	IF ~PartyGoldGT(1999)~ THEN REPLY @108 DO ~ReallyForceSpellRES("MM#PRF2I",LastTalkedToBy())
RestParty()
TakePartyGold(2000)
DestroyGold(2000)
AdvanceTime(SIXTEEN_HOURS)
StartCutSceneMode()
StartCutScene("MM#train")~ EXIT	//�õģ����ھͿ�ʼѵ���ɡ�
	IF ~!PartyGoldGT(1999)~ THEN REPLY @109 EXIT	//�Եȣ���ȥȡЩǮ����
	IF ~~ THEN REPLY @124 EXIT	//�´���˵�ɣ���Ҫ���ˡ�
END

IF ~~ THEN BEGIN train3
	SAY @67	//��ʹ��ǹе�Ѿ��д�ʦ��3�ǣ���ˮ׼����û���������İ����������������ս�������л��۾��顣
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN train4
	SAY @68	//��ʹ��ǹе�Ѿ�����ʦ��4�ǣ���ˮ׼����û���������İ����������������ս�������л��۾��顣
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN train5
	SAY @69	//��ʹ��ǹе�Ѿ��д���ʦ��5�ǣ���ˮ׼���Ѿ�����Ҫ��ѵ���ˣ�������Щǹе��ԭ����Ҳû�ж������ܱ����õú��ˡ�
	IF ~~ THEN EXIT
END

IF ~GlobalGT("trained","LOCALS",0)~ THEN BEGIN train6
	SAY @70	//����ǹ��ˮƽ�����Ѿ������ˡ����������Ҫ��ѵ�Ķ�Ա�����������ҡ�
	IF ~~ THEN DO ~SetGlobal("trained","LOCALS",0)~ EXIT
END

IF ~~ THEN BEGIN quintain
	SAY @71	//���г�ǹ���ӵ����ţ���ʱ�����ʮ�ֹ������ȾͿ��ԡ�
	IF ~~ THEN GOTO wpdesc
END

//����
IF ~~ THEN BEGIN repair
	SAY @16	//��Ҫ���ĸ���
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
	IF ~~ THEN REPLY @123 EXIT	//�����뻹�����ˡ�
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
