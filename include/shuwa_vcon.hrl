%%--------------------------------------------------------------------
%% Copyright (c) 2020 DGIOT Technologies Co., Ltd. All Rights Reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-define(MaxVmeter, 10).


%%Topic订阅
%%--------------------------------------------------------------------
%%抄表任务 电表回复
-define(METER_ACK(Vcaddr, Di, Datetime), <<"vsw/", VcAddr/binary, "/", Di/binary, "/", Datetime/binary>>).

-define(VMOTE_TOPIC(AppEui, DevEui), <<"vmote/", AppEui/binary, "/", DevEui/binary>>).

%% 抄表任务下发至电表
-define(VMETER_TOPIC(VcAddr, Pn), list_to_binary(lists:concat(["vmeter/", binary_to_list(VcAddr), "/", binary_to_list(Pn)]))).
%% 抄表任务上报至数据库
-define(VTASK_TOPIC(VcAddr), list_to_binary(lists:concat(["vtask/", binary_to_list(VcAddr)]))).
%% 下发到虚拟表
%%需要开启shuwa_Vconcentator.conf is_send_test = true
-define(VDEVICE_TOPIC(_VcAddr), list_to_binary(lists:concat(["vdevice/v", random:uniform(?MaxVmeter)]))).

%%前置机接受
-define(MSC_RECV_TOPIC(VCADDR), <<"msc/", VCADDR/binary>>).
%%虚拟前置机接受主站
-define(VMSC_RECV_TOPIC(VCADDR), <<"vmsc/", VCADDR/binary>>).
-define(SEND_WEB_TOPIC(Session), <<"web/", Session/binary>>).
%%通道上行报文 核心网 收
-define(TOPIC_SEND(AppEui), <<"ni/rx/", AppEui/binary>>).
%%下行抄表数据 核心网 发
-define(TOPIC_RECV(AppEui), <<"ni/tx/", AppEui/binary>>).

%%页面抄表任务
-define(OPER_SCH_RECV(VCADDR, PN, DI), <<"oper_sch/recv/", VCADDR/binary, "/", PN/binary, "/", DI/binary>>).
-define(OPER_SCH_RECV(VCADDR, PN, DI, TIME), <<"oper_sch/recv/", VCADDR/binary, "/", PN/binary, "/", DI/binary, "/", TIME/binary>>).
-define(OPER_SCH_RECV(DEVADDR), <<"oper_sch/recv/", DEVADDR/binary>>).


%%--------------------------------------------------------------------
%%上行规约对应
-define(PROTO_DLT645_97, <<"00">>). % 00H：DL/T645-1997 规约；
-define(PROTO_DLT645_07, <<"01">>). % 01H：DL/T645-2007 规约；
-define(PROTO_GUANGDONG_97, <<"02">>). % 02H：广东 97 电表规约；
-define(PROTO_GUANGDONG_07, <<"03">>). % 03H：广东 07 电表规约；
-define(PROTO_WEISHENG, <<"04">>). % 04H：威胜自定义规约；
-define(PROTO_LANJIER_B, <<"05">>). % 05H：兰吉尔 B 表规约；
-define(PROTO_LANJIER_D, <<"06">>). % 06H：兰吉尔 D 表规约；
-define(PROTO_EDMI, <<"07">>). % 07H：EDMI 表规约；
-define(PROTO_ABB, <<"08">>). % 08H：ABB 方表规约；
-define(PROTO_AITUOLI, <<"09">>). % 09H：埃托利表规约；
-define(PROTO_EMAIL, <<"0A">>). % 0AH：EMAIL 表规约；
-define(PROTO_OTHER, <<"0B">>). % 0BH：其他规约
-define(PROTO_DLMS, <<"20">>).  % 10H：DLMS规约

%%主站规约
%%1、广东1003规约
%%2、南网上行通信规约
%%3、国网1376.1规约
-define(MS_PROTO_GUANGDONG, 1).   %%广东上行规约
-define(MS_PROTO_NANWANG,2).   %%南网上行规约
-define(MS_PROTO_GUOWANG, 3).   %%国网行规约


%%采集通道类型
-define(CH_GPRS, 1).        %1	GPRS/CDMA通道
-define(CH_LTE, 2).        %2	LTE通道
-define(CH_LORA, 3).         %3	LoRa通道
-define(CH_MICROPOWER, 4).  %4	微功率通道
-define(CH_RS485, 5).       %5	RS232/RS485通道
-define(CH_IR, 2).          %6	红外通道
-define(CH_NBIOT, 7).       %7	NB-IoT通道
-define(CH_PLC, 8).        %8	载波通道
-define(CH_ZETA, 9).        %9	Zeta通道
-define(CH_ZIGBEE ,10).     %10	ZigBee通道
-define(CH_PON, 11).        %11	光纤通道
-define(CH_NETWORK_CABLE, ).%12	网线连接
-define(CH_5G, 13).         %13	5G通道
-define(CH_WIFI, 14).       %14	WIFI通道
-define(CH_RS422, 15).      %15	RS422通道
-define(CH_NFC, 16).        %16	NFC通道
-define(CH_BLUETOOTH, 17).  %17	Bluetooth通道

