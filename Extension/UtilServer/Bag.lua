Bag = {}

--��ȡ��Ʒ����
function Bag.getItemNumByIdx(actor, idx)
 	local count = 0
  	local item_num = lib996:getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = lib996:getiteminfobyindex(actor, i)
		local itemidx = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
		if itemidx == idx then
			local item_mun = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.overlap)
			if item_mun == 0 then
				item_mun = 1
			end
			count = count + item_mun
		end
	end
	
  	return count
end

--�����Ʒ����
function Bag.checkItemNumByIdx(actor, idx, num)
	num = num or 1
	local count = Bag.getItemNumByIdx(actor, idx)
	return count >= num
end

--��ȡ�����ո�����
function Bag.getBagEmptyNum(actor)
	local item_num = lib996:getbaseinfo(actor, ConstCfg.gbase.bag_num)
	local openNum = lib996:getplaydef(actor, VarCfg.U_Bag_OpenNum)
	return ConstCfg.bagcellnum + openNum - item_num
end

--��鱳���ո�����
function Bag.checkBagEmptyNum(actor, num)
	local empty_num = Bag.getBagEmptyNum(actor)
	return empty_num >= num
end

--��鱳���Ƿ��㹻������Ʒ items
function Bag.checkBagEmptyItems(actor, items)
	local bagEmptyNum = Bag.getBagEmptyNum(actor)
	local needEmptyNum = 0
	for _,item in ipairs(items) do
        local idx,num = item[1],item[2]
        if not Item.isCurrency(idx) then    --��Ʒ װ��
			needEmptyNum = needEmptyNum + 1
        end
    end
	return bagEmptyNum >= needEmptyNum
end

--��ȡ������ĳ����Ʒ����
function Bag.getItemObjByIdx(actor, idx)
	local item_num = lib996:getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = lib996:getiteminfobyindex(actor, i)
		local itemidx = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
		if itemidx == idx then
			return itemobj
		end
	end
end

--��ȡ������ĳ����ƷΨһid
function Bag.getItemMakeIdByIdx(actor, idx)
	local itemobj = Bag.getItemObjByIdx(actor, idx)
	if not itemobj then return end
	return lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
end

--��鱳���Ƿ���ĳ����Ʒ������ͨ��Ψһid
function Bag.checkItemNumByMakeIndex(actor, makeindex, num)
	num = num or 1

	local item_num = lib996:getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = lib996:getiteminfobyindex(actor, i)
		local itemmakeid = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
		if itemmakeid == makeindex then
			if num > 1 then
				local overlap = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.overlap)
				if overlap < num then return false end
			end
			return true
		end
	end

	return false
end

--��ȡ������ĳ����Ʒ����ͨ��ΨһID
function Bag.getItemObjByMakeIndex(actor, makeindex)
	local item_num = lib996:getbaseinfo(actor, ConstCfg.gbase.bag_num)
	for i=0, item_num-1 do
		local itemobj = lib996:getiteminfobyindex(actor, i)
		local itemmakeindex = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.id)
		if itemmakeindex == makeindex then
			return itemobj
		end
	end
end


return Bag