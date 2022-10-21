--lib996:include("Script/serialize.lua")
--
--
--local cfg_npc_store = lib996:include("QuestDiary/cfgcsv/cfg_npc_store.lua")
--function openUI(actor)
--    lib996:showformwithcontent(actor, "D/NPC商城", "")
--end
----同步信息
--function SyncResponse(actor)
--    local BuyCount_data = GetBuyCountdata(actor)--获取商品购买次数信息表
--    lib996:showformwithcontent(actor, "", "NpcShop.SyncResponse("..serialize(BuyCount_data)..")")
--end
--
--function BuyGoods(actor,param1,param2)
--    if not param1 or not param2 then return end
--    local buy_index = tonumber(param1)
--    local buy_num = tonumber(param2)
--    if not cfg_npc_store[buy_index] then return end
--    local buy_data = DeepCopy(cfg_npc_store[buy_index])
--    buy_data.itemId[1][2] = buy_num
--    buy_data.price[1][2] = buy_data.price[1][2] * buy_num
--
--    local BuyCount_data = GetBuyCountdata(actor)--获取商品购买次数信息表
--
--    if buy_data.leixing then
--        if buy_num > BuyCount_data[buy_index] or BuyCount_data[buy_index] == 0 then
--            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>限购数量不足!</font>","Type":9}')
--            return
--        end
--    end
--    if not Bag.checkBagEmptyNum(actor, 1) then
--        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>包裹空间不足!</font>","Type":9}')
--        return
--    end
--    local name = QsQIsItemNumByTable(actor, buy_data.price)
--    if name then
--        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料['..name..']不足</font>","Type":9}')
--        --Player.giveItemByTable(actor, cfg.itemid1, "", 1, 0)--调试
--        return
--    end
--    if buy_data.leixing then
--        local now_count =  (BuyCount_data[buy_index] - buy_num) == 0 and -1 or (BuyCount_data[buy_index] - buy_num)
--        lib996:setint(0,actor,"NpcShopCount"..buy_index, now_count)
--    end
--    QsQtakeItemByTable(actor, buy_data.price)----拿走物品
--    Player.giveItemByTable(actor, buy_data.itemId, "", 1)--给物品
--    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>成功购买！</font>","Type":9}')
--
--    SyncResponse(actor) --同步信息
--
--    --[[if not buy_data.leixing then --不限次数
--        if not Bag.checkBagEmptyNum(actor, 1) then
--            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>包裹空间不足!</font>","Type":9}')
--            return
--        end
--        local name = QsQIsItemNumByTable(actor, buy_data.price)
--        if name then
--            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料['..name..']不足</font>","Type":9}')
--            --Player.giveItemByTable(actor, cfg.itemid1, "", 1, 0)--调试
--            return
--        end
--        QsQtakeItemByTable(actor, buy_data.price)----拿走物品
--        Player.giveItemByTable(actor, buy_data.itemId, "", 1)--给物品
--        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>成功购买！</font>","Type":9}')
--    else  --每日限购  永久限购
--        if buy_num > BuyCount_data[buy_index] or BuyCount_data[buy_index] == 0 then
--            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>限购数量不足!</font>","Type":9}')
--            return
--        end
--        if not Bag.checkBagEmptyNum(actor, 1) then
--            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>包裹空间不足!</font>","Type":9}')
--            return
--        end
--        local name = QsQIsItemNumByTable(actor, buy_data.price)
--        if name then
--            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料['..name..']不足</font>","Type":9}')
--            --Player.giveItemByTable(actor, cfg.itemid1, "", 1, 0)--调试
--            return
--        end
--        local now_count =  (BuyCount_data[buy_index] - buy_num) == 0 and -1 or (BuyCount_data[buy_index] - buy_num)
--        lib996:setint(0,actor,"NpcShopCount"..buy_index, now_count)
--        QsQtakeItemByTable(actor, buy_data.price)----拿走物品
--        Player.giveItemByTable(actor, buy_data.itemId, "", 1)--给物品
--        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>成功购买！</font>","Type":9}')
--    end]]
--
--end
--
--
--
--
--function GetBuyCountdata(actor)--获取商品购买次数信息表
--    local IsInit = lib996:getint(0,actor,"Init_NpcShop") --购买次数是否初始化 0无 1有
--    local BuyCount_data = {}
--    if IsInit == 0 then
--        for i,data in ipairs(cfg_npc_store) do
--            if data.leixing then
--                BuyCount_data[i] = data.singleLimit
--            else
--                BuyCount_data[i] = 0
--            end
--            lib996:setint(0,actor,"NpcShopCount"..i, BuyCount_data[i])
--        end
--        lib996:setint(0,actor,"Init_NpcShop", 1)
--    else
--        for i,data in ipairs(cfg_npc_store) do
--            local count = lib996:getint(0,actor,"NpcShopCount"..i)
--            count = count == -1 and 0 or count
--            BuyCount_data[i] = count
--        end
--    end
--    return BuyCount_data
--end
--
--
--function DeepCopy(obj)
--    local tbTab={}
--    local function Copy(obj)
--        if type(obj)~="table" then
--            return obj
--        end
--        --如果是这个对象已经做过拷贝就直接返回
--        --保证引用一致
--        if tbTab[obj] then
--            return tbTab[obj]
--        end
--        local newTable = {}
--        tbTab[obj]=newTable
--        for k,v in pairs(obj) do
--        --索引跟值都要做拷贝
--            newTable[Copy(k)]=Copy(v)
--        end
--        --如果有元表要带上
--        return setmetatable(newTable,getmetatable(obj))
--    end
--    return Copy(obj)
--end
--
--
---- 每日凌晨 与 每日第一次登录 调用
--local function _goDailyUpdate(actor)
--    local IsInit = lib996:getint(0,actor,"Init_NpcShop") --购买次数是否初始化 0无 1有
--    local BuyCount_data = {}
--    if IsInit == 0 then
--        for i,data in ipairs(cfg_npc_store) do
--            if data.leixing then
--                BuyCount_data[i] = data.singleLimit
--            else
--                BuyCount_data[i] = 0
--            end
--            lib996:setint(0,actor,"NpcShopCount"..i, BuyCount_data[i])
--        end
--        lib996:setint(0,actor,"Init_NpcShop", 1)
--    else
--        for i,data in ipairs(cfg_npc_store) do
--            if data.leixing == 1 then
--                lib996:setint(0,actor,"NpcShopCount"..i,data.singleLimit)
--            end
--        end
--    end
--end
--GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate,"NPC商城")