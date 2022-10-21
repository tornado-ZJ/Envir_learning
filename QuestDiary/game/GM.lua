

    --清空货币
    function usercmd10001(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 2, "=", 0, "", true)
        lib996:changemoney(actor, 5, "=", 0, "", true)
        lib996:changemoney(actor, 11, "=", 0, "", true)
        lib996:changemoney(actor, 12, "=", 0, "", true)
        lib996:changemoney(actor, 20, "=", 0, "", true)
        lib996:changemoney(actor, 23, "=", 0, "", true)
        lib996:changemoney(actor, 24, "=", 0, "", true)
        lib996:changemoney(actor, 25, "=", 0, "", true)
    end

    --rmb
    function usercmd10002(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 12, "+", 100000, "", true)
    end
    
    --充值点
    function usercmd10003(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 11, "+", 1000000, "", true)
    end
    --充值金额
    function usercmd10004(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 20, "+", 100000, "", true)
    end
    
    --爆率
    function usercmd10005(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 23, "+", 1000, "", true)
    end
    --元宝
    function usercmd10006(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 2, "+", 100000000, "", true)
    end
    
    --倍攻
    function usercmd10007(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 24, "+", 1000, "", true)
    end
    --刀刀切割
    function usercmd10008(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 25, "+", 100000000, "", true)
    end
    --名著币
    function usercmd11000(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 5, "+", 100000000, "", true)
    end

    --异域大战
    function usercmd10009(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playyydz.custom_open(actor)
    end
    function usercmd10010(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playyydz.custom_close(actor)
    end

    --大乱斗
    function usercmd10011(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playdld.custom_open(actor)
    end
    function usercmd10012(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playdld.custom_close(actor)
    end

    --任务完成
    function usercmd10100(actor, tasktype)
        if getgmlevel(actor) ~= 10 then return end
        local tasktype = tonumber(tasktype)
        if not tasktype then return end
        Task.rwwc(actor, tasktype)
    end
    --任务完成2
    function usercmd10101(actor, taskid)
        if getgmlevel(actor) ~= 10 then return end
        taskid = tonumber(taskid)
        if not taskid then return end
        Task.finish(actor, taskid)
    end
    --任务领取
    function usercmd10102(actor, taskid)
        if getgmlevel(actor) ~= 10 then return end
        taskid = tonumber(taskid)
        if not taskid then return end
        Task.receive(actor, taskid)
    end
    --任务删除
    function usercmd10103(actor, taskid)
        if getgmlevel(actor) ~= 10 then return end
        taskid = tonumber(taskid)
        if not taskid then return end
        Task.delete(actor, taskid)
    end

    function usercmd10013(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local zslevel = lib996:getbaseinfo(actor, 39)
        local next_zslevel = zslevel + 1
        lib996:setbaseinfo(actor, 39, next_zslevel)  --转生常量
        GameEvent.push(EventCfg.goZSLevelChange, actor, next_zslevel, zslevel)
    end

    function usercmd10014(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local zslevel = lib996:getbaseinfo(actor, 39)
        local next_zslevel = 0
        lib996:setbaseinfo(actor, 39, next_zslevel)  --转生常量
        GameEvent.push(EventCfg.goZSLevelChange, actor, next_zslevel, zslevel)
    end

    --全屏清怪
    function usercmd10015(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local _mapID = lib996:getbaseinfo(actor, 3)
        local x,y = lib996:getbaseinfo(actor, 4),lib996:getbaseinfo(actor, 5)
        local object = lib996:getobjectinmap(_mapID,x,y,10,2)
        if #object > 0 then
            for i, mon in ipairs(object) do
                lib996:killmonbyobj(actor,mon,true,true,true)
            end
        end
    end

    --添加道具
    function usercmd10016(actor, itemName,itemNum)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local Name = tonumber(itemName)
        if type(Name) == "number" then
            itemName = lib996:getstditeminfo(Name,1)
        end
        itemNum = tonumber(itemNum) or 1
        lib996:giveitem(actor,itemName,itemNum)
    end

    --江湖名望等级+1
    function usercmd10017(actor)
        JiangHuMingWang.GmLevelAdd(actor)
    end
    --江湖名望等级清空
    function usercmd10018(actor)
        JiangHuMingWang.GmLevelClear(actor)
    end
    --江湖名望任务
    function usercmd10019(actor)
        JiangHuMingWang.GmRw(actor)
    end

    --测试充值
    function usercmd10020(actor,num,moneyid)
        num = tonumber(num)
        moneyid = tonumber(moneyid) or ConstCfg.money.lf
        if not num then return end
        recharge(actor, num, moneyid,moneyid)
    end

     --触发每日/进入下一天
    function usercmd10104(actor)
        lib996:setint(0,actor, VarCfg.T_daily_date, 0)
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>gm执行成功,触发每日/进入下一天</font>","Type":9}')
        local logindatas = {}
        GameEvent.push(EventCfg.onLoginEnd, actor, logindatas)
    end

    --让所有行会参与今晚攻城
    function usercmd10105(actor)
        lib996:addattacksabakall()
        lib996:release_print("gm执行成功")
    end
    --清空物品
    function usercmd10106(actor)
        local tab_name = {}
        local tab_num = {}
        local item_tab = lib996:getbagitems(actor)   --获取背包所有物品对象
        for i=1,#item_tab do
            local item = item_tab[i]
            local id = lib996:getiteminfo(actor, item, 2)  --获取背包物品id
            local name = lib996:getstditeminfo(id,1)          --获取背包物品name
            local item_mun = lib996:getiteminfo(actor, item, 5)  --获取堆叠
            if item_mun == 0 then   --堆叠为0 为不堆叠 数量为1
                item_mun = 1
            end
            table.insert(tab_name,name)
            table.insert(tab_num,item_mun)
        end
        for j=1,#tab_name do
            lib996:takeitem(actor,tab_name[j],tab_num[j])
        end
    end
    --查询背包内物品
    function usercmd10107(actor)
        local tab_name = {}
        local tab_num = {}
        local tab_idx = {}
        local tab_id = {}
        local tab_item = {}
        
        local item_tab = lib996:getbagitems(actor)
        for i=1,#item_tab do
            local item = item_tab[i]
            local idx = lib996:getiteminfo(actor, item, 2)  --获取背包物品序号
            local id = lib996:getiteminfo(actor, item, 1)  --获取背包物品唯一id
            local name = lib996:getstditeminfo(idx,1)          --获取背包物品name
            local item_mun = lib996:getiteminfo(actor, item, 5)  --获取堆叠
            if item_mun == 0 then   --堆叠为0 为不堆叠 数量为1
                item_mun = 1
            end
            
            table.insert(tab_name,name)
            table.insert(tab_num,item_mun)
            table.insert(tab_idx,idx)
            table.insert(tab_id,id)
            table.insert(tab_item,item)
        end
        for j=1,#tab_name do
            lib996:release_print(" 物品ID:"..tab_idx[j].."，名字:"..tab_name[j].."，数量:"..tab_num[j].."，对象:"..tab_item[j].."，唯一ID:"..tab_id[j])
        end
    end
    --查询玩家自定义变量 @get 变量名（废弃）
    function usercmd10108(actor,var)
        local value = getplayvar(actor,var)
        lib996:release_print(type(value)..":"..var.." = "..value)
    end
    --设置玩家自定义变量 @set 变量名 变量值（废弃）
    function usercmd10109(actor,var,value)
        setplayvar(actor, "HUMAN",var,value,1)
    end
    --查询全局自定义变量 @get 变量名（废弃）
    function usercmd10110(actor,var)
        local value = getsysvarex(var)
        lib996:release_print(type(value)..":"..var.." = "..value)
    end
    --设置全局定义变量 @set 变量名 变量值（废弃）
    function usercmd10111(actor,var,value)
        setsysvarex(var,value, 1)
    end

    --刷怪
    function usercmd10112(actor, monName,monmNum)
        monmNum = monmNum or 1
        local map = lib996:getbaseinfo(actor, 3)
        local x = lib996:getbaseinfo(actor, 4) + 2
        local y = lib996:getbaseinfo(actor, 5) + 2
        local r = 3

        itemNum = tonumber(itemNum) or 1
        lib996:genmon(map,x,y,monName,r,monmNum)
    end

    --GMbox变量
    function usercmd10113(actor,gs,vartype, str1,str2,str3,str4)
        if str1 ~= "QSQ_var" then
            str1 = tonumber(str1)
        end
        if str4 == "nil" then
            str4 = nil
        end
        if vartype == "int" then
            str4 = tonumber(str4)
            if str4 == nil then
                str4 = 0
            end
        end
        if tonumber(gs) == 2 then   --获取变量
            if str1 == "QSQ_var" and str2 == "QSQ_var" then --1 和2都为空时为系统变量
                local sysvar = ""
                if vartype == "int" then
                    sysvar = lib996:getsysint(str3)
                else
                    sysvar = lib996:getsysstr(str3)
                end
                local psysvar = lib996:tbl2json(sysvar)
                lib996:release_print("系统变量 "..vartype,psysvar)
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>系统变量'..vartype.." "..psysvar..'</font>","Type":1}')

            end
            if str1 == 0 and str2 == "QSQ_var" then --有对象类型 2为空时 则是自己
                local sysvar = ""
                if vartype == "int" then
                    sysvar = lib996:getint(str1,actor,str3)
                else
                    sysvar = lib996:getstr(str1,actor,str3)
                end
                local psysvar = lib996:tbl2json(sysvar)
                lib996:release_print("本人变量 "..vartype.."类",psysvar)
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>本人变量'..vartype.." "..psysvar..'</font>","Type":1}')
            end
            if str1 ~= "QSQ_var" and str2 ~= "QSQ_var" then --有对象类型 2也有指定对象时
                local sysvar = ""
                if vartype == "int" then
                    sysvar = lib996:getint(str1,str2,str3)
                else
                    sysvar = lib996:getstr(str1,str2,str3)
                end
                local psysvar = lib996:tbl2json(sysvar)
                lib996:release_print("指定变量 "..vartype.."类",psysvar)
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>指定变量'..vartype.." "..psysvar..'</font>","Type":1}')
            end
        else        --设置变量
            if str1 == "QSQ_var" and str2 == "QSQ_var" then
                if vartype == "int" then
                    lib996:setsysint(str3,str4)
                else
                    lib996:setsysstr(str3,str4)
                end
                lib996:release_print("修改系统变量 完成")
            end
            if str1 == 0 and str2 == "QSQ_var" then
                if vartype == "int" then
                    lib996:getint(str1,actor,str3,str4)
                else
                    lib996:getstr(str1,actor,str3,str4)
                end
                lib996:release_print("修改本人变量 完成")
            end
            if str1 ~= "QSQ_var" and str2 ~= "QSQ_var" then
                if vartype == "int" then
                    lib996:getint(str1,str2,str3,str4)
                else
                    lib996:getstr(str1,str2,str3,str4)
                end
                lib996:release_print("修改指定变量 完成")
            end
        end
    end
