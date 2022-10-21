
lib996:include("Script/serialize.lua")

local cfg_qianghua = lib996:include("QuestDiary/cfgcsv/cfg_qianghua.lua")

local type_tab = 30  --强星自定义属性组

local _cfg_qianghua= {}
for i,v in ipairs(cfg_qianghua) do
    _cfg_qianghua[v.weizhi] = _cfg_qianghua[v.weizhi] or {}
    -- local _data = {weizhi = v.weizhi,level = v.level,shuxingjiacheng = v.shuxingjiacheng, itemid = v.itemid, tips = v.tips,
    -- xiaohao = v.xiaohao, }
    table.insert( _cfg_qianghua[v.weizhi], v)
end


function openUI(actor)
    lib996:showformwithcontent(actor, "D/装备强星", "")
end
--同步信息
function SyncResponse(actor)
    ---lib996:mapmove(actor, 0, 327, 269, 1)
    local state = lib996:getint(0,actor,"幸运保底勾选状态")
    local EqualStar_data = {}
    table.insert(EqualStar_data,state) --是否筛选

    lib996:showformwithcontent(actor, "", "EqualStar.SyncResponse("..serialize(EqualStar_data)..")")
end

--装备强星
function Shengji(actor,pos,selectindex)


    local pos = tonumber(pos)
    local Select_index = tonumber(selectindex)
    if not pos or not Select_index then return end

    local item = lib996:linkbodyitem(actor, pos)                     --获取位置装备
    if item ~= "0" then                                             --装备存在时
        local makeid = lib996:getiteminfo(actor,item,1)             --获取makeindex（唯一id）
        local itemobject = lib996:getitembymakeindex(actor,makeid)
        local group_attr = lib996:getitemattr(actor,makeid,type_tab)    --根据道具自定义属性组获取该组属性
        local star = 2
        local tab = _cfg_qianghua[pos][star] and _cfg_qianghua[pos][star].shuxing or nil
        local next_cfg = _cfg_qianghua[pos][star + 1]
        -- if 1 == 2 then
        --     CleanItemAttr(actor,makeid,itemobject,type_tab)
        --     return
        -- end

        if not next_cfg then
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>已满级！</font>","Type":9}')
            return
        end
        local name = QsQIsItemNumByTable(actor, next_cfg.xiaohao)
        if name then
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料['..name..']不足</font>","Type":9}')
            --lib996:giveitem(actor,name,10)--调试
            return
        end
        local state = lib996:getint(0,actor,"幸运保底勾选状态")
        if state == 1 then
            local name = QsQIsItemNumByTable(actor, next_cfg.item)
            if name then
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料['..name..']不足</font>","Type":9}')
                --lib996:giveitem(actor,name,10)--调试
                return
            end
        end

        QsQtakeItemByTable(actor, next_cfg.xiaohao)----拿走物品
        --成功率
        local Rate = math.random(1,10000)
        if Rate > next_cfg.chenggonglv then
            if state == 1 then
                QsQtakeItemByTable(actor, next_cfg.item)----拿走物品
            else
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>合成失败！</font>","Type":9}')
                lib996:delitemattr(actor, makeid, type_tab, 0) --清除 type 组的 属性
                local setstar = star - 1 <= 0 and 0 or star - 1
                local attr_tab = _cfg_qianghua[pos][setstar] and _cfg_qianghua[pos][setstar].shuxing or {}
                for i, v in ipairs(attr_tab) do
                    lib996:additemattr(actor, makeid, type_tab, v[1], v[2])  --在 type 组 中添加属性
                end
                --lib996:setitemaddvalue(actor,itemobject,2,3,setstar) --设置物品记录信息(星星)
                lib996:refreshitem(actor,itemobject)--刷新物品信息到前端
                SyncResponse(actor)
                return
            end
        end

        for i, v in ipairs(next_cfg.shuxing) do
            local value = tab and tab[i][2] or 0
            local setvalue = v[2] - value
            lib996:additemattr(actor, makeid, type_tab, v[1], setvalue)  --在 type 组 中添加属性
        end

        --lib996:setitemaddvalue(actor,itemobject,2,3,5) --设置物品记录信息(星星)
        --lib996:refreshitem(actor,itemobject)--刷新物品信息到前端


        SyncResponse(actor)
    else
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>请穿戴装备后再进行操作！</font>","Type":9}')
        return
    end


end

function Setcheckboxstate(actor,param)
    local state = tonumber(param)
    if not state then return end
    state = state == 0 and 1 or 0
    lib996:setint(0,actor,"幸运保底勾选状态", state)
    SyncResponse(actor)
end


function CleanItemAttr(actor,makeid,itemobject,type_tab)
    lib996:delitemattr(actor, makeid, type_tab, 0) --清除 type 组的 属性
    lib996:setitemaddvalue(actor,itemobject,2,3,0) --设置物品记录信息(星星)
    lib996:refreshitem(actor,itemobject)--刷新物品信息到前端
end

