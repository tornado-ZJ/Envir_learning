
lib996:include("Script/serialize.lua")

local cfg_qianghua = lib996:include("QuestDiary/cfgcsv/cfg_qianghua.lua")

local type_tab = 30  --ǿ���Զ���������

local _cfg_qianghua= {}
for i,v in ipairs(cfg_qianghua) do
    _cfg_qianghua[v.weizhi] = _cfg_qianghua[v.weizhi] or {}
    -- local _data = {weizhi = v.weizhi,level = v.level,shuxingjiacheng = v.shuxingjiacheng, itemid = v.itemid, tips = v.tips,
    -- xiaohao = v.xiaohao, }
    table.insert( _cfg_qianghua[v.weizhi], v)
end


function openUI(actor)
    lib996:showformwithcontent(actor, "D/װ��ǿ��", "")
end
--ͬ����Ϣ
function SyncResponse(actor)
    ---lib996:mapmove(actor, 0, 327, 269, 1)
    local state = lib996:getint(0,actor,"���˱��׹�ѡ״̬")
    local EqualStar_data = {}
    table.insert(EqualStar_data,state) --�Ƿ�ɸѡ

    lib996:showformwithcontent(actor, "", "EqualStar.SyncResponse("..serialize(EqualStar_data)..")")
end

--װ��ǿ��
function Shengji(actor,pos,selectindex)


    local pos = tonumber(pos)
    local Select_index = tonumber(selectindex)
    if not pos or not Select_index then return end

    local item = lib996:linkbodyitem(actor, pos)                     --��ȡλ��װ��
    if item ~= "0" then                                             --װ������ʱ
        local makeid = lib996:getiteminfo(actor,item,1)             --��ȡmakeindex��Ψһid��
        local itemobject = lib996:getitembymakeindex(actor,makeid)
        local group_attr = lib996:getitemattr(actor,makeid,type_tab)    --���ݵ����Զ����������ȡ��������
        local star = 2
        local tab = _cfg_qianghua[pos][star] and _cfg_qianghua[pos][star].shuxing or nil
        local next_cfg = _cfg_qianghua[pos][star + 1]
        -- if 1 == 2 then
        --     CleanItemAttr(actor,makeid,itemobject,type_tab)
        --     return
        -- end

        if not next_cfg then
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>��������</font>","Type":9}')
            return
        end
        local name = QsQIsItemNumByTable(actor, next_cfg.xiaohao)
        if name then
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>����['..name..']����</font>","Type":9}')
            --lib996:giveitem(actor,name,10)--����
            return
        end
        local state = lib996:getint(0,actor,"���˱��׹�ѡ״̬")
        if state == 1 then
            local name = QsQIsItemNumByTable(actor, next_cfg.item)
            if name then
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>����['..name..']����</font>","Type":9}')
                --lib996:giveitem(actor,name,10)--����
                return
            end
        end

        QsQtakeItemByTable(actor, next_cfg.xiaohao)----������Ʒ
        --�ɹ���
        local Rate = math.random(1,10000)
        if Rate > next_cfg.chenggonglv then
            if state == 1 then
                QsQtakeItemByTable(actor, next_cfg.item)----������Ʒ
            else
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>�ϳ�ʧ�ܣ�</font>","Type":9}')
                lib996:delitemattr(actor, makeid, type_tab, 0) --��� type ��� ����
                local setstar = star - 1 <= 0 and 0 or star - 1
                local attr_tab = _cfg_qianghua[pos][setstar] and _cfg_qianghua[pos][setstar].shuxing or {}
                for i, v in ipairs(attr_tab) do
                    lib996:additemattr(actor, makeid, type_tab, v[1], v[2])  --�� type �� ���������
                end
                --lib996:setitemaddvalue(actor,itemobject,2,3,setstar) --������Ʒ��¼��Ϣ(����)
                lib996:refreshitem(actor,itemobject)--ˢ����Ʒ��Ϣ��ǰ��
                SyncResponse(actor)
                return
            end
        end

        for i, v in ipairs(next_cfg.shuxing) do
            local value = tab and tab[i][2] or 0
            local setvalue = v[2] - value
            lib996:additemattr(actor, makeid, type_tab, v[1], setvalue)  --�� type �� ���������
        end

        --lib996:setitemaddvalue(actor,itemobject,2,3,5) --������Ʒ��¼��Ϣ(����)
        --lib996:refreshitem(actor,itemobject)--ˢ����Ʒ��Ϣ��ǰ��


        SyncResponse(actor)
    else
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>�봩��װ�����ٽ��в�����</font>","Type":9}')
        return
    end


end

function Setcheckboxstate(actor,param)
    local state = tonumber(param)
    if not state then return end
    state = state == 0 and 1 or 0
    lib996:setint(0,actor,"���˱��׹�ѡ״̬", state)
    SyncResponse(actor)
end


function CleanItemAttr(actor,makeid,itemobject,type_tab)
    lib996:delitemattr(actor, makeid, type_tab, 0) --��� type ��� ����
    lib996:setitemaddvalue(actor,itemobject,2,3,0) --������Ʒ��¼��Ϣ(����)
    lib996:refreshitem(actor,itemobject)--ˢ����Ʒ��Ϣ��ǰ��
end