%%传输类型
%%1	透明传输
%%2	加密传输
-define(PASS_THROUGH,1).
-define(PASS_ENCODE,2).

%%加密协议类型
-define(ENCODE_LORAWAN,1).
-define(ENCODE_LOWAN,2).
-define(ENCODE_NBIOT,2).


%%接入通道类型：
%%
%%1	物理通道	物理集中器、DTU
%%2	虚拟通道	虚拟集中器
%%3	混合通道
%%
%%接入协议：
%%MQTT
%%TCP
%%UDP
%%HTTP

%%通道类型
-define(ROUTE_485_1, <<"00">>).  %00H~1EH 表示 485 端口 1~31；
-define(ROUTE_PLC, <<"1F">>).  %1FH 表示载波通道
-define(ROUTE_WIRELESS, <<"20">>).  %20H 表示无线；
-define(ROUTE_4G, <<"40">>).  %4G
-define(ROUTE_LORA, <<"41">>).  %LORA；
-define(ROUTE_GPRS, <<"42">>).  %GPRS
-define(ROUTE_NB, <<"43">>).  %NB_IOT
-define(ROUTE_RF, <<"44">>).  %RF；
-define(ROUTE_NANWANG, <<"50">>).  %物理集中器，南网上行
-define(ROUTE_GUANGDONG, <<"51">>).  %物理集中器，广东

-define(METER_CHANNEL, 1). %虚拟通道
-define(DCU_CHANNEL, 2). %物理通道


-define(IO424T, <<"io424t">>).
-define(MOD_BUS, <<"modbus">>).
-define(PUMP_PROTO, <<"pump_proto">>).
-define(DTU_LORA, <<"DTU_LORA">>).
-define(DTU_NB, <<"DTU_NB">>).
-define(DTU_GPRS, <<"DTU_GPRS">>).
-define(DTU_4G, <<"DTU_4G">>).
-define(DLT645, <<"DLT645">>).
-define(GDW376S, <<"gdw376s">>).
-define(GDW1376, <<"gdw1376">>).
-define(GDW1003, <<"gdw1003">>).
-define(GDW698, <<"gdw698">>).%%国网
-define(LOWAN, <<"LOWAN">>).
-define(LOWANDLT645, <<"LOWANDLT645">>).
-define(APPEUI_PLC, <<"c4cd82096a4837c1">>).
-define(SUKE, <<"SUKE">>).
-define(ZETA, <<"zeta">>).

-define(SHUWA_DEBUG, true).

-define(SHUWA_VMAIN_SERVER, <<"VMAIN_SER">>). %模拟南网主站，连虚拟集中器
-define(SHUWA_VMAIN_CLIENT, <<"VMAIN_CLI">>). %虚拟机集中器客户端
-define(SHUWA_PMAIN_SERVER, <<"PMAIN_SER">>). %数蛙南网集中器，连物理集中器
-define(SHUWA_PMAIN_CLIENT, <<"PMAIN_CLI">>). %模拟物理集中器客户端

%% 全局topic，每个节点都会有
-define(GLOBAL_TOPIC, <<"topic/shuwa">>).

-define(TIMEZONE, + 8).

-define(RELOAD, {23, 5, 0}).

-define(IS_REG, true).

-define(ALIYUN_VERSION, "2017-03-21").
-define(PUSH_KEY, "GE6T01xiXY").
-define(LIVE_KEY, "rzdZr5nvtc").
-define(PUSH_URL, "rtmp://push.iotn2n.com").
-define(LIVE_URL_RTMP, "rtmp://live.iotn2n.com").
-define(LIVE_URL_HTTP, "http://live.iotn2n.com").
-define(SignatureVersion, "1.0").
-define(AccessKeyId, <<"LTAI2jscIxezgvmt">>).
-define(AccessKeySecret, <<"WsVErdNZsfoX4PUaQZ4KkALT2Lc98o">>).
-define(DomainName, "http://vod.cn-shanghai.aliyuncs.com").
-define(UPLOAD_CALLBACK_URL, "http://45.40.204.194:8081").

-define(UPLOAD_HOST, "http://shuwapump.oss-cn-shanghai.aliyuns.com").
